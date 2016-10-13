{-# LANGUAGE DeriveGeneric #-}
module Main where

import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as LBSC
import Data.Either
import Data.List
import qualified Data.Map.Strict as Map
import Data.Maybe
import qualified Data.HashSet as Set
import Data.HashSet (HashSet)
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
  print (Set.size uniqs)
    -- TODO: add runtime flag to choose classifier?
  let outs = concatMap (mkOutSample preds) (Set.toList uniqs)
  mapM_ print outs
-- main = interact (unlines
--                  . catMaybes . map fst . mapAccumL (generateDiff preds) Set.empty
--                  . lines)

preds :: [Expr -> Bool]
preds = [has_op o | o <- [Eq .. FExp]]
     ++ [has_con "::", has_con "[]"]

uniqDiffs :: [String] -> HashSet (SrcSpan, String)
uniqDiffs = foldl' (\seen json -> seen `mappend` mkDiffs json) mempty

mkDiffs :: String -> HashSet (SrcSpan, String)
mkDiffs json = case eitherDecode (LBSC.pack json) of
  Left e -> {-trace e-} mempty
  Right (MkInSample bads' [fix'])
  --Right (MkInSample bads' (fix':_))
    | Right fix <- parseTopForm fix'
    , bads <- rights $ map parseTopForm $ nub bads'
    -> Set.fromList $ mapMaybe (mkDiff fix) bads
  Right (MkInSample bads' [fix'])
  --Right (MkInSample bads' (fix':_))
    | Left e <- parseTopForm fix'
    -> {-trace e-} mempty
  v -> error (show v)

mkDiff :: Prog -> Prog -> Maybe (SrcSpan, String)
mkDiff fix bad = case diffProg bad fix of
  Nothing -> Nothing
  Just l  -> Just (l, render (prettyProg bad))

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

mkOutSample :: [Expr -> Bool] -> (SrcSpan, String) -> [OutSample]
mkOutSample fs (l, bad) = map (mkOut l) (concatMap mkfsD (fromRight (parseTopForm bad)))
  where
  mkfsD (DFun _ _ pes) = mconcat (map (classify fs.snd) pes)
  mkfsD (DEvl _ e) = classify fs e
  mkfsD _ = mempty

mkOut :: SrcSpan -> (SrcSpan, [Bool]) -> OutSample
mkOut l1 (l2, fs) = MkOutSample
  (if l1 == l2 then Bad else Good)
  (map (\b -> if b then 1 else 0) fs)

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
  , features :: [Int]
  } deriving (Show, Generic)
instance ToJSON OutSample

data Kind = Good | Bad
  deriving (Show, Generic)
instance ToJSON Kind
