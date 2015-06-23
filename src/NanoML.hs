{-# LANGUAGE FlexibleInstances #-}
module NanoML
  ( module NanoML.Parser
  , module NanoML.Types
  , module NanoML.Eval
  , check
  ) where

import           Control.Exception
import           Control.Monad
import           Control.Monad.Except
import qualified Data.Map                as Map
import           Data.Maybe
import           Data.List
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


check :: Prog -> IO ()
check prog =
  case last prog of
    DFun _ [(VarPat f, Lam {})]
      | Just t <- Map.lookup f knownFuncs
        -> do x:y:zs <- lines . output <$> checkFunc f t prog
              -- NOTE: there doesn't seem to be an easy way to make QC
              -- not output the Show instance of the counterexample,
              -- so just extract that (2nd) line..
              putStrLn $ unlines (x:zs)
    DFun _ [(WildPat, e)]
        -> putStrLn . output =<< runProg prog
    _ -> printf "I don't (yet) know how to check\n%s\n" (show $ prettyProg prog)

runProg :: Prog -> IO Result
runProg prog = quickCheckWithResult (stdArgs { chatty = False, maxSuccess = 1 })
             $ within sec $ ioProperty $ fmap addTrace $ runEval $ do
                 mapM evalDecl prog
                 -- liftIO $ putStrLn $ render $ pretty $ last vs

checkFunc :: Var -> Type -> Prog -> IO Result
checkFunc f t prog = quickCheckWithResult (stdArgs { chatty = False })
                   $ forAll (genArgs t)
                   $ \args -> -- counterexample (show . pretty $ mkApps (Var f) args)
                     within sec $ ioProperty $ fmap addTrace $ runEval $ do
                       mapM_ evalDecl prog
                       v   <- eval (mkApps (Var f) args)
                       v `assertType` resTy t
  where
  --addTrace :: Either (SomeException, [Expr]) Bool -> Result
  assertType :: Value -> Type -> Eval Bool
  assertType v t
    | v `checkType` t = return True
    | otherwise       = outputTypeMismatchError v t

sec = 5000000

addTrace (Right x) = property succeeded
addTrace (Left (e,t)) = counterexample (render $ vsep $ intersperse mempty t)
                      $ exception "*** Exception" (SomeException e)

-- fmap (filter isJust) $ forM progs $ \(f,p) -> check p >>= \r -> maybe (return Nothing) (\r -> putStrLn (f++"\n") >> return (Just (f,r))) r

checkType :: Value -> Type -> Bool
checkType v t = case t of
  TVar _ -> isInt v
  TCon t
    | t == tINT
      -> isInt v
    | t == tFLOAT
      -> isFloat v
    | t == tCHAR
      -> isChar v
    | t == tSTRING
      -> isString v
    | t == tBOOL
      -> isBool v
    | t == tUNIT
      -> isUnit v
  TApp (TCon "list") t -> isListOf t v
  TTup ts -> isTupleOf ts v
  _ :-> to -> isFunc v

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

isListOf t (VL vs) = all (`checkType` t) vs
isListOf _ _       = False

isTupleOf ts (VT n vs) = n == length ts && and (zipWith checkType vs ts)
isTupleOf _  _         = False

isFunc (VF {}) = True
isFunc _       = False
