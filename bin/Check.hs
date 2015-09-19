{-# LANGUAGE RecordWildCards #-}
module Main where

import System.Environment
import Text.Printf

import NanoML
import NanoML.Explore
import NanoML.Misc
import NanoML.Step

main = do
  args <- getArgs
  let (file, func) = case args of
                      [file] -> (file, Nothing)
                      [file, func] -> (file, Just func)
                      _ -> error "usage: nano-check <file> [function]"
  prog <- parseFile file
  res <- maybe (fromJust <$> check Nothing prog) (\v -> checkDecl v prog) func
  case res of
    Success n _  -> printf "Could not find a counter-example after %d tests..\n" n
    Failure {..} -> do gr <- buildGraph (stEdges finalState)
                       st <- findRoot gr (stCurrentExpr finalState)
                       explore gr st
