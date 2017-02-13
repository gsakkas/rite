{-# LANGUAGE RecordWildCards #-}
module Main where

import System.Environment
import System.Exit
import Text.Printf

import NanoML
import NanoML.Explore
import NanoML.Misc
import NanoML.Pretty
import NanoML.Step

main = do
  args <- getArgs
  let (file, func) = case args of
                      [file] -> (file, Nothing)
                      [file, func] -> (file, Just func)
                      _ -> error "usage: nano-check <file> [function]"
  prog <- parseFile file
  let opts = stdOpts {maxTests=1000, produceTrace=False}
  res <- maybe (fromJust <$> check Nothing prog)
               (\v -> fromJust <$> checkWith opts (Just v) prog)
               func
  case res of
    Success n _ _ -> do
      printf "Could not find a counter-example after %d tests..\n" n
      exitSuccess
    Failure {..} -> do
      -- gr <- buildGraph (stEdges finalState)
      -- st <- findRoot gr (stCurrentExpr finalState)
      -- explore gr st
      print counterExample
      print (pretty (fst (stCurrentExpr finalState)))
      print (pretty errorMsg)
      exitFailure
