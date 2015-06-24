{-# LANGUAGE ConstraintKinds       #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE LambdaCase            #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE RankNTypes            #-}
{-# LANGUAGE RecordWildCards       #-}
module NanoML.Types where

import           Control.Arrow
import           Control.Exception
import           Control.Monad
import           Control.Monad.Except
import           Control.Monad.Fix
import           Control.Monad.Reader
import           Control.Monad.State
import           Control.Monad.Writer         hiding (Alt)
import           Data.Char
import           Data.List
import           Data.Map                     (Map)
import qualified Data.Map                     as Map
import           Data.Maybe
import           Data.Typeable
import           Text.PrettyPrint.ANSI.Leijen (Doc)

import           Debug.Trace
import           Text.Printf

----------------------------------------------------------------------
-- Core Types
----------------------------------------------------------------------

type MonadEval m = ( MonadError NanoError m
                   , MonadReader NanoOpts m
                   , MonadWriter [Doc] m
                   , MonadState EvalState m
                   , MonadFix m, MonadIO m
                   )

type Var = String

data NanoOpts
  = NanoOpts { enablePrint :: Bool -- ^ Should we actually print things to stdout?
             }
  deriving Show

data NanoError
  = MLException Value
  | UnboundVariable Var
  | TypeError String -- TODO:
  | ParseError String
  | OutputTypeMismatch Value Type
  deriving (Show, Typeable)

instance Exception NanoError

varToInt (TVar _)     = TCon tINT
varToInt (TCon c)     = TCon c
varToInt (TTup ts)    = TTup (map varToInt ts)
varToInt (TApp c ts)  = TApp c (map varToInt ts)
varToInt (ti :-> to)  = varToInt ti :-> varToInt to


typeError :: MonadEval m => String -> m a
typeError = throwError . TypeError

outputTypeMismatchError :: MonadEval m => Value -> Type -> m a
outputTypeMismatchError v t = throwError (OutputTypeMismatch v (varToInt t))

data EvalState
  = EvalState { stVarEnv  :: Env
              , stTypeEnv :: Map TCon TypeDecl
              , stDataEnv :: Map DCon DataDecl
              , stStore   :: Env
              }

initState :: EvalState
initState = EvalState { stVarEnv = baseEnv
                      , stTypeEnv = baseTypeEnv
                      , stDataEnv = baseDataEnv
                      , stStore = emptyEnv
                      }

setVarEnv :: MonadEval m => Env -> m ()
setVarEnv env = modify' $ \ s -> s { stVarEnv = env }

addType :: MonadEval m => TypeDecl -> m ()
addType td@TypeDecl {..} = modify' $ \ s ->
  s { stTypeEnv = Map.insert tyCon td (stTypeEnv s)
    , stDataEnv = Map.union dcons (stDataEnv s) }
  where
  dcons = case tyRhs of
    Alias _ -> mempty
    Alg dds -> Map.fromList [(dCon,dd) | dd@DataDecl {..} <- dds]

extendType :: MonadEval m => TCon -> DataDecl -> m ()
extendType tcon ddecl = modify' $ \ s ->
  s { stTypeEnv = Map.adjust addDDecl tcon (stTypeEnv s)
    , stDataEnv = Map.insert (dCon ddecl) ddecl (stDataEnv s)
    }
  where
  addDDecl TypeDecl {..} = case tyRhs of
    Alias _ -> error $ "cannot extend type alias: " ++ tcon
    Alg ds  -> let tyRhs = Alg (ddecl:ds) in TypeDecl {..}

lookupType :: MonadEval m => TCon -> m TypeDecl
lookupType tcon = do
  tys <- gets stTypeEnv
  case Map.lookup tcon tys of
    Nothing -> typeError ("unknown type: " ++ tcon)
    Just t -> return t

-- lookupTypeDataCon :: MonadEval m => TCon -> DCon -> m [Type]
-- lookupTypeDataCon tcon dcon = do
--   ds <- lookupType tcon
--   case find (\d -> dcon == dCon d ) ds of
--     Nothing -> typeError (dcon ++ " is not a constructor of " ++ tcon)
--     Just DataDecl {..} -> return dArgs

lookupDataCon :: MonadEval m => DCon -> m [Type]
lookupDataCon dc = do
  dcons <- gets stDataEnv
  case Map.lookup dc dcons of
    Nothing -> typeError ("unknown data constructor: " ++ dc)
    Just DataDecl {..} -> return dArgs

subst :: [(TVar, Type)] -> Type -> Type
subst su t = case t of
  TVar x -> fromMaybe t (lookup x su)
  TCon _ -> t
  TApp c ts -> TApp c (map (subst su) ts)
  ti :-> to -> subst su ti :-> subst su to
  TTup ts -> TTup (map (subst su) ts)

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
  Nothing -> throwError (UnboundVariable v)
  Just x  -> return x

toListEnv :: Env -> [(Var,Value)]
toListEnv (Env e) = Map.toList e

emptyEnv :: Env
emptyEnv = Env Map.empty

withEnv :: MonadEval m => m a -> Env -> m a
m `withEnv` env = do
  st <- get
  setVarEnv env
  a <- m
  put st
  return a

----------------------------------------------------------------------
-- Primitives
----------------------------------------------------------------------

baseTypeEnv = Map.fromList
  [ ("()",     TypeDecl "()"     []    (Alg [DataDecl "()" []]))
  , ("list",   TypeDecl "list"   ["a"] (Alg [dNil, dCons]))
  , ("option", TypeDecl "option" ["a"] (Alg [dNone, dSome]))
  , ("exn",    TypeDecl "exn"    []    (Alg []))
  ]

baseDataEnv = Map.fromList $ concatMap (\TypeDecl {..} -> case tyRhs of
                                         Alias _ -> []
                                         Alg ds -> [(dCon d, d) | d <- ds])
                           $ Map.elems baseTypeEnv

dNil = DataDecl "[]" []
dCons = DataDecl "::" [ TVar "a", TApp "list" [TVar "a"] ]
dNone = DataDecl "None" []
dSome = DataDecl "Some" [ TVar "a" ]

primBops :: [(Var, Bop)]
primBops = [("+",Plus), ("-",Minus), ("*",Times), ("/",Div), ("mod",Mod)
           ,("+.",FPlus), ("-.",FMinus), ("*.",FTimes), ("/.",FDiv)
           ,("=",Eq), ("==",Eq), ("<>",Neq), ("!=",Neq)
           ,(">",Gt), (">=", Ge), ("<",Lt), ("<=",Le)
           ]

primVars :: [(Var, Value)]
primVars = [ ("[]", VL [])
           , ("::", VF (Func (mkLams [VarPat "x", VarPat "xs"]
                                     (mkConApp "::" [Var "x", Var "xs"]))
                             emptyEnv))
           , ("()", VU)
           , ("List.fold_left"
             ,mkRec "List.fold_left"
                    (mkLams [VarPat "f", VarPat "b", VarPat "xs"]
                            (Case (Var "xs")
                             [(ConPat "[]" []
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
                    (mkLams [VarPat "f", VarPat "xs", VarPat "b"]
                            (Case (Var "xs")
                             [(ConPat "[]" []
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
                             [(ConPat "[]" []
                              ,Nothing
                              ,Var "[]")
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,mkConApp "::"
                                [ mkApps (Var "f") [Var "y"]
                                , mkApps (Var "List.map")
                                         [Var "f"
                                         ,Var "ys"
                                         ]
                                ]
                              )
                             ]))
             )
           , ("List.iter"
             ,mkRec "List.iter"
                    (mkLams [VarPat "f", VarPat "xs"]
                            (Case (Var "xs")
                             [(ConPat "[]" []
                              ,Nothing
                              ,Var "[]")
                             ,(ConsPat (VarPat "y") (VarPat "ys")
                              ,Nothing
                              ,Seq (mkApps (Var "f") [Var "y"])
                                   (mkApps (Var "List.iter")
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
           , ("print_string", mkPrim1Fun $ P1 pprint_string)
           , ("int_of_char", mkPrim1Fun $ P1 pint_of_char)
           , ("int_of_float", mkPrim1Fun $ P1 pint_of_float)
           , ("float_of_int", mkPrim1Fun $ P1 pfloat_of_int)
           , ("string_of_int", mkPrim1Fun $ P1 pstring_of_int)
           , ("abs", mkPrim1Fun $ P1 pabs)
           , ("log10", mkPrim1Fun $ P1 plog10)
           , ("compare", mkPrim2Fun $ P2 pcompare)
           , ("raise", mkPrim1Fun $ P1 praise)
           , ("Printexc.to_string", mkPrim1Fun $ P1 pprintexc_to_string)
           ]

pfailwith :: MonadEval m => Value -> m Value
pfailwith (VS s) = throwError $ MLException $ VS s

pcompare :: MonadEval m => Value -> Value -> m Value
pcompare = cmpVal

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

pprint_string :: MonadEval m => Value -> m Value
pprint_string (VS s) = do
  opts <- ask
  when (enablePrint opts) $
    liftIO $ putStr s
  return VU

plist_combine :: MonadEval m => Value -> Value -> m Value
plist_combine (VL xs) (VL ys)
  | length xs == length ys
  = return (VL (zipWith (\x y -> VT 2 [x,y]) xs ys))

plist_split :: MonadEval m => Value -> m Value
plist_split (VL xs) = return (VT (length xs) [VL as, VL bs])
  where
  -- FIXME: these list functions really shouldn't be primitives,
  -- introduces nasty laziness issues..
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

praise :: MonadEval m => Value -> m Value
praise x@(VA {}) = throwError (MLException x)

pprintexc_to_string :: MonadEval m => Value -> m Value
pprintexc_to_string x@(VA {}) = return $ VS $ show x

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

data Value
  = VI Int
  | VD Double
  | VC Char
  | VS String
  | VB Bool
  | VU
  | VL [Value]
  | VT Int [Value] -- VT sz:{Nat | sz >= 2} (ListN Value sz)
  | VA DCon [Value]
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
  | DTyp [TypeDecl]
  | DExn DataDecl
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
  | Tuple [Expr]
  | ConApp DCon [Expr]
  | Try Expr [Alt]
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
  | ConPat Var [Pat]
  | ListPat [Pat]
  | TuplePat [Pat]
  | WildPat
  | OrPat Pat Pat
  | AsPat Pat Var
  deriving (Show)

data Type
  = TVar TVar
  | TCon TCon
  | TApp TCon [Type]
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

mkConApp :: DCon -> [Expr] -> Expr
mkConApp = ConApp

mkLams :: [Pat] -> Expr -> Expr
mkLams ps e = case ps of
  []   -> e
  p:ps -> Lam p (mkLams ps e)

mkList :: [Expr] -> Expr
mkList = foldr (\h t -> mkConApp "::" [h,t]) (mkConApp "[]" [])

mkFunction :: [Alt] -> Expr
mkFunction alts = Lam (VarPat "$x") (Case (Var "$x") alts)

mkTApps :: TCon -> [Type] -> Type
mkTApps = TApp

mkUMinus :: Var -> Expr -> Expr
mkUMinus "-"  (Lit (LI i)) = Lit (LI (- i))
mkUMinus "-." (Lit (LD d)) = Lit (LD (- d))
mkUMinus "-"  e            = mkApps (Var "-")  [Lit (LI 0), e]
mkUMinus "-." e            = mkApps (Var "-.") [Lit (LD 0), e]

eqVal (VI x) (VI y) = return (x == y)
eqVal (VD x) (VD y) = return (x == y)
eqVal (VB x) (VB y) = return (x == y)
eqVal (VC x) (VC y) = return (x == y)
eqVal (VS x) (VS y) = return (x == y)
eqVal VU     VU     = return True
eqVal (VL x) (VL y) = and . ((length x == length y) :) <$> zipWithM eqVal x y
eqVal (VT i x) (VT j y)
  | i == j
  = and <$> zipWithM eqVal x y
eqVal (VF x) (VF y) = typeError "cannot compare functions"
eqVal (VA c1 vs1) (VA c2 vs2)
  = ((c1 == c2) &&) <$> eqVal (VL vs1) (VL vs2)
eqVal x y
  -- = return False
  = typeError (printf "cannot compare incompatible types: (%s) (%s)" (show x) (show y) :: String)

cmpVal (VI x) (VI y) = return (cmp x y)
cmpVal (VD x) (VD y) = return (cmp x y)
cmpVal (VB x) (VB y) = return (cmp x y)
cmpVal (VC x) (VC y) = return (cmp x y)
cmpVal (VS x) (VS y) = return (cmp x y)
cmpVal VU     VU     = return (VI 0)
cmpVal (VL x) (VL y) = cmpAnd . ((length x `cmp` length y) :) <$> zipWithM cmpVal x y
cmpVal (VT i x) (VT j y)
  | i == j
  = cmpAnd <$> zipWithM cmpVal x y
cmpVal (VF x) (VF y) = typeError "cannot compare functions"
cmpVal (VA c1 vs1) (VA c2 vs2)
  = cmpAnd <$> zipWithM cmpVal vs1 vs2 -- FIXME: compare datacons too..
cmpVal x y
  -- = return False
  = typeError (printf "cannot compare incompatible types: (%s) (%s)" (show x) (show y) :: String)

cmp x y = VI $ fromEnum (compare x y) - 1

cmpAnd []        = VI 0
cmpAnd (VI 0:xs) = cmpAnd xs
cmpAnd (x:xs)    = x

allM :: Monad m => (a -> m Bool) -> [a] -> m Bool
allM f []     = return True
allM f (x:xs) = (&&) <$> f x <*> allM f xs
