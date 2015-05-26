module NanoML where

import Data.Map (Map)
import qualified Data.Map as Map

----------------------------------------------------------------------
-- Core Types
----------------------------------------------------------------------

type Var = String

type Env = Map Var Value

insertEnv :: Var -> Value -> Env -> Env
insertEnv = Map.insert

lookupEnv :: Var -> Env -> Maybe Value
lookupEnv = Map.lookup

data Value
  = VI Int
  | VD Double
  | VB Bool
  | VU
  | VL [Value]
  | VT Int [Value] -- VT sz:Nat (ListN Value sz)
  | VC Env Var Expr
  deriving (Show)

data Expr
  = Var Var
  | Lam Var Expr
  | App Expr Expr
  | Let Var Expr Expr
  | Ite Expr Expr Expr
  | Seq Expr Expr -- TODO: do we actually need this for the student examples?
  | Case Expr [Alt]
  deriving (Show)

type Alt = (Pat, Expr)

data Pat
  = Pat
  deriving (Show)

