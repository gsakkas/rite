{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE RankNTypes #-}
module NanoML.Types where

import Control.Arrow
import Control.Monad
import Control.Monad.Catch
import Control.Monad.Fix
import Control.Monad.Writer hiding (Alt)
import Data.Char
import Data.List
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Typeable
import Text.PrettyPrint.ANSI.Leijen (Doc)

import Debug.Trace
import Text.Printf

----------------------------------------------------------------------
-- Core Types
----------------------------------------------------------------------

type MonadEval m = (MonadThrow m, MonadFix m, MonadWriter [Doc] m)

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

lookupEnv :: MonadEval m => Var -> Env -> m Value
lookupEnv v (Env env) = case Map.lookup v env of
  Nothing -> throwM (UnboundVariable v)
  Just x  -> return x

toListEnv :: Env -> [(Var,Value)]
toListEnv (Env e) = Map.toList e

emptyEnv :: Env
emptyEnv = Env Map.empty

----------------------------------------------------------------------
-- Primitives
----------------------------------------------------------------------

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
           , ("List.fold_right"
             ,mkRec "List.fold_right"
                    (mkLams [VarPat "f", VarPat "b", VarPat "xs"]
                            (Case (Var "xs")
                             [(ConPat "[]" (TuplePat [])
                              ,Nothing
                              ,Var "b")
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,mkApps (Var "f")
                                      [Var "y"
                                      ,mkApps (Var "List.fold_right")
                                              [Var "f",Var "b", Var "ys"]
                                      ]
                              )
                             ]))
             )
           , ("List.map"
             ,mkRec "List.map"
                    (mkLams [VarPat "f", VarPat "xs"]
                            (Case (Var "xs")
                             [(ConPat "[]" (TuplePat [])
                              ,Nothing
                              ,Var "[]")
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,Cons (mkApps (Var "f") [Var "y"])
                                    (mkApps (Var "List.map")
                                            [Var "f"
                                            ,Var "ys"
                                            ])
                              )
                             ]))
             )
           , ("**", mkPrim2Fun $ P2 pexp)
           , ("@", mkPrim2Fun $ P2 pappend)
           , ("^", mkPrim2Fun $ P2 pconcat)
           , ("&&", mkPrim2Fun $ P2 pand)
           , ("&", mkPrim2Fun $ P2 pand)
           , ("||", mkPrim2Fun $ P2 por)
           , ("not", mkPrim1Fun $ P1 pnot)
           , ("fst", mkPrim1Fun $ P1 pfst)
           , ("snd", mkPrim1Fun $ P1 psnd)
           , ("failwith", mkPrim1Fun $ P1 pfailwith)
           , ("List.append", mkPrim2Fun $ P2 pappend)
           , ("List.combine", mkPrim2Fun $ P2 plist_combine)
           , ("List.hd", mkPrim1Fun $ P1 plist_hd)
           , ("List.length", mkPrim1Fun $ P1 plist_length)
           , ("List.mem", mkPrim2Fun $ P2 plist_mem)
           , ("List.rev", mkPrim1Fun $ P1 plist_rev)
           , ("List.split", mkPrim1Fun $ P1 plist_split)
           , ("List.tl", mkPrim1Fun $ P1 plist_tl)
           , ("String.get", mkPrim2Fun $ P2 pstring_get)
           , ("String.length", mkPrim1Fun $ P1 pstring_length)
           , ("int_of_char", mkPrim1Fun $ P1 pint_of_char)
           , ("int_of_float", mkPrim1Fun $ P1 pint_of_float)
           , ("float_of_int", mkPrim1Fun $ P1 pfloat_of_int)
           , ("string_of_int", mkPrim1Fun $ P1 pstring_of_int)
           , ("abs", mkPrim1Fun $ P1 pabs)
           , ("log10", mkPrim1Fun $ P1 plog10)
           ]

pfailwith :: MonadEval m => Value -> m Value
pfailwith (VS s) = throwM s

pfst :: MonadEval m => Value -> m Value
pfst (VT 2 [x,_]) = return x

psnd :: MonadEval m => Value -> m Value
psnd (VT 2 [_,y]) = return y

pand :: MonadEval m => Value -> Value -> m Value
pand (VB x) (VB y) = return (VB (x && y))

