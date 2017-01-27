{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}
module Main where

import Control.Exception (assert)
import Control.Monad
import Data.Aeson (ToJSON(..), FromJSON(..), eitherDecode)
import qualified Data.Aeson as Aeson
import qualified Data.Algorithm.Diff as Diff
import qualified Data.ByteString.Char8 as BSC
import qualified Data.ByteString.Lazy.Char8 as LBSC
import Data.Csv
import Data.Either
import Data.Function
import Data.List
import qualified Data.Map.Strict as Map
import Data.Maybe
import qualified Data.HashMap.Strict as HashMap
import qualified Data.HashSet as HashSet
import Data.HashSet (HashSet)
import qualified Data.Set as Set
import qualified Data.Vector as Vector
import GHC.Generics
import System.Directory
import System.Environment
import System.FilePath
import System.IO
import Text.Printf

import NanoML.Classify
import NanoML.Lexer
import NanoML.Monad
import NanoML.Parser
import NanoML.Pretty
import NanoML.Types hiding (Kind)


import Debug.Trace

main :: IO ()
main = do
  jsons <- lines <$> readFile "data/raw.json"
  [cls] <- getArgs
  case cls of
    "ops"
      -> mkBadFeatures cls preds_thas jsons
    "ops+context"
      -> mkBadFeatures cls preds_thas_ctx jsons
    "op+context"
      -> mkBadFeatures cls preds_tis_ctx jsons
    "op+context-count"
      -> mkBadFeatures cls (preds_tis ++ map only_ctx preds_tcount_ctx) jsons
    "op+context-count+size"
      -> mkBadFeatures cls (preds_tsize ++ preds_tis ++ map only_ctx preds_tcount_ctx) jsons
    "op+context-count+type+size"
      -> mkBadFeatures cls (preds_tsize ++ preds_tis ++ map only_ctx preds_tcount_ctx ++ preds_tcon_ctx) jsons
    "type-inference"
      -> mkFixFeatures cls (preds_tis_novar ++ preds_tcon_novar_children) jsons
    "type-inference+vars"
      -> mkFixFeatures cls (preds_tis ++ preds_tcon_children) jsons


