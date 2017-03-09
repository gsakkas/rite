{-# language FlexibleContexts #-}
{-# language DeriveGeneric #-}
{-# language MultiWayIf #-}
{-# language OverloadedStrings #-}
module Main where

import Control.Concurrent.Async.Pool
import Control.DeepSeq
import Control.Exception
import Control.Monad
import Control.Monad.IO.Class
import Control.Monad.State
import Data.Char
import Data.List
import Data.Maybe
import Data.Set (Set)
import qualified Data.Set as Set
import GHC.Generics
import Options.Generic
import System.FilePath
import System.FilePath.Glob
import System.IO
import System.IO.Temp
import System.Process
import qualified System.Timeout as Timeout
import Text.Printf
import Text.Regex.TDFA

import NanoML.Types

main :: IO ()
main = do
  run =<< getRecord "Evaluate type-error localizations"

data Mode
  = Gather Tool FilePath
  | Evaluate String FilePath
  deriving (Generic, Show)
instance ParseRecord Mode

data Tool
  = Ocaml
  | Mycroft
  | Sherrloc
  deriving (Generic, Show, Read, Eq)
instance ParseField Tool
instance ParseFields Tool
instance ParseRecord Tool

run :: Mode -> IO ()
run (Gather tool dir) = do
  mls <- glob (dir </> "*.ml")
  forM_ mls $ \ml -> do
    putStrLn $ "Processing " ++ ml ++ "..."
    spans <- fromMaybe mempty . join . e2m <$> try (timeout 60 (runTool tool ml))
    let n = takeFileName ml
    writeFile (dir </> toolName tool </> n <.> "out")
              (unlines . map show $ spans)
run (Evaluate "baseline" dir) = do
  doBaseline dir
run (Evaluate tool dir) = do
  doEval tool dir


e2m :: Either SomeException b -> Maybe b
e2m e = case e of
  Left _ -> Nothing
  Right x -> Just x

runTool :: Tool -> FilePath -> IO [SrcSpan]
runTool t = case t of
  Ocaml -> runOcaml
  Mycroft -> runMycroft
  Sherrloc -> runSherrloc

toolName :: Tool -> String
toolName t = map toLower (show t)

data Spans = Spans
  { sourceFile :: FilePath
  , allSpans :: !(Set SrcSpan)
  , diffSpans :: !(Set SrcSpan)
  , errSpans :: !(Set SrcSpan)
  } deriving (Generic, Show)
instance NFData Spans

loadSpans :: FilePath -> IO Spans
loadSpans ml = do
  ls <- lines.force <$> readFile ml
  let all  = Set.fromList $! extractSrcSpans $ slice "(* all spans"        "*)" ls
  let diff = Set.fromList $! extractSrcSpans $ slice "(* changed spans"    "*)" ls
  let err  = Set.fromList $! extractSrcSpans $ slice "(* type error slice" "*)" ls
  return $! Spans ml all diff err

loadToolSpans :: FilePath -> IO [SrcSpan]
loadToolSpans f = do
  ls <- lines.force <$> readFile f
  return $! map read $ take 3 $ nub ls

data ProcessState = ProcessState
  { goodProgs :: !Int
  , allProgs  :: !Int
  } deriving (Show)

doEval
  :: String -> FilePath -> IO ()
doEval t dir = do
  mls <- glob (dir </> "*.ml")
  let init = ProcessState {goodProgs = 0, allProgs = 0}
  final <- execStateT (mapM_ (processOne t) mls) init
  printf "good / total = %d / %d = %.3f\n" (goodProgs final) (allProgs final)
    (fromIntegral (goodProgs final) / fromIntegral (allProgs final) :: Double)

processOne :: (MonadState ProcessState m, MonadIO m)
           => String -> FilePath -> m ()
processOne t f = do
  let (dir, ml) = splitFileName f
  oracle <- liftIO $ loadSpans f
  let out = dir </> t </> ml <.> "out"
  sps <- liftIO $ loadToolSpans out
  if
    | null sps -> do
        liftIO . putStrLn . unlines $
          [ "WARN: no blamed spans in"
          , "  " ++ out
          ]
    | not (Set.fromList sps `Set.isSubsetOf` allSpans oracle) -> do
        liftIO . putStrLn . unlines $
          [ "WARN: blamed spans not subset of all spans in"
          , "  " ++ out
          ]
    | otherwise -> do
        when (any (`Set.member` diffSpans oracle) sps) $ do
          bumpGood (+1)
        bumpAll (+1)

bumpAll, bumpGood
  :: MonadState ProcessState m
  => (Int -> Int) -> m ()
bumpAll f = modify' $ \s -> s {allProgs = f (allProgs s)}
bumpGood f = modify' $ \s -> s {goodProgs = f (goodProgs s)}

data BaselineState = BaselineState
  { top1s :: ![Double]
  , top2s  :: ![Double]
  , top3s  :: ![Double]
  } deriving (Show)

doBaseline
  :: FilePath -> IO ()
doBaseline dir = do
  mls <- glob (dir </> "*.ml")
  let init = BaselineState {top1s = [], top2s = [], top3s = []}
  final <- flip execStateT init $ forM_ mls $ \ml -> do
    oracle <- liftIO $ loadSpans ml
    let n_dif = fromIntegral $ Set.size (diffSpans oracle `Set.intersection` errSpans oracle)
    let n_err = fromIntegral $ Set.size (errSpans oracle)
    let topk k = 1 - ((1-(n_dif/n_err))^k)
    let top1 = topk 1
    let top2 = topk 2
    let top3 = topk 3
    -- liftIO $ printf "n_dif / n_err / n_tot: %.0f / %.0f / %d\n" n_dif n_err (Set.size (allSpans oracle))
    -- liftIO $ printf "top 1/2/3: %.3f / %.3f / %.3f\n" top1 top2 top3
    -- liftIO $ printf "----------------------------------\n"
    modify' $ \s -> s { top1s = top1 : top1s s
                      , top2s = top2 : top2s s
                      , top3s = top3 : top3s s
                      }
  let avg xs = sum xs / genericLength xs
  let top1 = avg (top1s final)
  let top2 = avg (top2s final)
  let top3 = avg (top3s final)
  printf "top 1/2/3: %.3f / %.3f / %.3f\n" top1 top2 top3
  -- printf "good / total = %d / %d = %.3f\n" (goodProgs final) (allProgs final)
  --   (fromIntegral (goodProgs final) / fromIntegral (allProgs final) :: Double)


slice :: Eq a => a -> a -> [a] -> [a]
slice start stop = takeWhile (/=stop) . dropWhile (/=start)

-- computeSpans :: FilePath -> String -> (FilePath -> IO ([SrcSpan])) -> IO ()
-- computeSpans dir toolname runTool = do
--   mls <- glob (dir </> "*.ml")
--   forM_ mls $ \ml -> do
--     spans <- runTool ml
--     let n = takeFileName ml
--     writeFile (dir </> toolname </> n <.> "out") (unlines . map show $ spans)

runOcaml :: FilePath -> IO ([SrcSpan])
runOcaml ml = do
  (_, _, err) <- readCreateProcessWithExitCode (proc "eval/bin/ocamlc" [ml]) ""
  return $! map read . take 1 $ lines err

runMycroft :: FilePath -> IO ([SrcSpan])
runMycroft ml = do
  out <- readCreateProcess (proc "eval/mycroft/build/bin/cgen-unif" [ml]){ std_err = CreatePipe } ""
  out <- readCreateProcess (proc "eval/mycroft/build/bin/unif" []) out
  return $! extractSrcSpans (dropWhile (/="Generated report:")
                              (lines out))

runSherrloc :: FilePath -> IO ([SrcSpan])
runSherrloc ml = withSystemTempDirectory "sherrloc" $ \tmpDir -> do
  let tmp = tmpDir </> "error.con"
  out <- readCreateProcess (proc "eval/bin/ecamlc" [ml]) ""
  writeFile tmp out
  out <- readCreateProcess (proc "eval/bin/sherrloc" ["-e", "-n2", tmp]) ""
  return $! extractSrcSpans (lines out)

extractSrcSpans :: [String] -> [SrcSpan]
extractSrcSpans strs =
  [ read x | str <- strs
           , x <- getAllTextMatches (str =~ srcSpanRE)
           ]

srcSpanRE :: String
srcSpanRE = "\\([0-9]+,[0-9]+\\)-\\([0-9]+,[0-9]+\\)"

-- | Like 'Timeout.timeout', but in seconds.
timeout :: Int -> IO a -> IO (Maybe a)
timeout sec = Timeout.timeout (sec * 10^6)
