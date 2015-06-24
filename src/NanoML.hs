{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE RecordWildCards   #-}
module NanoML
  ( module NanoML.Parser
  , module NanoML.Types
  , module NanoML.Eval
  , check
  ) where

import           Control.Exception
import           Control.Monad
import           Control.Monad.Except
import           Data.List
import qualified Data.Map                 as Map
import           Data.Maybe
import           Data.Typeable
import           System.IO.Unsafe
import           System.Timeout
import           Test.QuickCheck
import           Test.QuickCheck.Monadic
import           Test.QuickCheck.Property hiding (Result)
import           Text.Printf

import           NanoML.Eval
import           NanoML.Gen
import           NanoML.Misc
import           NanoML.Parser
import           NanoML.Pretty
import           NanoML.Types


check :: Prog -> IO (Maybe Result)
check prog =
  case last prog of
    DFun _ [(VarPat f, Lam {})]
      | Just t <- Map.lookup f knownFuncs
        -> do r <- checkFunc f t prog
              let x:xs = lines $ output r
              -- NOTE: there doesn't seem to be an easy way to make QC
              -- not output the Show instance of the counterexample,
              -- so just extract that (2nd) line..
              putStr $ unlines (x : safeTail xs)
              return $ Just r
    DFun _ [(WildPat, e)]
        -> do r <- runProg prog
              putStr $ output r
              return $ Just r
    _ -> do printf "I don't (yet) know how to check this program!\n" -- (show $ prettyProg prog)
            return Nothing

safeTail [] = []
safeTail (x:xs) = xs

runProg :: Prog -> IO Result
runProg prog = quickCheckWithResult (stdArgs { chatty = False, maxSuccess = 1 })
             $ within sec $ ioProperty $ fmap addTrace $ runEval loudOpts $ do
                 mapM evalDecl prog
                 -- liftIO $ putStrLn $ render $ pretty $ last vs

loudOpts = NanoOpts { enablePrint = True }
quietOpts = NanoOpts { enablePrint = False }

checkFunc :: Var -> Type -> Prog -> IO Result
checkFunc f t prog = quickCheckWithResult (stdArgs { chatty = False })
                   $ forAll (genArgs t)
                   $ \args -> counterexample (show . pretty $ mkApps (Var f) args) $
                     within sec $ ioProperty $ fmap addTrace $ runEval quietOpts $ do
                       mapM_ evalDecl prog
                       v <- eval (mkApps (Var f) args)
                       b <- v `checkType` resTy t
                       if b
                         then return True
                         else outputTypeMismatchError v t

sec = 5000000

addTrace (Right x) = property succeeded
addTrace (Left (e,t)) = -- counterexample (render $ vsep $ intersperse mempty t) $
                        property $
                        exception "*** Exception" (SomeException e)

checkAll = testParser >>= mapM (\(f,p) -> putStrLn ("\n" ++ f) >> check p >>= \r -> maybe (return Nothing) (\r -> return (Just (f,r))) r)

checkType :: MonadEval m => Value -> Type -> m Bool
checkType v t = case t of
  TVar _ -> return $ isInt v
  TCon t
    | t == tINT
      -> return $ isInt v
    | t == tFLOAT
      -> return $ isFloat v
    | t == tCHAR
      -> return $ isChar v
    | t == tSTRING
      -> return $ isString v
    | t == tBOOL
      -> return $ isBool v
    | t == tUNIT
      -> return $ isUnit v
  TApp "list" [t] -> v `isListOf` t
  TApp c ts -> (v `isAlgOf` c) ts
  TTup ts -> v `isTupleOf` ts
  _ :-> to -> return $ isFunc v


isInt, isFloat, isChar, isString, isBool, isUnit :: Value -> Bool

isInt (VI {}) = True
isInt _       = False

isFloat (VD {}) = True
isFloat _       = False

isChar (VC {}) = True
isChar _       = False

isString (VS {}) = True
isString _       = False

isBool (VB {}) = True
isBool _       = False

isUnit VU = True
isUnit _  = False

isAlgOf :: MonadEval m => Value -> TCon -> [Type] -> m Bool
isAlgOf v tc ts = do
  TypeDecl {..} <- lookupType tc
  case tyRhs of
    Alias ty
      -> v `checkType` ty
    Alg ds
      | VA dc vs <- v
        -> case find (\d -> dc == dCon d ) ds of
             Nothing -> return False
             Just DataDecl {..} -> allM (uncurry checkType)
                                        (zip vs (map (subst (zip tyVars ts)) dArgs))
      | otherwise -> return False

isListOf (VL vs) t = allM (`checkType` t) vs
isListOf _ _       = return False

isTupleOf (VT n vs) ts
  | length ts == length vs
  = allM (uncurry checkType) (zip vs ts)
isTupleOf _  _
  = return False

isFunc (VF {}) = True
isFunc _       = False
