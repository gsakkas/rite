{-# LANGUAGE DeriveGeneric, OverloadedStrings #-}
module Main where

import Control.Monad
import qualified Data.ByteString.Lazy.Char8 as LBS
import Data.Csv
import qualified Data.Graph.Inductive.Graph as Graph
import qualified Data.HashSet as HashSet
import Data.List
import Data.Maybe
import Data.Time.Clock.POSIX
import GHC.Generics (Generic)
import System.Environment
import System.IO
import Text.Printf

import NanoML
import NanoML.Misc
import NanoML.Parser
import NanoML.Pretty

isRight Right {} = True
isRight _        = False

data ST = ST { total :: !Int, safe :: !Int, timeout :: !Int
             , unbound :: !Int, output :: !Int, unsafe :: !Int
             , diverge :: !Int
             }

data O = Safe | Unsafe | Unbound | Output | Diverge | Timeout
       deriving (Show, Read)
instance FromField O where
  parseField s
    | s == "S" = pure Safe
    | s == "U" = pure Unsafe
    | s == "B" = pure Unbound
    | s == "O" = pure Output
    | s == "D" = pure Diverge
    | s == "T" = pure Timeout
    | otherwise = mzero
instance ToField O where
  toField Safe = "S"
  toField Unsafe = "U"
  toField Unbound = "B"
  toField Output = "O"
  toField Diverge = "D"
  toField Timeout = "T"

data R = R { file :: !String
           , stepLimit :: !Int, time :: !Double, tests :: !Int
           , outcome :: !O, steps :: !Int, jumps :: !Int
           } deriving Generic

instance FromNamedRecord R
instance ToNamedRecord R
instance DefaultOrdered R


initST = ST 0 0 0 0 0 0 0

reduceM xs z f = foldM f z xs

bumpIf True = 1
bumpIf False = 0

initOpts = stdOpts { maxTests = 1000, produceTrace = False }

extendOpts opts = opts { maxSteps = 1000 + maxSteps opts }

upperBound = 10000

getTime :: IO Double
getTime = realToFrac `fmap` getPOSIXTime

timed x = do start <- getTime
             v     <- x
             end   <- getTime
             return (end-start, v)

checkLoop opts e p = do
  (t, r) <- timed $ checkWith opts e p
  case r of
    Nothing -> return Nothing
    Just r
      | not (isSuccess r) && becauseOf "timeout" r
        -> if maxSteps opts == upperBound
           then return (Just (r,t, maxSteps opts))
           else checkLoop (extendOpts opts) e p
      | otherwise -> return (Just (r,t, maxSteps opts))

becauseOf r = (r `isInfixOf`) . show . pretty . errorMsg

mkOutcome f r
  | isSuccess r = Safe
  | becauseOf "timeout" r = Timeout
  | becauseOf "Unbound" r = Unbound
  | becauseOf "OutputType" r = Output
  | becauseOf "Type error" r = Unsafe
  | becauseOf "infinite recursion" r = Diverge
  | otherwise = error $ "mkOutcome: " ++ f

makePath :: Result -> [StepKind]
makePath r =
  let fs = finalState r
      gr = buildGraph (HashSet.toList $ stEdges fs)
      -- st = ancestor gr $ findRoot gr ( if isSuccess r
      --                                  then result r
      --                                  else stCurrentExpr fs
      --                                , stVarEnv fs )
      root = findRoot gr (stRoot fs)
  in unfoldr (forward gr) $ root

forward :: Graph -> Graph.Node -> Maybe (StepKind, Graph.Node)
forward gr n = case find (isStepsTo . snd) $ Graph.lsuc gr n of
  Nothing              -> Nothing
  Just (n', StepsTo k) -> Just (k, n')

main = do
  hSetBuffering stdout LineBuffering
  [dir] <- getArgs
  ps <- parseAllIn dir
  rs <- reduceM ps [] $ \rs (f,e,p) -> do
    putStrLn ("\n" ++ f)
    r <- checkLoop initOpts e p
    case r of
      Nothing -> return rs
      Just (r,t,ms) -> do
        printResult r
        let path = makePath r
        let o = R { file = f
                  , stepLimit = ms
                  , time = t
                  , tests = numTests r
                  , outcome = mkOutcome f r
                  , steps = length path
                  , jumps = length (filter (== CallStep) path)
                  }
        o `seq` return (o:rs)
  LBS.putStrLn (encodeDefaultOrderedByName rs)
  --   case r of
  --     Nothing -> return st
  --     Just r  -> do
  --       printResult r
  --       let bumpIfFail b = bumpIf (not (isSuccess r) && b)
  --       return $! st { total   = total st   + 1
  --                    , safe    = safe st    + bumpIf (isSuccess r)
  --                    , timeout = timeout st + bumpIfFail (becauseOf "timeout" r)
  --                    , unbound = unbound st + bumpIfFail (becauseOf "Unbound" r)
  --                    , output  = output st  + bumpIfFail (becauseOf "OutputType" r)
  --                    , unsafe  = unsafe st  + bumpIfFail (becauseOf "Type error" r)
  --                    , diverge = diverge st + bumpIfFail (becauseOf "infinite recursion" r)
  --                    }
  -- printf "\nDONE!\n"
  -- printf "%d programs:\n" (total st)
  -- printf "  %d did not fail at runtime\n" (safe st)
  -- printf "  %d timed out\n" (timeout st)
  -- printf "  %d did fail at runtime:\n"
  --   (total st - safe st - timeout st)
  -- printf "    %d due to an unbound variable or datacon\n"
  --   (unbound st)
  --   -- length (filter (becauseOf "unknown") fs))
  -- printf "    %d due to an output-type-mismatch\n"
  --   (output st)
  -- printf "    %d due to infinite recursion\n"
  --   (diverge st)
  -- printf "    %d due to a type error (%02.02f %%)\n"
  --   (unsafe st)
  --   ((fromIntegral (unsafe st)
  --     / fromIntegral (total st) :: Double)
  --    * 100)