mkBadFeatures :: String -> [Feature] -> [String] -> IO ()
mkBadFeatures nm fs jsons = do
  let uniqs = concatMap mkDiffs jsons
  let feats = [ ((h, f'), (ss, bad, fix, c))
              | (ss, p, bad, fix) <- uniqs
              , let (h, f, c) = runTFeaturesDiff fs (ss,p)
              , let f' = filter (\r -> r HashMap.! "F-InSlice" == "1.0") f
              , any (\r -> r HashMap.! "L-DidChange" == "1.0") f'
              ]
  -- let feats = map (runTFeaturesDiff fs) uniqs
  forM_ (zip [0..] feats) $ \ (i, ((header, features), (ss, bad, fix, cs))) -> do
    let fn = printf "%04d" (i :: Int)
    let path = "data/" ++ nm ++ "/" ++ fn ++ ".csv"
    createDirectoryIfMissing True (takeDirectory path)
    LBSC.writeFile path $ encodeByName header features
    let path = "data/" ++ nm ++ "/" ++ fn ++ ".ml"
    writeFile path $ unlines $ [ bad, "", "(* fix", fix, "*)", ""
                               , "(* changed spans" ] ++ map show ss ++ [ "*)" ]
                            ++ [ "", "(* type error slice" ] ++ map show cs ++ [ "*)" ]

  -- let (header, features) = unzip $ map (runTFeaturesDiff fs) uniqs
  -- let path = "data/" ++ nm ++ ".csv"
  -- LBSC.writeFile path $ encodeByName (head header) (concat features)

mkFixFeatures :: String -> [Feature] -> [String] -> IO ()
mkFixFeatures nm fs jsons = do
  let fixes = concatMap mkFixes jsons
  let (header, features) = unzip $ map (runTFeaturesTypes fs) fixes
  let path = "data/" ++ nm ++ ".csv"
  LBSC.writeFile path $ encodeByName (head header) (concat features)


traceStats :: [[NamedRecord]] -> IO ()
traceStats outss = do
  let fracs = [ fromIntegral (length (filter (\out -> out HashMap.! "L-DidChange" == "1.0") outs)) / fromIntegral (length outs)
              | outs <- outss
              , length outs > 0
              ] :: [Double]
  hPrintf stderr "%s\n" (show fracs)
  hPrintf stderr "Min: %f\n" (minimum fracs)
  hPrintf stderr "Max: %f\n" (maximum fracs)
  let avg = sum fracs / fromIntegral (length fracs)
  hPrintf stderr "Avg: %f\n" avg
  let std = sqrt (sum [(f - avg) ^ 2 | f <- fracs] / fromIntegral (length fracs))
  hPrintf stderr "Std: %f\n" std
  return ()

uniqDiffs :: [String] -> HashSet ([SrcSpan], Prog, String, String)
uniqDiffs = foldl' (\seen json -> seen `mappend` HashSet.fromList (mkDiffs json)) mempty

mkDiffs :: String -> [([SrcSpan], Prog, String, String)]
mkDiffs json = case eitherDecode (LBSC.pack json) of
  Left e -> {-trace e-} mempty
  Right (MkInSample bad' fix')
  --Right (MkInSample bads' (fix':_))
    | Right fix <- parseTopForm fix'
    , Right bad <- parseTopForm bad'
    -- -> maybeToList . fmap (,bad, bad', fix') $ mkDiff' bad' fix'
    -> [(mkDiff'' bad fix, bad, bad', fix')]
    -- -> HashSet.fromList . maybeToList $ mkDiff fix bad
  Right (MkInSample bad' fix')
  --Right (MkInSample bads' (fix':_))
    | Left e <- parseTopForm fix'
    -> {-trace e-} mempty
  Right (MkInSample bad' fix')
  --Right (MkInSample bads' (fix':_))
    | Left e <- parseTopForm bad'
    -> {-trace e-} mempty
  v -> error (show v)

mkFixes :: String -> [Prog]
mkFixes json = case eitherDecode (LBSC.pack json) of
  Left e -> {-trace e-} mempty
  Right (MkInSample bad' fix')
  --Right (MkInSample bads' (fix':_))
    | Right fix <- parseTopForm fix'
    -> [fix]
    -- -> HashSet.fromList . maybeToList $ mkDiff fix bad
  Right (MkInSample bad' fix')
  --Right (MkInSample bads' (fix':_))
    | Left e <- parseTopForm fix'
    -> {-trace e-} mempty
  Right (MkInSample bad' fix')
  --Right (MkInSample bads' (fix':_))
    | Left e <- parseTopForm bad'
    -> {-trace e-} mempty
  v -> error (show v)

mkDiff' :: String -> String -> Maybe [SrcSpan]
mkDiff' bad fix
  | Right bads <- alexScanTokens bad
  , Right fixs <- alexScanTokens fix
  = let spans = [ foldr1 joinSrcSpan (map getTokenSpan toks)
                --- | Diff.First toks <- Diff.getGroupedDiffBy ((==) `on` getToken) bads fixs
                | Diff.First toks <- Diff.getGroupedDiffBy (eqToken) bads fixs
                ]
    in Just (assert (not (null spans)) spans)
  | otherwise = Nothing
 where
 getTokenSpan (LToken s _) = s
 getToken (LToken _ t) = t
 -- FIXME: this is too strict
 eqToken (LToken s1 t1) (LToken s2 t2) = t1 == t2 && s1 == s2

