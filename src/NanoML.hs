{-# LANGUAGE BangPatterns      #-}
{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE PackageImports    #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TupleSections   #-}
module NanoML
  ( module NanoML.Parser
  , module NanoML.Types
  , module NanoML.Eval
  , module NanoML.Step
  , check, checkAll, checkAllFrom, runProg, checkDecl
  , checkWith, checkDeclWith, runProgWith
  , printResult
  ) where

import Prelude hiding (read)

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
import           NanoML.Step
import           NanoML.Types

import Debug.Trace

check = checkWith stdOpts

checkWith :: NanoOpts -> Maybe Err -> Prog -> IO (Maybe Result)
checkWith opts err prog =
  case last prog of
    -- NOTE: it's crucial that we prioritize the case where ocaml has
    -- told us where the type error is
    _ | Just err <- err
      , Just (_,_,_,[l,c])
        <- err =~~ "line ([0-9]+), characters ([0-9]+)"
           :: Maybe (String,String,String,[String])
      , Just (f,d,p) <- traceShow (l,c) $ findDecl prog (read l) (read c)
--      , Just t <- Map.lookup f knownFuncs
        -> do r <- checkDeclWith opts f p
              -- printResult r
              return $ Just r
    -- DFun _ _ [(VarPat _ f, Lam {})]
    DFun _ _ [(VarPat _ f, _)]
      -- Just t <- Map.lookup f knownFuncs
        -> do r <- checkDeclWith opts f prog
              -- printResult r
              return $ Just r
    -- DFun _ _ [(WildPat _, _)]
    --     -> do r <- runProg prog
    --           -- printResult r
    --           return $ Just r
    -- DFun _ _ [(VarPat _ _, _)]
    --     -> do r <- runProg prog
    --           -- printResult r
    --           return $ Just r
    -- DEvl _ _
    --     -> do r <- runProg prog
    --           -- printResult r
    --           return $ Just r
    _ -> do -- printf "I don't (yet) know how to check this program!\n" -- (show $ prettyProg prog)
            r <- runProgWith opts prog
            return (Just r)

printResult Failure {..} = do
  printf "*** Failed after %d tests: %s\n" numTests (show $ pretty errorMsg)
  print counterExample
printResult Success {..} =
  printf "+++ OK, passed %d tests.\n" numTests

findDecl :: Prog -> Int -> Int -> Maybe (Var,Decl,Prog)
findDecl prog l c = do
  d <- find (surrounds l c . getSrcSpan) prog
  case d of
    DFun _ _ [(VarPat _ f, Lam {})] -> Just (f,d, takeWhile (before l c . getSrcSpan) prog)
    _                               -> Nothing

before l c (SrcSpan sl sc el ec)
  = l >= sl

surrounds l c (SrcSpan sl sc el ec)
  = sl <= l && l < el

safeTail [] = []
safeTail (x:xs) = xs

runProg = runProgWith stdOpts

runProgWith :: NanoOpts -> Prog -> IO Result
runProgWith opts prog =
  nanoCheck 0 0 opts $ do
    -- prog <- mapM refreshDecl prog
    v <- stepAllProg prog
    case last prog of
      DFun _ _ bnds
        -> last <$> mapM (\(p,e) -> fillInLams e []) bnds
      DEvl _ e
        -> fillInLams e []
      _ -> return v

checkDecl = checkDeclWith stdOpts

checkDeclWith :: NanoOpts -> Var -> Prog -> IO Result
checkDeclWith opts f prog = do
    r <- nanoCheck 0 0 opts $ do
      -- mapM_ evalDecl prog
      -- prog <- mapM refreshDecl prog
      stepAllProg prog
      fillInLams (Var Nothing f) []
    case r of
      Failure {}     -> return r
      Success _ st v -> go (f,st,v) r 1
  -- go r 1
  -- go (Success 0 initState (VU Nothing)) 0
  where
  go (f,st,v) r@(Failure {}) _ = return r
  go _ r@(Success n st v) _ | n >= maxTests opts = return r
  go (f,st,v) r@(Success n st' v') !m = do
    -- print (pretty v, pretty v')
    case fst3 (runEvalFull opts $ do
                  put st
                  vt <- typeOfM v
                  vt' <- typeOfM v'
                  unifyNoExn vt vt') of
      Left e -> return $ Failure (n+1) 0 0 (pretty "output-type mismatch!") e st'
      Right {} -> do
        r <- nanoCheck n m opts $ do
          -- prog <- mapM refreshDecl prog
          stepAllProg prog
          args <- replicateM (nArgs (fst (stRoot st))) $
                    (\r -> Hole Nothing r Nothing) <$> fresh
          fo (Var Nothing f) args

        go (f,st,v) r ((m+1) `mod` (size opts))


  unifyNoExn t1 t2 = unify (unExn t1) (unExn t2)
  unExn (TApp "exn" []) = TVar "exn"
  unExn t = t


  -- go r@(Failure {}) _      = return r
  -- go r@(Success 1000 st v) _ = return r
  -- go (Success n _st _v) !m  = do
  --   r <- nanoCheck n m stdOpts $ do
  --     -- mapM_ evalDecl prog
  --     prog <- mapM refreshDecl prog
  --     stepAllProg prog
  --     to (Var Nothing f) []
  --
  --   go r ((m+1) `mod` 5)


  fo f args = do
    let x = mkApps Nothing f args
    env <- gets stVarEnv
    setEntry (x,env)
    addSubTerms x
    stepAll x
    -- v <- stepAll x
    -- case v of
    --   Lam {} -> do
    --     arg <- (\r -> Hole Nothing r Nothing) <$> fresh
    --     -- let x = mkApps Nothing e (args ++ [arg])
    --     -- addSubTerms x
    --     to f (args ++ [arg])
    --   _ -> return v

fillInLams f args = do
  modify' $ \s -> s { stEdges = mempty }
  x <- refreshExpr $ mkApps Nothing f args
  env <- gets stVarEnv
  setEntry (x,env)
  v <- stepAll x
  case v of
    Lam {} -> do
      arg <- (\r -> Hole Nothing r Nothing) <$> fresh
      -- let x = mkApps Nothing e (args ++ [arg])
      -- addSubTerms x
      fillInLams f (args ++ [arg])
    _ -> return v

sec = 1000000 * 60

-- within n s x = do
--   m <- timeout s x
--   return $ fromMaybe (Failure (n+1) 0 0 (text "<<timeout>>") []) m

nanoCheck :: Int -> Int -> NanoOpts -> Eval Value -> IO Result
nanoCheck numSuccess maxSize opts x = do
  seed <- getRandom
  let opts' = opts { seed = seed, size = maxSize }
  x <- evaluate $ runEvalFull opts' x
  return $ case x of

    (Left (MLException e), st, _) -> Success (numSuccess + 1) st e
    (Left e, st, tr) ->
                  -- NOTE: don't forget to fill in holes with generated values
      let -- paths = map (map (fillHoles st)) $ unsafePerformIO $ makePaths st
          invoc = pretty (fillHoles st $ fst $ stRoot st)
      in Failure (numSuccess + 1) seed maxSize
                 invoc
                 e
                 st
--                 (vcat (text (show e) : invoc : []))
    (Right v, st, _) -> Success (numSuccess + 1) st v

-- fetchArg' st (Val v) = Val (fetchArg st v)
fetchArg' st e = e

fetchArg st (Hole _ r _)
  | Just (_,v) <- IntMap.lookup r st
  = fetchArg st v
fetchArg st (VL ms vs mt)
  = VL ms (map (fetchArg st) vs) mt
fetchArg st (VT ms vs)
  = VT ms (map (fetchArg st) vs)
fetchArg st (VA ms c (Just v) t)
  = VA ms c (Just (fetchArg st v)) t
--  TODO: fetchArg st (VR )
fetchArg st (VV ms vs mt)
  = VV ms (map (fetchArg st) vs) mt
fetchArg st v
  = v

checkAll = checkAllFrom "../yunounderstand/data/sp14/prog/unify"

data SP a b = SP !a !b

spfst (SP a b) = a
spsnd (SP a b) = b

checkAllFrom dir = parseAllIn dir >>= mapM (\(f,e,p) -> putStrLn ("\n" ++ f) >> check e p >>= \r -> maybe (return Nothing) (\r -> printResult r >> return (Just $! SP f $! resultEither r)) r)

resultEither Failure {..} = Left $! pretty errorMsg
resultEither Success {}   = Right ()

checkType :: MonadEval m => Value -> Type -> m Bool
checkType v t = typeOfM v >>= unify t >> return True
