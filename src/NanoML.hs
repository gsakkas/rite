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
import           Data.List
import qualified Data.Map                 as Map
import           Data.Maybe
import           Data.Typeable (Typeable)
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
      , Just t <- Map.lookup f knownFuncs
        -> do r <- checkFunc f t p
              printResult r
              return $ Just r
    DFun _ _ [(VarPat f, Lam {})]
      | Just t <- Map.lookup f knownFuncs
        -> do r <- checkFunc f t prog
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
-- runProg prog = quickCheckWithResult (stdArgs { chatty = False, maxSuccess = 1 })
--              $ within sec $ fmap nanoCheck $ runEval stdOpts $ do
--                  mapM_ evalDecl prog
--                  -- liftIO $ putStrLn $ render $ pretty $ last vs

checkFunc :: Var -> Type -> Prog -> IO Result
checkFunc f t prog = go (Success 0) 0
  where
  go r@(Failure {}) _ = return r
  go (Success 1000) _ = return (Success 1000)
  go (Success n) !m   = do
    r <- within n sec $ nanoCheck n m stdOpts $ do
      -- s <- asks size
      -- traceM $ printf "size=%d" s
      mapM_ evalDecl prog
      env <- gets stTypeEnv
      -- traceShowM "generating args"
      args <- genArgs t env
      -- traceShowM (pretty $ VT 0 args [])
      rememberArgs args
      v <- eval (mkApps (Var f) (map Val args))
      -- traceShowM v
      b <- v `checkType` resTy t
      unless b $ outputTypeMismatchError v t
    go r ((m+1) `mod` 10)
                        
    
-- checkFunc f t prog = quickCheckWithResult (stdArgs { chatty = False, maxSize = 10, maxSuccess = 1000 })
--                    $ within sec $ fmap nanoCheck $ runEval stdOpts $ do
--                      mapM_ evalDecl prog
--                      env <- gets stTypeEnv
--                      args <- liftGen (genArgs t env)
--                      v <- eval (mkApps (Var f) args)
--                      b <- v `checkType` resTy t
--                      unless b $ outputTypeMismatchError v t
                     
  --                    (x, st, log) <- run $ runEvalFull stdOpts $ mapM_ evalDecl prog
  --                    case x of
  --                      Right _ -> continue st log
  --                      -- Left (MLException _) -> continue st log
  --                      Left e
  --                        --  Env env <- stVarEnv st
  --                        -- , Just _ <- Map.lookup f env
  --                        --   -- if evaluation aborts after the function we want to test
  --                        --   -- has been defined, we can go ahead and test it!
  --                        --   -> continue st log
  --                        | otherwise -> return (Left (e, log))
  -- where
  -- continue st log = do
  --   args <- pick (genArgs t $ stTypeEnv st)
  --   monitor $ counterexample (show . pretty $ mkApps (Var f) args)
  --   run $ runEval stdOpts $ do
  --     put st; tell log -- first of all, restore the state and log
  --     v <- eval (mkApps (Var f) args)
  --     b <- v `checkType` resTy t
  --     if b
  --       then return ()
  --       else outputTypeMismatchError v t


sec = 1000000 * 60

within n s x = do
  m <- timeout s x
  return $ fromMaybe (Failure (n+1) 0 0 (text "<<timeout>>")) m

nanoCheck :: Int -> Int -> NanoOpts -> Eval () -> IO Result
nanoCheck numSuccess maxSize opts x = do
  seed <- getRandom
  let opts' = opts { seed = seed, size = maxSize }
  x <- evaluate $ runEval opts' x
  return $ case x of
    Left (MLException e, t) -> Success (numSuccess + 1)
    Left (e, tr) -> Failure (numSuccess + 1) seed maxSize
                            (vcat (text (show e) : []{-tr-}))
    Right _      -> Success (numSuccess + 1)

-- nanoCheck :: Either (NanoError, [Doc]) a -> Property
-- nanoCheck m = case m of
--   Right x    -> collect "no error" $ property True
--   Left (MLException e, t) -> collect "MLException" $ property True
--   Left (e, t) -> collect "failure" $ counterexample ("*** Exception: " ++ show e) $ property False
-- --                      ++ "\n" ++ (render $ vsep $ intersperse mempty t)

checkAll = checkAllFrom "../yunounderstand/data/sp14/prog/unify"

checkAllFrom dir = parseAllIn dir >>= mapM (\(f,e,p) -> putStrLn ("\n" ++ f) >> check e p >>= \r -> maybe (return Nothing) (\r -> return (Just (f,r))) r)

checkType :: MonadEval m => Value -> Type -> m Bool
checkType v t = unify t (typeOf v) >> return True
  -- case t of
  -- TVar _ -> return $ isInt v
  -- TCon t
  --   | t == tINT
  --     -> return $ isInt v
  --   | t == tFLOAT
  --     -> return $ isFloat v
  --   | t == tCHAR
  --     -> return $ isChar v
  --   | t == tSTRING
  --     -> return $ isString v
  --   | t == tBOOL
  --     -> return $ isBool v
  --   | t == tUNIT
  --     -> return $ isUnit v
  --   | otherwise
  --     -> (v `isAlgOf` t) []
  -- TApp "list" [t] -> v `isListOf` t
  -- TApp c ts -> (v `isAlgOf` c) ts
  -- TTup ts -> v `isTupleOf` ts
  -- _ :-> to -> return $ isFunc v


-- isInt, isFloat, isChar, isString, isBool, isUnit :: Value -> Bool

-- isInt (VI {}) = True
-- isInt _       = False

-- isFloat (VD {}) = True
-- isFloat _       = False

-- isChar (VC {}) = True
-- isChar _       = False

-- isString (VS {}) = True
-- isString _       = False

-- isBool (VB {}) = True
-- isBool _       = False

-- isUnit VU = True
-- isUnit _  = False

-- isAlgOf :: MonadEval m => Value -> TCon -> [Type] -> m Bool
-- isAlgOf v tc ts = do
--   TypeDecl {..} <- lookupType tc
--   case tyRhs of
--     Alias ty
--       -> v `checkType` ty
--     Alg ds
--       | VA dc vs t <- v
--         -> case find (\d -> dc == dCon d ) ds of
--              Nothing -> return False
--              Just DataDecl {..} -> allM (uncurry checkType)
--                                         (zip vs (map (subst (zip tyVars ts)) dArg))
--       | otherwise -> return False

-- isListOf (VL vs t) t' = return (t == t')
-- isListOf _ _          = return False

-- isTupleOf (VT n vs ts) ts' = return (ts == ts')
--   --  length ts == length vs
--   -- = allM (uncurry checkType) (zip vs ts)
-- isTupleOf _  _
--   = return False

-- isFunc (VF {}) = True
-- isFunc _       = False