mkDiff'' :: Prog -> Prog -> [SrcSpan]
mkDiff'' bad fix =
--  trace (render $ prettyProg bad) $ trace (render $ prettyProg fix) $ trace "" $
  assert (not (null x)) x
  where
  x = Set.toList (diffSpans (collapseDiff (getDiff $ diffExprsT bs fs)))
  bs = progExprs bad
  fs = progExprs fix

runTFeaturesDiff
  :: [Feature] -> ([SrcSpan], Prog)
  -> (Header, [NamedRecord], [SrcSpan])
runTFeaturesDiff fs (ls, bad) = (header, samples, cores)
  where
  header = Vector.fromList
         $ ["L-NoChange", "L-DidChange", "F-InSlice"]
        ++ concatMap (\(ls,_) -> map mkFeature ls) fs

  samples
    | null cores
    , Just e <- me = []
    | null cores = trace (show (prettyProg bad) ++ "\n------------------------------------------\n") [] -- FIXME: shouldn't happen!!
    | otherwise
    = concatMap mkfsD tbad

  (tbad, cores, me) = case runEval stdOpts (typeProg bad) of
    Left e -> traceShow e ([], [], Just e)
    Right (p, cs) -> (p, mapMaybe (constraintSpan) $ (Set.toList (mconcat cs)), Nothing)
                                   -- only look at first unsat core for now
    -- Right (p, cs) -> (p, mapMaybe (constraintSpan) $ (Set.toList (mconcat $ take 1 $ reverse $ cs)), Nothing)

  mkfsD (TDFun _ _ pes) = mconcat (map (mkTypeOut . snd) pes)
  mkfsD (TDEvl _ e) = mkTypeOut e
  mkfsD _ = mempty

  didChange l
    --- | any (l `isSubSpanOf`) ls
    | any (l ==) ls
    = ["L-DidChange" .= (1::Double), "L-NoChange" .= (0::Double)]
    | otherwise
    = ["L-DidChange" .= (0::Double), "L-NoChange" .= (1::Double)]

  inSlice l
    --- | any (l `isSubSpanOf`) cores
    | any (l ==) cores
    = ["F-InSlice" .= (1::Double)]
    | otherwise
    = ["F-InSlice" .= (0::Double)]

  mkTypeOut :: TExpr -> [NamedRecord]
  mkTypeOut te = ctfold f [] te
    where
    f p e acc = (:acc) . namedRecord $
                didChange (infoSpan (texprInfo e))
             ++ inSlice (infoSpan (texprInfo e))
             ++ concatMap (\(ls,c) -> zipWith (.=) (map mkFeature ls) (c p e)) fs


runTFeaturesTypes
  :: [Feature] -> Prog
  -> (Header, [NamedRecord])
runTFeaturesTypes fs fix = (header, samples)
  where
  header = Vector.fromList
         $ map (\(l,_) -> mkLabel l) preds_tcon
        ++ concatMap (\(ls,_) -> map mkFeature ls) fs

  samples = concatMap mkfsD tfix

  tfix = case runEval stdOpts (typeProg fix) of
    Left e -> traceShow e []
    Right (p, _) -> p

  mkfsD (TDFun _ _ pes) = mconcat (map (mkTypeOut . snd) pes)
  mkfsD (TDEvl _ e) = mkTypeOut e
  mkfsD _ = mempty

  mkTypeOut :: TExpr -> [NamedRecord]
  mkTypeOut te = ctfold f [] te
    where
    f p e acc = (:acc) . namedRecord $
                map (\(l,c) -> mkLabel l .= c e) preds_tcon
             ++ concatMap (\(ls,c) -> zipWith (.=) (map mkFeature ls) (c p e)) fs

mkLabel :: String -> BSC.ByteString
mkLabel s = BSC.pack ("L-" ++ s)

mkFeature :: String -> BSC.ByteString
mkFeature s = BSC.pack ("F-" ++ s)


data InSample = MkInSample { bad :: String, fix :: String }
  deriving (Show, Generic)
instance FromJSON InSample
