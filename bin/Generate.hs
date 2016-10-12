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
import NanoML.Types


import Debug.Trace

main :: IO ()
main = interact (unlines
                 -- TODO: add runtime flag to choose classifier?
                 . mapMaybe (generateDiff by_ops)
                 . lines)

generateDiff :: (ToJSON a, Monoid a)
             => (Expr -> a) -> String -> Maybe String
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

diffOne :: Monoid a => (Expr -> a) -> Prog -> Prog -> OutSample a
diffOne mkfs fix bad = MkOutSample
  { prog = render (prettyProg bad)
  , ast  = bad
  , loc  = case diffProg bad fix of
             Just s -> Just s
             Nothing -> error $ "\n" ++ (render (prettyProg bad)) ++ "\n\n" ++ (render (prettyProg fix))
  , features = mconcat (map mkfsD bad)
  }
  where
  mkfsD (DFun _ _ pes) = mconcat (map (mkfs.snd) pes)
  mkfsD (DEvl _ e) = mkfs e
  mkfsD _ = mempty

data InSample = MkInSample { bad :: [String], fix :: [String] }
  deriving (Show, Generic)
instance FromJSON InSample

data OutSample a = MkOutSample
  { prog :: String
  , ast :: Prog
  , loc :: MSrcSpan
  , features :: a
  } deriving (Show, Generic)
instance ToJSON a => ToJSON (OutSample a)
