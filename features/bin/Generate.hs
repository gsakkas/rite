{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}
module Main where

import Control.Exception (assert)
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
  jsons <- getContents
  let uniqs = uniqDiffs (lines jsons)
  -- print (HashSet.size uniqs)
    -- TODO: add runtime flag to choose classifier?
  -- let outs = concatMap (mkOutSampleRoot preds_has) (HashSet.toList uniqs)
  -- let outs = concatMap (mkTOutSampleRoot (preds_thas_ctx ++ preds_tcon_ctx)) (HashSet.toList uniqs)
  -- let outss = map (mkTOutSampleCtx (preds_thas_ctx ++ preds_tcon_ctx)) (HashSet.toList uniqs)
  -- let outss = map (mkTOutSampleTypes (preds_tis ++ preds_tcon_children)) (HashSet.toList uniqs)
  -- traceStats outss
  -- mapM_ (LBSC.putStrLn . Aeson.encode) (concat outss)
  -- TODO: add header row
  -- LBSC.putStrLn $ encode $ map toCSV outs
  -- let (header, features) = unzip $ map (runTFeaturesTypes (preds_tis ++ preds_tcon_children)) (HashSet.toList uniqs)
  let (header, features) = unzip $ map (runTFeaturesDiff (preds_thas_ctx)) (HashSet.toList uniqs)
  hPrint stderr (head header)
  -- hPrint stderr (head (concat features))
  traceStats features

  LBSC.putStrLn $ encodeByName (head header) (concat features)
-- main = interact (unlines
--                  . catMaybes . map fst . mapAccumL (generateDiff preds) HashSet.empty
--                  . lines)

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

uniqDiffs :: [String] -> HashSet ([SrcSpan], Prog)
uniqDiffs = foldl' (\seen json -> seen `mappend` mkDiffs json) mempty

mkDiffs :: String -> HashSet ([SrcSpan], Prog)
mkDiffs json = case eitherDecode (LBSC.pack json) of
  Left e -> {-trace e-} mempty
  Right (MkInSample bad' fix')
  --Right (MkInSample bads' (fix':_))
    | Right fix <- parseTopForm fix'
    , Right bad <- parseTopForm bad'
    -> HashSet.fromList . maybeToList . fmap (,bad) $ mkDiff' bad' fix'
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

mkDiff :: Prog -> Prog -> Maybe ([SrcSpan], Prog)
mkDiff fix bad
  | Set.null ds
  = Nothing
  | otherwise
  = Just (Set.toList ds, bad)
  where
  ds = diffProg bad fix

mkDiff' :: String -> String -> Maybe [SrcSpan]
mkDiff' bad fix
  | Right bads <- alexScanTokens bad
  , Right fixs <- alexScanTokens fix
  = let spans = [ foldr1 joinSrcSpan (map getTokenSpan toks)
                | Diff.First toks <- Diff.getGroupedDiffBy ((==) `on` getToken) bads fixs
                ]
    in Just (assert (not (null spans)) spans)
  | otherwise = Nothing
 where
 getTokenSpan (LToken s _) = s
 getToken (LToken _ t) = t


--mkOutSample :: [Expr -> Double] -> ([SrcSpan], Prog) -> [OutSample]
--mkOutSample fs (ls, bad) = map (mkOut ls) (concatMap mkfsD bad)
--  where
--  mkfsD (DFun _ _ pes) = mconcat (map (classify fs.snd) pes)
--  mkfsD (DEvl _ e) = classify fs e
--  mkfsD _ = mempty

-- | like 'mkOutSample' but extends each vector with the entire program's features.
-- mkOutSampleRoot :: [Expr -> Double] -> ([SrcSpan], Prog) -> [OutSample]
-- mkOutSampleRoot fs (ls, bad) = map extend samples
--   where
--   samples = map (mkOut ls) (concatMap mkfsD bad)
--   total = foldr1 (zipWith (+)) (map features samples)
--   extend (MkOutSample k fs) = MkOutSample k (fs ++ total)
-- 
--   mkfsD (DFun _ _ pes) = mconcat (map (classify fs.snd) pes)
--   mkfsD (DEvl _ e) = classify fs e
--   mkfsD _ = mempty

--mkTOutSample :: [TExpr -> Double] -> ([SrcSpan], Prog) -> [OutSample]
--mkTOutSample fs (ls, bad) = map (mkOut ls) (concatMap mkfsD tbad)
--  where
--  tbad = case runEval stdOpts (typeProg bad) of
--    Left e -> traceShow e []
--    Right p -> p
--
--  mkfsD (TDFun _ _ pes) = mconcat (map (tclassify fs.snd) pes)
--  mkfsD (TDEvl _ e) = tclassify fs e
--  mkfsD _ = mempty

