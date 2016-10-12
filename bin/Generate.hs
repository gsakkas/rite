{-# LANGUAGE DeriveGeneric #-}
module Main where

import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as LBSC
import Data.Either
import qualified Data.Map.Strict as Map
import Data.Maybe
import GHC.Generics

import NanoML.Classify
import NanoML.Parser
import NanoML.Pretty
import NanoML.Types hiding (Kind)


import Debug.Trace

main :: IO ()
main = interact (unlines
                 -- TODO: add runtime flag to choose classifier?
                 . mapMaybe (generateDiff preds)
                 . lines)

preds :: [Expr -> Bool]
preds = [has_op o | o <- [Eq .. FExp]]
     ++ [has_con "::", has_con "[]"]


generateDiff :: [Expr -> Bool] -> String -> Maybe String
generateDiff mkfs json = case eitherDecode (LBSC.pack json) of
  Left e -> {-trace e-} Nothing
  Right (MkInSample bads' [fix'])
  --Right (MkInSample bads' (fix':_))
    | Right fix <- parseTopForm fix'
    , bads <- rights $ map parseTopForm bads'
    -> Just . unlines . map (LBSC.unpack . encode . diffOne mkfs fix) $ bads
  Right (MkInSample bads' [fix'])
  --Right (MkInSample bads' (fix':_))
    | Left e <- parseTopForm fix'
    -> {-trace e-} Nothing
  v -> error (show v)

diffOne :: [Expr -> Bool] -> Prog -> Prog -> [OutSample]
-- diffOne mkfs fix bad = MkOutSample
--   { prog = render (prettyProg bad)
--   , ast  = bad
--   , loc  = diffProg bad fix
--   , features = mconcat (map mkfsD bad)
--   }
--   where
diffOne fs fix bad = case diffProg bad fix of
  Nothing -> []
  Just l  -> map (mkOut l) (concatMap mkfsD bad)
  where
  mkfsD (DFun _ _ pes) = mconcat (map (classify fs.snd) pes)
  mkfsD (DEvl _ e) = classify fs e
  mkfsD _ = mempty

mkOut :: SrcSpan -> (SrcSpan, [Bool]) -> OutSample
mkOut l1 (l2, fs) = MkOutSample (if l1 == l2 then Bad else Good) fs

data InSample = MkInSample { bad :: [String], fix :: [String] }
  deriving (Show, Generic)
instance FromJSON InSample

data OutSample = MkOutSample
  -- { prog :: String
  -- , ast :: Prog
  -- , loc :: MSrcSpan
  { kind :: Kind
  , features :: [Bool]
  } deriving (Show, Generic)
instance ToJSON OutSample

data Kind = Good | Bad
  deriving (Show, Generic)
instance ToJSON Kind
