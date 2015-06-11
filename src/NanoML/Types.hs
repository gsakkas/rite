{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE PartialTypeSignatures #-}
module NanoML.Types where

import Control.Applicative
import Control.Arrow
import Control.Monad
import Control.Monad.Catch hiding (try)
import Control.Monad.IO.Class
import qualified Data.HashSet as HashSet
import Data.Functor
import Data.List
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Typeable
import System.Directory
import System.FilePath
import Text.Parser.Expression
import Text.Parser.Token.Highlight
import Text.Parser.Token.Style
import Text.Trifecta

import Debug.Trace
import Text.Printf

----------------------------------------------------------------------
-- Core Types
----------------------------------------------------------------------

type Var = String

newtype Env = Env (Map Var Value)

instance Monoid Env where
  mempty  = baseEnv
  mappend = joinEnv

insertEnv :: Var -> Value -> Env -> Env
insertEnv var val (Env env) = Env (Map.insert var val env)

-- | Left-biased union of environments.
joinEnv :: Env -> Env -> Env
joinEnv (Env e1) (Env e2) = Env (Map.union e1 e2)

lookupEnv :: MonadThrow m => Var -> Env -> m Value
lookupEnv v (Env env) = case Map.lookup v env of
  Nothing -> throwM (UnboundVariable v)
  Just x  -> return x

emptyEnv :: Env
emptyEnv = Env Map.empty

primBops :: [(Var, Bop)]
primBops = [("+",Plus), ("-",Minus), ("*",Times), ("/",Div)
           ,("=",Eq), ("==",Eq), ("<>",Neq), ("!=",Neq)
           ,(">",Gt), (">=", Ge), ("<",Lt), ("<=",Le)
           ]

baseEnv :: Env
baseEnv = Env . Map.fromList . map (second mkBopFun) $ primBops

mkBopFun :: Bop -> Value
mkBopFun bop = VF $ Func (VarPat "x")
                         (Lam (VarPat "y")
                              (Bop bop (Var "x") (Var "y")))
                         emptyEnv

data UnboundVariable
  = UnboundVariable Var
  deriving (Show, Typeable)
instance Exception UnboundVariable

data Value
  = VI Int
  | VD Double
  | VC Char
  | VS String
  | VB Bool
  | VU
  | VL [Value]
  | VT Int [Value] -- VT sz:{Nat | sz >= 2} (ListN Value sz)
  | VF Func --  (Maybe Var) Env Pat Expr
  deriving (Show)

data Func
  = Func Pat Expr Env

-- NOTE: we can NEVER print the captured environment since recursive
-- functions will refer to themselves
instance Show Func where
  showsPrec p (Func pat expr _) = showsPrec p expr

data Literal
  = LI Int
  | LD Double
  | LB Bool
  | LC Char
  | LS String
  | LU
  deriving (Show)

data RecFlag = Rec | NonRec deriving (Show)

type Prog = [Decl]

data Decl
  = DFun RecFlag [(Pat,Expr)]
  | DTyp TypeDecl
  deriving (Show)

data Expr
  = Var Var
  | Lam Pat Expr
  | App Expr Expr
  | Bop Bop Expr Expr
  | Uop Uop Expr
  | Lit Literal
  | Let RecFlag [(Pat,Expr)] Expr
  | Ite Expr Expr Expr
  | Seq Expr Expr -- TODO: do we actually need this for the student examples?
  | Case Expr [Alt]
  | Cons Expr Expr
  | Nil
  | Tuple [Expr]
  deriving (Show)

data ExprF f
  = VarF Var
  | LamF Var f
  | AppF f f
  | BopF Bop f f
  | LitF Literal
  | LetF RecFlag Pat f f
  | IteF f f f
  | SeqF f f -- TODO: do we actually need this for the student examples?
  | CaseF f [(Pat, ExprF f)]
  | ConsF f f
  | NilF
  | TupleF [f]
  deriving (Show, Functor)

--type LocExpr = Fix ExprF Careted

data Uop
  = Neg | FNeg
  deriving (Show)

data Bop
  = Eq | Neq
  | Lt | Le
  | Gt | Ge
  | And | Or
  | Plus  | Minus  | Times  | Div
  | FPlus | FMinus | FTimes | FDiv | FExp
  deriving (Show)

type Alt = (Pat, Guard, Expr)

type Guard = Maybe Expr

data Pat
  = VarPat Var
  | LitPat Literal
  | ConsPat Pat Pat
  | ConPat Var Pat
  | ListPat [Pat]
  | TuplePat [Pat]
--  | FunPat Var [Pat] -- TODO: should this be `[Pat]`?
  | WildPat
  deriving (Show)

data Type
  = TVar TVar
  | TCon TCon
  | TApp Type Type
  | Type :-> Type
  | TTup [Type]
  deriving (Show)

data TypeDecl
  = TypeDecl { tyCon :: TCon, tyVars :: [TVar], tyRhs :: TypeRhs }
  deriving (Show)

data TypeRhs
  = Alias Type
  | Alg   [DataDecl]
  deriving (Show)

data DataDecl
  = DataDecl { dCon :: DCon, dArgs :: [Type] }
  deriving (Show)

type TVar = String

type TCon = String

type DCon = String

instance Exception [Char]


----------------------------------------------------------------------
-- Utilities
----------------------------------------------------------------------

{-@ mkCurried :: ListNE Pat -> Expr -> Expr @-}
mkCurried :: [Pat] -> Expr -> Expr
mkCurried [p]    e = Lam p e
mkCurried (p:ps) e = Lam p (mkCurried ps e)
mkCurried p e = error $ "mkCurried: " ++ show p ++ " " ++ show e

-- setClosureName :: Var -> Value -> Value
-- setClosureName f (VF _ r v e) = VF (Just f) r v e

mkInfix :: Expr -> Expr -> Expr -> Expr
mkInfix x op y = mkApps op [x,y]

mkApps :: Expr -> [Expr] -> Expr
mkApps = foldl' App

mkList :: [Expr] -> Expr
mkList = foldr Cons Nil

mkFunction :: [Alt] -> Expr
mkFunction alts = Lam (VarPat "$x") (Case (Var "$x") alts)

mkTApps :: Type -> [Type] -> Type
mkTApps = foldl' TApp

mkUMinus :: Var -> Expr -> Expr
mkUMinus "-"  (Lit (LI i)) = Lit (LI (- i))
mkUMinus "-." (Lit (LD d)) = Lit (LD (- d))
mkUMinus "-"  e            = mkApps (Var "-")  [Lit (LI 0), e]
mkUMinus "-." e            = mkApps (Var "-.") [Lit (LD 0), e]


----------------------------------------------------------------------
-- Utilities
----------------------------------------------------------------------

-- evalString :: MonadThrow m => String -> m Value
-- evalString s = case parseString expr mempty s of
--   Success e -> eval e emptyEnv


-- knownFuncs :: [Var]
-- knownFuncs = [ "sumList"
--              , "digitsOfInt"
--              , "additivePersistence"
--              , "digitalRoot"
--              , "listReverse"
--              , "palindrome"
--              , "assoc"
--              , "removeDuplicates"
--              , "wwhile"
--              , "fixpoint"
--              , "exprToString"
--              , "eval"
--              , "build"
--              , "sqsum"
--              , "pipe"
--              , "sepConcat"
--              , "stringOfList"
--              , "clone"
--              , "padZero"
--              , "removeZero"
--              , "bigAdd"
--              , "mulByDigit"
--              , "bigMul"
--              ]
