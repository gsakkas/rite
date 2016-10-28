{-# LANGUAGE DeriveGeneric #-}
module Main where

import Data.Aeson (ToJSON(..), FromJSON(..), eitherDecode)
import qualified Data.Aeson as Aeson
import qualified Data.ByteString.Lazy.Char8 as LBSC
import Data.Csv
import Data.Either
import Data.List
import qualified Data.Map.Strict as Map
import Data.Maybe
import qualified Data.HashSet as HashSet
import Data.HashSet (HashSet)
import qualified Data.Set as Set
import GHC.Generics

import NanoML.Classify
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
  let outs = concatMap (mkTOutSample (preds_thas ++ preds_tcon)) (HashSet.toList uniqs)
  mapM_ (LBSC.putStrLn . Aeson.encode) outs
  -- TODO: add header row
  -- LBSC.putStrLn $ encode $ map toCSV outs
-- main = interact (unlines
--                  . catMaybes . map fst . mapAccumL (generateDiff preds) HashSet.empty
--                  . lines)

uniqDiffs :: [String] -> HashSet ([SrcSpan], Prog)
uniqDiffs = foldl' (\seen json -> seen `mappend` mkDiffs json) mempty

mkDiffs :: String -> HashSet ([SrcSpan], Prog)
mkDiffs json = case eitherDecode (LBSC.pack json) of
  Left e -> {-trace e-} mempty
  Right (MkInSample bads' [fix'])
  --Right (MkInSample bads' (fix':_))
    | Right fix <- parseTopForm fix'
    , bads <- rights $ map parseTopForm $ nub bads'
    -> HashSet.fromList $ mapMaybe (mkDiff fix) bads
  Right (MkInSample bads' [fix'])
  --Right (MkInSample bads' (fix':_))
    | Left e <- parseTopForm fix'
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

  -- = case diffProg bad fix of
  -- Nothing -> Nothing
  -- Just l  -> Just (l, bad)

-- generateDiff :: [Expr -> Bool] -> Set.Set (SrcSpan, String) -> String
--              -> (Set.Set (SrcSpan, String), Maybe String)
-- generateDiff mkfs seen json = case eitherDecode (LBSC.pack json) of
--   Left e -> {-trace e-} (seen, Nothing)
--   Right (MkInSample bads' [fix'])
--   --Right (MkInSample bads' (fix':_))
--     | Right fix <- parseTopForm fix'
--     , bads <- rights $ map parseTopForm $ nub bads'
--     -> Just . unlines . map (unlines . map (LBSC.unpack . encode) . diffOne mkfs fix) $ bads
--   Right (MkInSample bads' [fix'])
--   --Right (MkInSample bads' (fix':_))
--     | Left e <- parseTopForm fix'
--     -> {-trace e-} Nothing
--   v -> error (show v)

-- diffOne :: [Expr -> Bool] -> Prog -> Prog -> [OutSample]
-- -- diffOne mkfs fix bad = MkOutSample
-- --   { prog = render (prettyProg bad)
-- --   , ast  = bad
-- --   , loc  = diffProg bad fix
-- --   , features = mconcat (map mkfsD bad)
-- --   }
-- --   where
-- diffOne fs fix bad = case diffProg bad fix of
--   Nothing -> []
--   Just l  -> map (mkOut l) (concatMap mkfsD bad)

mkOutSample :: [Expr -> Double] -> ([SrcSpan], Prog) -> [OutSample]
mkOutSample fs (ls, bad) = map (mkOut ls) (concatMap mkfsD bad)
  where
  mkfsD (DFun _ _ pes) = mconcat (map (classify fs.snd) pes)
  mkfsD (DEvl _ e) = classify fs e
  mkfsD _ = mempty

-- | like 'mkOutSample' but extends each vector with the entire program's features.
mkOutSampleRoot :: [Expr -> Double] -> ([SrcSpan], Prog) -> [OutSample]
mkOutSampleRoot fs (ls, bad) = map extend samples
  where
  samples = map (mkOut ls) (concatMap mkfsD bad)
  total = foldr1 (zipWith (+)) (map features samples)
  extend (MkOutSample k fs) = MkOutSample k (fs ++ total)

  mkfsD (DFun _ _ pes) = mconcat (map (classify fs.snd) pes)
  mkfsD (DEvl _ e) = classify fs e
  mkfsD _ = mempty

mkTOutSample :: [TExpr -> Double] -> ([SrcSpan], Prog) -> [OutSample]
mkTOutSample fs (ls, bad) = map (mkOut ls) (concatMap mkfsD tbad)
  where
  tbad = case runEval stdOpts (typeProg bad) of
    Left e -> traceShow e []
    Right p -> p

  mkfsD (TDFun _ _ pes) = mconcat (map (tclassify fs.snd) pes)
  mkfsD (TDEvl _ e) = tclassify fs e
  mkfsD _ = mempty

-- | like 'mkTOutSample' but extends each vector with the entire program's features.
mkTOutSampleRoot :: [TExpr -> Double] -> ([SrcSpan], Prog) -> [OutSample]
mkTOutSampleRoot fs (ls, bad) = map extend samples
  where
  samples = map (mkOut ls) (concatMap mkfsD tbad)
  total = foldr1 (zipWith (+)) (map features samples)
  extend (MkOutSample k fs) = MkOutSample k (fs ++ total)

  tbad = case runEval stdOpts (typeProg bad) of
    Left e -> traceShow e []
    Right p -> p

  mkfsD (TDFun _ _ pes) = mconcat (map (tclassify fs.snd) pes)
  mkfsD (TDEvl _ e) = tclassify fs e
  mkfsD _ = mempty

mkOut :: [SrcSpan] -> (SrcSpan, [Double]) -> OutSample
mkOut ls (l2, fs) = MkOutSample
  (if any (l2 `isSubSpanOf`) ls then Bad else Good)
  fs
  -- (map (\b -> if b then 1 else 0) fs)

fromRight (Right v) = v
fromRight (Left _) = error "fromRight: Left"


data InSample = MkInSample { bad :: [String], fix :: [String] }
  deriving (Show, Generic)
instance FromJSON InSample

data OutSample = MkOutSample
  -- { prog :: String
  -- , ast :: Prog
  -- , loc :: MSrcSpan
  { kind :: Kind
  , features :: [Double]
  } deriving (Show, Generic)
instance ToJSON OutSample

data Kind = Good | Bad
  deriving (Show, Eq, Generic)
instance ToJSON Kind

toCSV :: OutSample -> Record
toCSV (MkOutSample k fs) = toRecord (fk : fs)
  where
  fk = if k == Bad then 1 else 0
