module Main where

import Control.Monad
import Data.List
import Data.Maybe
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
             }

initST = ST 0 0 0 0 0 0

reduceM xs z f = foldM f z xs

bumpIf True = 1
bumpIf False = 0

initOpts = stdOpts { maxTests = 1000 }

extendOpts opts = opts { maxSteps = 1000 + maxSteps opts }

upperBound = 10000

checkLoop opts e p = do
  r <- checkWith opts e p
  case r of
    Nothing -> return Nothing
    Just r
      | not (isSuccess r) && becauseOf "timeout" r
        -> if maxSteps opts == upperBound
           then return (Just r)
           else checkLoop (extendOpts opts) e p
      | otherwise -> return (Just r)

becauseOf r = (r `isInfixOf`) . show . pretty . errorMsg

main = do
  hSetBuffering stdout LineBuffering
  [dir] <- getArgs
  ps <- parseAllIn dir
  st <- reduceM ps initST $ \st (f,e,p) -> do
    putStrLn ("\n" ++ f)
    r <- checkLoop initOpts e p
    case r of
      Nothing -> return st
      Just r  -> do
        printResult r
        let bumpIfFail b = bumpIf (not (isSuccess r) && b)
        return $! st { total   = total st   + 1
                     , safe    = safe st    + bumpIf (isSuccess r)
                     , timeout = timeout st + bumpIfFail (becauseOf "timeout" r)
                     , unbound = unbound st + bumpIfFail (becauseOf "Unbound" r)
                     , output  = output st  + bumpIfFail (becauseOf "OutputType" r)
                     , unsafe  = unsafe st  + bumpIfFail (becauseOf "Type error" r)
                     }
  printf "\nDONE!\n"
  printf "%d programs:\n" (total st)
  printf "  %d did not fail at runtime\n" (safe st)
  printf "  %d timed out\n" (timeout st)
  printf "  %d did failed at runtime:\n"
    (total st - safe st - timeout st)
  printf "    %d due to an unbound variable or datacon\n"
    (unbound st)
    -- length (filter (becauseOf "unknown") fs))
  printf "    %d due to an output-type-mismatch\n"
    (output st)
  printf "    %d due to a type error (%02.02f %%)\n"
    (unsafe st)
    ((fromIntegral (unsafe st)
      / fromIntegral (total st) :: Double)
     * 100)
