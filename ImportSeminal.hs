{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PackageImports #-}
{-# LANGUAGE RecordWildCards #-}
module ImportSeminal where

import qualified Data.ByteString.Lazy as LB
import Data.Char
import Data.Csv
import qualified Data.Vector as V
import System.Directory
import System.FilePath
import "Glob" System.FilePath.Glob
import Text.Printf

data ProgramSet =
  PS { student_id :: Int
     , hw :: Int
     , prob :: String
     , group_begin :: String
     , group_end :: String
     , error_category :: String
     }
  deriving (Show)

instance FromNamedRecord ProgramSet where
  parseNamedRecord r
    = PS <$> r .: "student_id"
         <*> r .: "hw"
         <*> r .: "prob"
         <*> r .: "group_begin"
         <*> r .: "group_end"
         <*> r .: "error_category"

toFilePath :: ProgramSet -> FilePath
toFilePath PS {..}
  = printf "STUDENT%02d/hw%d%s/Comp/%s-*"
           student_id
           hw
           (if null prob then "" else "-" ++ prob)
           group_begin

parseFile :: FilePath -> IO [ProgramSet]
parseFile f = decodeByName <$> LB.readFile f >>= \case
  Left e -> error e
  Right (_, v) -> return (V.toList v)

filterTypeMismatch :: [ProgramSet] -> [ProgramSet]
filterTypeMismatch = filter (\PS {..} -> map toLower error_category == "type mismatch")

-- ps <- filterTypeMismatch <$> parseFile "Downloads/error_grouping/NanoML-Table 1.csv"
-- forM_ ps $ \p -> do { fs <- glob ("Downloads" </> toFilePath p); forM_ fs $ \f -> copyFile f ("Source/nanoml/data/seminal" </> takeFileName f) }
