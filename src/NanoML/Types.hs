{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE PartialTypeSignatures #-}
module NanoML.Types where

import Control.Arrow
import Control.Monad.Catch hiding (try)
import Data.List
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Typeable

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
  Nothing -> error $ "unbound variable: " ++ v -- throwM (UnboundVariable v)
  Just x  -> return x

emptyEnv :: Env
emptyEnv = Env Map.empty

primBops :: [(Var, Bop)]
primBops = [("+",Plus), ("-",Minus), ("*",Times), ("/",Div), ("mod",Mod)
           ,("+.",FPlus), ("-.",FMinus), ("*.",FTimes), ("/.",FDiv)
           ,("=",Eq), ("==",Eq), ("<>",Neq), ("!=",Neq)
           ,(">",Gt), (">=", Ge), ("<",Lt), ("<=",Le)
           ]

primVars :: [(Var, Value)]
primVars = [ ("[]", VL [])
           , ("::", VF (Func (mkLams [VarPat "x", VarPat "xs"]
                                     (Cons (Var "x") (Var "xs")))
                             emptyEnv))
           , ("()", VU)
           , ("List.fold_left"
             ,mkRec "List.fold_left"
                    (mkLams [VarPat "f", VarPat "b", VarPat "xs"]
                            (Case (Var "xs")
                             [(ConPat "[]" (TuplePat [])
                              ,Nothing
                              ,Var "b")
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,mkApps (Var "List.fold_left")
                                      [Var "f"
                                      ,mkApps (Var "f") [Var "b",Var "y"]
                                      ,Var "ys"
                                      ]
                              )
                             ]))
             )
           ]

mkRec :: Var -> Expr -> Value
mkRec f lam = func
  where
  func = VF (Func lam env)
  env  = insertEnv f func baseEnv

baseEnv :: Env
baseEnv = Env . Map.fromList
        $  map (second mkBopFun) primBops
        ++ primVars

mkBopFun :: Bop -> Value
mkBopFun bop = VF $ Func (mkLams [VarPat "x", VarPat "y"]
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
  | VF Func
  deriving (Show)

data Func
  = Func Expr Env

-- NOTE: we can NEVER print the captured environment since recursive
-- functions will refer to themselves
instance Show Func where
  showsPrec p (Func expr _) = showsPrec p expr

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

-- data ExprF f
--   = VarF Var
--   | LamF Var f
--   | AppF f f
--   | BopF Bop f f
--   | LitF Literal
--   | LetF RecFlag Pat f f
--   | IteF f f f
--   | SeqF f f -- TODO: do we actually need this for the student examples?
--   | CaseF f [(Pat, ExprF f)]
--   | ConsF f f
--   | NilF
--   | TupleF [f]
--   deriving (Show, Functor)

-- type LocExpr = Fix ExprF Careted

data Uop
  = Neg | FNeg
  deriving (Show)

data Bop
  = Eq | Neq
  | Lt | Le
  | Gt | Ge
  | And | Or
  | Plus  | Minus  | Times  | Div  | Mod
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
  | WildPat
  deriving (Show)

data Type
  = TVar TVar
  | TCon TCon
  | TApp Type Type
  | Type :-> Type
  | TTup [Type]
  deriving (Show)

tINT = "int"
tFLOAT = "float"
tCHAR = "char"
tSTRING = "string"
tBOOL = "bool"
tLIST = "list"
tUNIT = "()"

argTys :: Type -> [Type]
argTys (i :-> o) = i : argTys o
argTys _         = []

resTy :: Type -> Type
resTy (_ :-> o) = resTy o
resTy t         = t

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

mkInfix :: Expr -> Expr -> Expr -> Expr
mkInfix x op y = mkApps op [x,y]

mkApps :: Expr -> [Expr] -> Expr
mkApps = foldl' App

mkLams :: [Pat] -> Expr -> Expr
mkLams ps e = case ps of
  []   -> e
  p:ps -> Lam p (mkLams ps e)

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