-- | like 'mkTOutSample' but extends each vector with the entire program's features.
--mkTOutSampleRoot :: [TExpr -> Double] -> ([SrcSpan], Prog) -> [OutSample]
--mkTOutSampleRoot fs (ls, bad) = map extend samples
--  where
--  samples = map (mkOut ls) (concatMap mkfsD tbad)
--  total = foldr1 (zipWith (+)) (map features samples)
--  extend (MkOutSample k fs) = MkOutSample k (fs ++ total)
--
--  tbad = case runEval stdOpts (typeProg bad) of
--    Left e -> traceShow e []
--    Right p -> p
--
--  mkfsD (TDFun _ _ pes) = mconcat (map (tclassify fs.snd) pes)
--  mkfsD (TDEvl _ e) = tclassify fs e
--  mkfsD _ = mempty

-- | like 'mkTOutSample' but includes features pertaining to each expression's parent.
-- mkTOutSampleTypes :: [TExpr -> TExpr -> [Double]] -> ([SrcSpan], Prog)
--                 -> [OutSample]
-- mkTOutSampleTypes fs (ls, bad) = samples
--   where
--   samples = concatMap mkfsD tbad

--   tbad = case runEval stdOpts (typeProg bad) of
--     Left e -> traceShow e []
--     Right p -> p

--   mkfsD (TDFun _ _ pes) = mconcat (map (mkTypeOut . snd) pes)
--   mkfsD (TDEvl _ e) = mkTypeOut e
--   mkfsD _ = mempty


--   mkTypeOut te = zipWith MkOutSample labels features
--     where
--     (labels, features) = unzip $ ctfold f [] te
--     f p e acc = (map ($e) preds_tcon, concatMap (\c -> c p e) fs) : acc

runTFeaturesDiff
  :: [Feature] -> ([SrcSpan], Prog)
  -> (Header, [NamedRecord])
runTFeaturesDiff fs (ls, bad) = (header, samples)
  where
  header = Vector.fromList
         $ ["L-DidChange", "L-NoChange"]
        ++ concatMap (\(ls,_) -> map mkFeature ls) fs

  samples = concatMap mkfsD tbad

  tbad = case runEval stdOpts (typeProg bad) of
    Left e -> traceShow e []
    Right p -> p

  mkfsD (TDFun _ _ pes) = mconcat (map (mkTypeOut . snd) pes)
  mkfsD (TDEvl _ e) = mkTypeOut e
  mkfsD _ = mempty

  didChange l
    | any (l `isSubSpanOf`) ls
    = ["L-DidChange" .= (1::Double), "L-NoChange" .= (0::Double)]
    | otherwise
    = ["L-DidChange" .= (0::Double), "L-NoChange" .= (1::Double)]

  mkTypeOut :: TExpr -> [NamedRecord]
  mkTypeOut te = ctfold f [] te
    where
    f p e acc = (:acc) . namedRecord $
                didChange (infoSpan (texprInfo e))
             ++ concatMap (\(ls,c) -> zipWith (.=) (map mkFeature ls) (c p e)) fs

runTFeaturesTypes
  :: [Feature] -> ([SrcSpan], Prog)
  -> (Header, [NamedRecord])
runTFeaturesTypes fs (ls, bad) = (header, samples)
  where
  header = Vector.fromList
         $ map (\(l,_) -> mkLabel l) preds_tcon
        ++ concatMap (\(ls,_) -> map mkFeature ls) fs

  samples = concatMap mkfsD tbad

  tbad = case runEval stdOpts (typeProg bad) of
    Left e -> traceShow e []
    Right p -> p

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

-- | like 'mkTOutSample' but includes features pertaining to each expression's parent.
--mkTOutSampleCtx :: [TExpr -> TExpr -> [Double]] -> ([SrcSpan], Prog)
--                -> [OutSample]
--mkTOutSampleCtx fs (ls, bad) = map extend samples
--  where
--  samples = map (mkOut ls) (concatMap mkfsD tbad)
--  extend (MkOutSample k fs) = MkOutSample k fs
--
--  tbad = case runEval stdOpts (typeProg bad) of
--    Left e -> traceShow e []
--    Right p -> p
--
--  mkfsD (TDFun _ _ pes) = mconcat (map (tclassify_ctx fs.snd) pes)
--  mkfsD (TDEvl _ e) = tclassify_ctx fs e
--  mkfsD _ = mempty
--
--mkOut :: [SrcSpan] -> (SrcSpan, [Double]) -> OutSample
--mkOut ls (l2, fs) = MkOutSample
--  (if any (l2 `isSubSpanOf`) ls then [1,0] else [0,1])
--  fs
--  -- (map (\b -> if b then 1 else 0) fs)

fromRight (Right v) = v
fromRight (Left _) = error "fromRight: Left"


data InSample = MkInSample { bad :: String, fix :: String }
  deriving (Show, Generic)
instance FromJSON InSample
