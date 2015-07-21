{-# LANGUAGE BangPatterns      #-}
{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE PackageImports    #-}
{-# LANGUAGE RecordWildCards   #-}
module NanoML
  ( module NanoML.Parser
  , module NanoML.Types
  , module NanoML.Eval
  , check, checkAll, checkAllFrom, runProg
  ) where

import           Control.Exception
import           Control.Monad
import           Control.Monad.Except
import           Control.Monad.Random
import           Control.Monad.Reader
import           Control.Monad.State
import           Control.Monad.Writer
import qualified Data.IntMap              as IntMap
import           Data.List
import qualified Data.Map                 as Map
import           Data.Maybe
import           Data.Typeable (Typeable)
import qualified Data.Vector              as Vector
import           System.IO.Unsafe
import           System.Timeout
-- import           Test.QuickCheck
-- import           Test.QuickCheck.Monadic
-- import           Test.QuickCheck.Property hiding (Result)
import           Text.Printf
import "regex-tdfa" Text.Regex.TDFA ( (=~~) )

import           NanoML.Eval
import           NanoML.Gen
import           NanoML.Misc
import           NanoML.Parser hiding (read)
import           NanoML.Pretty
import           NanoML.Types

import Debug.Trace


check :: Maybe Err -> Prog -> IO (Maybe Result)
check err prog =
  case last prog of
    -- NOTE: it's crucial that we prioritize the case where ocaml has
    -- told us where the type error is
    _ | Just err <- err
      , Just (_,_,_,[l,c])
        <- err =~~ "line ([0-9]+), characters ([0-9]+)"
           :: Maybe (String,String,String,[String])
      , Just (f,d,p) <- traceShow (l,c) findDecl prog (read l) (read c)
--      , Just t <- Map.lookup f knownFuncs
        -> do r <- checkDecl f p
              printResult r
              return $ Just r
    DFun _ _ [(VarPat f, Lam {})]
      -- Just t <- Map.lookup f knownFuncs
        -> do r <- checkDecl f prog
              printResult r
              return $ Just r
    DFun _ _ [(WildPat, _)]
        -> do r <- runProg prog
              printResult r
              return $ Just r
    DFun _ _ [(VarPat _, _)]
        -> do r <- runProg prog
              printResult r
              return $ Just r
    DEvl _ _
        -> do r <- runProg prog
              printResult r
              return $ Just r
    _ -> do printf "I don't (yet) know how to check this program!\n" -- (show $ prettyProg prog)
            return Nothing

printResult Failure {..} = do
  printf "*** Failed after %d tests:\n" numTests
  print counterExample
printResult Success {..} =
  printf "+++ OK, passed %d tests.\n" numTests

findDecl :: Prog -> Int -> Int -> Maybe (Var,Decl,Prog)
findDecl prog l c = do
  d <- find (surrounds l c . getSrcSpan) prog
  case d of
    DFun _ _ [(VarPat f, Lam {})] -> Just (f,d, takeWhile (before l c . getSrcSpan) prog)
    _                             -> Nothing

before l c (SrcSpan sl sc el ec)
  = l >= sl

surrounds l c (SrcSpan sl sc el ec)
  = sl <= l && l < el

safeTail [] = []
safeTail (x:xs) = xs

runProg :: Prog -> IO Result
runProg prog = within 0 sec $ nanoCheck 0 0 stdOpts $ do
                 mapM_ evalDecl prog

checkDecl :: Var -> Prog -> IO Result
checkDecl f prog = go (Success 0) 0
  where
  go r@(Failure {}) _ = return r
  go (Success 1000) _ = return (Success 1000)
  go (Success n) !m   = do
    r <- within n sec $ nanoCheck n m stdOpts $ do
      mapM_ evalDecl prog
      to (Var Nothing f) [Var Nothing f]
    go r ((m+1) `mod` 5)

  to e args = do
    rememberArgs args
    v <- eval e
    case v of
      VF _ -> do
        arg <- flip VH Nothing <$> fresh
        to (mkApps Nothing (Val v) [Val arg]) (args ++ [Val arg])
      _ -> return ()

sec = 1000000 * 60

within n s x = do
  m <- timeout s x
  return $ fromMaybe (Failure (n+1) 0 0 (text "<<timeout>>")) m

nanoCheck :: Int -> Int -> NanoOpts -> Eval () -> IO Result
nanoCheck numSuccess maxSize opts x = do
  seed <- getRandom
  let opts' = opts { seed = seed, size = maxSize }
  x <- evaluate $ runEvalFull opts' x
  return $ case x of
    (Left (MLException e), _, _) -> Success (numSuccess + 1)
    (Left e, st, tr) ->
      let invoc = case map (fetchArg' (stStore st)) (stArgs st) of
            [] -> mempty
            f:args -> pretty (mkApps Nothing f args)
      in Failure (numSuccess + 1) seed maxSize
                 (vcat (text (show e) : invoc : []))
    (Right _, _, _) -> Success (numSuccess + 1)

fetchArg' st (Val v) = Val (fetchArg st v)
fetchArg' st e = e

fetchArg st (VH r _)
  | Just (_,v) <- IntMap.lookup r st
  = fetchArg st v
fetchArg st (VL vs t)
  = VL (map (fetchArg st) vs) t
fetchArg st (VT n vs ts)
  = VT n (map (fetchArg st) vs) ts
fetchArg st (VA c (Just v) t)
  = VA c (Just (fetchArg st v)) t
--  TODO: fetchArg st (VR )
fetchArg st (VV vs t)
  = VV (Vector.map (fetchArg st) vs) t
fetchArg st v
  = v

checkAll = checkAllFrom "../yunounderstand/data/sp14/prog/unify"

checkAllFrom dir = parseAllIn dir >>= mapM (\(f,e,p) -> putStrLn ("\n" ++ f) >> check e p >>= \r -> maybe (return Nothing) (\r -> return (Just (f,r))) r)

checkType :: MonadEval m => Value -> Type -> m Bool
checkType v t = unify t (typeOf v) >> return True
