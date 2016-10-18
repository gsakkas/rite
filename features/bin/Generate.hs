{-# LANGUAGE DeriveGeneric #-}
module Main where

import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as LBSC
import Data.Either
import Data.List
import qualified Data.Map.Strict as Map
import Data.Maybe
import qualified Data.HashSet as HashSet
import Data.HashSet (HashSet)
import qualified Data.Set as Set
import GHC.Generics

import NanoML.Classify
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
  let outs = concatMap (mkOutSample preds_has) (HashSet.toList uniqs)
  mapM_ (LBSC.putStrLn . encode) outs
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
  deriving (Show, Generic)
instance ToJSON Kind