por :: MonadEval m => Value -> Value -> m Value
por (VB x) (VB y) = return (VB (x || y))

pnot :: MonadEval m => Value -> m Value
pnot (VB x) = return (VB (not x))

pabs :: MonadEval m => Value -> m Value
pabs (VI i) = return (VI (abs i))

pexp :: MonadEval m => Value -> Value -> m Value
pexp (VD i) (VD j) = return (VD (i ** j))

plog10 :: MonadEval m => Value -> m Value
plog10 (VD x) = return (VD (log x))

pint_of_char :: MonadEval m => Value -> m Value
pint_of_char (VC c) = return (VI (ord c))

pint_of_float :: MonadEval m => Value -> m Value
pint_of_float (VD d) = return (VI (truncate d))

pfloat_of_int :: MonadEval m => Value -> m Value
pfloat_of_int (VI i) = return (VD (fromIntegral i))

pstring_of_int :: MonadEval m => Value -> m Value
pstring_of_int (VI i) = return (VS (show i))

pstring_get :: MonadEval m => Value -> Value -> m Value
pstring_get (VS s) (VI i) = return (VC (s !! i))

pstring_length :: MonadEval m => Value -> m Value
pstring_length (VS s) = return (VI (length s))

plist_combine :: MonadEval m => Value -> Value -> m Value
plist_combine (VL xs) (VL ys)
  | length xs == length ys
  = return (VL (zipWith (\x y -> VT 2 [x,y]) xs ys))

plist_split :: MonadEval m => Value -> m Value
plist_split (VL xs) = return (VT (length xs) [VL as, VL bs])
  where
  (as, bs) = unzip . map (\(VT _ [a,b]) -> (a,b)) $ xs

plist_mem :: MonadEval m => Value -> Value -> m Value
plist_mem x (VL xs) = VB <$> allM (`eqVal` x) xs

plist_length :: MonadEval m => Value -> m Value
plist_length (VL s) = return (VI (length s))

plist_rev :: MonadEval m => Value -> m Value
plist_rev (VL xs) = return (VL (reverse xs))

plist_hd :: MonadEval m => Value -> m Value
plist_hd (VL (x:_)) = return x

plist_tl :: MonadEval m => Value -> m Value
plist_tl (VL (_:xs)) = return (VL xs)

pappend :: MonadEval m => Value -> Value -> m Value
pappend (VL xs) (VL ys) = return (VL (xs ++ ys))

pconcat :: MonadEval m => Value -> Value -> m Value
pconcat (VS xs) (VS ys) = return (VS (xs ++ ys))


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

mkPrim1Fun :: Prim1 -> Value
mkPrim1Fun f = VF $ Func (mkLams [VarPat "x"]
                                 (Prim1 f (Var "x")))
                         emptyEnv

mkPrim2Fun :: Prim2 -> Value
mkPrim2Fun f = VF $ Func (mkLams [VarPat "x", VarPat "y"]
                                 (Prim2 f (Var "x") (Var "y")))
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
  | App Expr [Expr]
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
  | Prim1 Prim1 Expr
  | Prim2 Prim2 Expr Expr
  | Val Value -- embed a value inside an Expr for ease of tracing
  deriving (Show)

newtype Prim1 = P1 (forall m. MonadEval m => Value -> m Value)
instance Show Prim1 where
  show _ = "<prim>"
newtype Prim2 = P2 (forall m. MonadEval m => Value -> Value -> m Value)
instance Show Prim2 where
  show _ = "<prim>"

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

infixr :->

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
mkApps = App

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

eqVal (VI x) (VI y) = return (x == y)
eqVal (VD x) (VD y) = return (x == y)
eqVal (VB x) (VB y) = return (x == y)
eqVal VU     VU     = return True
eqVal (VL x) (VL y) = and . ((length x == length y) :) <$> zipWithM eqVal x y
eqVal (VT i x) (VT j y)
  | i == j
  = and <$> zipWithM eqVal x y
eqVal _ _
  = return False
--  = throwM (printf "cannot check incompatible types for equality: (%s) (%s)" (show x) (show y) :: String)


allM :: Monad m => (a -> m Bool) -> [a] -> m Bool
allM f []     = return True
allM f (x:xs) = (&&) <$> f x <*> allM f xs
