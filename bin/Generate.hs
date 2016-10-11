{-# LANGUAGE DeriveGeneric #-}
module Main where

import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as LBSC
import Data.Either
import qualified Data.Map.Strict as Map
import GHC.Generics

import NanoML.Classify
import NanoML.Parser
import NanoML.Pretty
import NanoML.Types


main :: IO ()
main = interact (unlines . map generateDiff . lines)

generateDiff :: String -> String
generateDiff json = case eitherDecode (LBSC.pack json) of
  Left e -> error e
  -- Right (MkInSample bads' [fix'])
  Right (MkInSample bads' (fix':_))
    | Right fix <- parseTopForm fix'
    , bads <- rights $ map parseTopForm bads'
    -> unlines . map (LBSC.unpack . encode . diffOne fix) $ bads
  v -> error (show v)

diffOne :: Prog -> Prog -> OutSample
diffOne fix bad = MkOutSample (render $ prettyProg bad) bad (diffProg bad fix)

data InSample = MkInSample { bad :: [String], fix :: [String] }
  deriving (Show, Generic)
instance FromJSON InSample

data OutSample = MkOutSample { prog :: String, ast :: Prog, loc :: MSrcSpan }
  deriving (Show, Generic)
instance ToJSON OutSample
