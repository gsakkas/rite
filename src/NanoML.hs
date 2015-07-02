{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE RecordWildCards   #-}
module NanoML
  ( module NanoML.Parser
  , module NanoML.Types
  , module NanoML.Eval
  , check, checkAll
  ) where

import           Control.Exception
import           Control.Monad
import           Control.Monad.Except
import           Control.Monad.State
import           Control.Monad.Writer
import           Data.List
import qualified Data.Map                 as Map
import           Data.Maybe
import           Data.Typeable (Typeable)
import           System.IO.Unsafe
import           System.Timeout
import           Test.QuickCheck
import           Test.QuickCheck.Monadic
import           Test.QuickCheck.Property hiding (Result)
import           Test.SmartCheck
import           Text.Printf
import           Text.Regex.TDFA

import           NanoML.Eval
import           NanoML.Gen
import           NanoML.Misc
import           NanoML.Parser
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
      , Just (f,d) <- traceShow (l,c) $ findDecl prog (read l) (read c)
      , Just t <- traceShow f $ Map.lookup f knownFuncs
        -> do traceShowM t
              r <- checkFunc f t prog
              let x:xs = lines $ output r
              -- NOTE: there doesn't seem to be an easy way to make QC
              -- not output the Show instance of the counterexample,
              -- so just extract that (2nd) line..
              putStr $ unlines (x : safeTail xs)
              return $ Just r
    DFun _ _ [(VarPat f, Lam {})]
      | Just t <- Map.lookup f knownFuncs
        -> do r <- checkFunc f t prog
              let x:xs = lines $ output r
              -- NOTE: there doesn't seem to be an easy way to make QC
              -- not output the Show instance of the counterexample,
              -- so just extract that (2nd) line..
              putStr $ unlines (x : safeTail xs)
              return $ Just r
    DFun _ _ [(WildPat, _)]
        -> do r <- runProg prog
              putStr $ output r
              return $ Just r
    DFun _ _ [(VarPat _, _)]
        -> do r <- runProg prog
              putStr $ output r
              return $ Just r
    _ -> do printf "I don't (yet) know how to check this program!\n" -- (show $ prettyProg prog)
            return Nothing

findDecl :: Prog -> Int -> Int -> Maybe (Var,Decl)
findDecl prog l c = do
  d <- find (surrounds l c . getSrcSpan) prog
  case d of
    DFun _ _ [(VarPat f, Lam {})] -> Just (f,d)
    _                             -> Nothing

surrounds l c (SrcSpan sl sc el ec)
  = sl <= l && l < el

safeTail [] = []
safeTail (x:xs) = xs

runProg :: Prog -> IO Result
runProg prog = quickCheckWithResult (stdArgs { chatty = False, maxSuccess = 1 })
             $ within sec $ nanoCheck $ run $ runEval stdOpts $ do
                 mapM evalDecl prog
                 -- liftIO $ putStrLn $ render $ pretty $ last vs

checkFunc :: Var -> Type -> Prog -> IO Result
checkFunc f t prog = quickCheckWithResult (stdArgs { chatty = False, maxSize = 10, maxSuccess = 100 })
                   $ within sec $ nanoCheck $ do
                     (x, st, log) <- run $ runEvalFull stdOpts $ mapM_ evalDecl prog
                     case x of
                       Right _ -> continue st log
                       -- Left (MLException _) -> continue st log
                       Left e
                         | Env env <- stVarEnv st
                         , Just _ <- Map.lookup f env
                           -- if evaluation aborts after the function we want to test
                           -- has been defined, we can go ahead and test it!
                           -> continue st log
                         | otherwise -> return (Left (e, log))
  where
  continue st log = do
    args <- pick (genArgs t $ stTypeEnv st)
    monitor $ counterexample (show . pretty $ mkApps (Var f) args)
    run $ runEval stdOpts $ do
      put st; tell log -- first of all, restore the state and log
      v <- eval (mkApps (Var f) args)
      b <- v `checkType` resTy t
      if b
        then return ()
        else outputTypeMismatchError v t

sec = 5000000

nanoCheck m = monadicIO $ m >>= \case
  Right x    -> return ()
--  Left (MLException _, t) -> return ()
  Left (e, t) -> -- counterexample (render $ vsep $ intersperse mempty t) $
                 fail $ "*** Exception: " ++ show e

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
