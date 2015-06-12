module NanoML
  ( module NanoML.Parser
  , module NanoML.Types
  , module NanoML.Eval
  , check
  ) where

import Control.Monad
import Control.Monad.Catch
import qualified Data.Map as Map
import Data.Maybe
import System.IO.Unsafe
import System.Timeout
import Test.QuickCheck

import NanoML.Eval
import NanoML.Gen
import NanoML.Misc
import NanoML.Parser
import NanoML.Types


check :: Prog -> IO (Maybe Result)
check decls = do
  -- TODO: this should go inside the quickcheck property..
  env <- foldM (flip evalDecl) baseEnv decls
  case last decls of
    DFun _ [(VarPat f, Lam {})]
      | Just t <- Map.lookup f knownFuncs
        -> Just <$> checkFunc f t env
    _ -> return Nothing

checkFunc :: Var -> Type -> Env -> IO Result
checkFunc f t env = quickCheckResult -- (stdArgs { chatty = False })
                  $ forAll (genArgs t)
                  $ \args -> ioProperty $ do
                     mv <- timeout sec $ eval (mkApps (Var f) args) env
                     case mv of
                       Nothing -> throwM "Timed out (perhaps infinite recursion?)"
                       Just v  -> return (checkType v (resTy t))

  where sec = 100000

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


