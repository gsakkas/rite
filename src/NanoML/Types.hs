{-# LANGUAGE ConstraintKinds       #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE LambdaCase            #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE RankNTypes            #-}
{-# LANGUAGE RecordWildCards       #-}
module NanoML.Types where

import           Control.Arrow
import           Control.Exception
import           Control.Monad
import           Control.Monad.Except
import           Control.Monad.Fix
import           Control.Monad.Random
import           Control.Monad.Reader
import           Control.Monad.State
import           Control.Monad.Writer         hiding (Alt)
import qualified Data.Aeson                   as Aeson
import           Data.Char
import           Data.IntMap.Strict           (IntMap)
import qualified Data.IntMap.Strict           as IntMap
import           Data.List
import           Data.Map.Strict              (Map)
import qualified Data.Map.Strict              as Map
import           Data.Maybe
import           Data.Sequence                (Seq)
import qualified Data.Sequence                as Seq
import           Data.Typeable (Typeable)
import           Data.Vector                  (Vector)
import qualified Data.Vector                  as Vector
import           GHC.Generics
import           System.IO.Unsafe
import           Text.PrettyPrint.ANSI.Leijen (Doc)
import           Text.Printf

-- import Test.QuickCheck.GenT

import           Debug.Trace

----------------------------------------------------------------------
-- Core Types
----------------------------------------------------------------------

type MonadEval m = ( MonadError NanoError m
                   , MonadReader NanoOpts m
                   , MonadWriter [Doc] m
                   , MonadState EvalState m
                   , MonadFix m, MonadRandom m
                   )

type Var = String

data NanoOpts = NanoOpts
  { enablePrint           :: Bool -- ^ Should we actually print things to stdout?
  , checkDataCons         :: Bool -- ^ Should we check that datacon args have the proper type?
  , heterogeneousEquality :: Bool -- ^ Should we allow equality comparison between different types?
  , seed                  :: !Int -- ^ Random seed
  , size                  :: !Int -- ^ Maximum size of generated values
  , exceptionRecovery     :: Bool -- ^ Should we "recover" from exceptions by generating a random value?
  } deriving Show

stdOpts, loudOpts :: NanoOpts
stdOpts = NanoOpts { enablePrint = False, checkDataCons = True, heterogeneousEquality = False
                   , seed = 1234567, size = 10, exceptionRecovery = True
                   }
loudOpts = stdOpts { enablePrint = True }

data Result
  = Success { numTests :: !Int }
  | Failure { numTests :: !Int
            , usedSeed :: !Int
            , usedSize :: !Int
            , counterExample :: !Doc
            }
  deriving Show

isSuccess Success {} = True
isSuccess Failure {} = False

data NanoError
  = MLException Value
  | UnboundVariable Var
  | TypeError String -- TODO:
  | ParseError String
  | OutputTypeMismatch Value Type
  deriving (Show, Typeable)

instance Exception NanoError

varToInt (TVar _)     = tCon tINT
--varToInt (TCon c)     = TCon c
varToInt (TTup ts)    = TTup (map varToInt ts)
varToInt (TApp c ts)  = TApp c (map varToInt ts)
varToInt (ti :-> to)  = varToInt ti :-> varToInt to


typeError :: MonadEval m => String -> m a
typeError = throwError . TypeError

outputTypeMismatchError :: MonadEval m => Value -> Type -> m a
outputTypeMismatchError v t = throwError (OutputTypeMismatch v (varToInt t))

data EvalState = EvalState
  { stVarEnv   :: !Env
  , stTypeEnv  :: !(Map TCon TypeDecl)
  , stDataEnv  :: !(Map DCon DataDecl)
  , stFieldEnv :: !(Map String TypeDecl)
  , stFresh    :: !Ref
  , stStore    :: !(IntMap (MutFlag, Value))
  , stArgs     :: ![Expr]
  , stTrace    :: !(Seq Event)
  } deriving Show

rememberArgs :: MonadEval m => [Expr] -> m ()
rememberArgs args = modify' $ \s -> s { stArgs = args }

-- | An index into the store.
type Ref = Int

fresh :: MonadEval m => m Ref
fresh = do
  i <- gets stFresh
  modify' $ \ s -> s { stFresh = 1 + stFresh s }
  return i

setVarEnv :: MonadEval m => Env -> m ()
setVarEnv env = modify' $ \ s -> s { stVarEnv = env }

addType :: MonadEval m => TypeDecl -> m ()
addType td@TypeDecl {..} = modify' $ \ s ->
  s { stTypeEnv = Map.insert tyCon td (stTypeEnv s)
    , stDataEnv = Map.union (Map.fromList dds') (stDataEnv s)
    , stFieldEnv = Map.union (Map.fromList flds) (stFieldEnv s)
    }
  where
  td' = td { tyRhs = tyRhs' }
  tyRhs' = case tyRhs of
    Alg _ -> Alg $ map snd dds'
    _     -> tyRhs
  dds' = case tyRhs of
    Alg dds -> [(dCon, dd { dType = td' }) | dd@DataDecl {..} <- dds]
    _       -> mempty
  flds = case tyRhs of
    TRec flds -> [(f, td) | (f, _, _) <- flds]
    _         -> mempty

extendType :: MonadEval m => TCon -> DataDecl -> m ()
extendType tcon ddecl = do
  td@TypeDecl {..} <- lookupType tcon
  case tyRhs of
    Alias _ -> error $ "cannot extend type alias: " ++ tcon
    Alg dds -> addType (td { tyRhs = Alg (ddecl : dds) })

lookupType :: MonadEval m => TCon -> m TypeDecl
lookupType tcon = do
  tys <- gets stTypeEnv
  case Map.lookup tcon tys of
    Nothing -> typeError ("unknown type: " ++ tcon)
    Just t -> return t

lookupDataCon :: MonadEval m => DCon -> m DataDecl
lookupDataCon dc = do
  dcons <- gets stDataEnv
  case Map.lookup dc dcons of
    Nothing -> typeError ("unknown data constructor: " ++ dc)
    Just d  -> return d

lookupField :: MonadEval m => String -> m TypeDecl
lookupField fld = do
  flds <- gets stFieldEnv
  case Map.lookup fld flds of
    Nothing -> typeError ("unknown record field: " ++ fld)
    Just d  -> return d

lookupStore :: MonadEval m => Ref -> m (Maybe (MutFlag, Value))
lookupStore i = IntMap.lookup i <$> gets stStore

readStore :: MonadEval m => Ref -> m (MutFlag, Value)
readStore i = (IntMap.! i) <$> gets stStore

writeStore :: MonadEval m => Ref -> (MutFlag,Value) -> m ()
writeStore i mv = modify' $ \s -> s { stStore = IntMap.insert i mv (stStore s) }

subst :: [(TVar, Type)] -> Type -> Type
subst su t = case t of
  TVar x -> fromMaybe t (lookup x su)
--  TCon _ -> t
  TApp c ts -> TApp c (map (subst su) ts)
  ti :-> to -> subst su ti :-> subst su to
  TTup ts -> TTup (map (subst su) ts)

newtype Env = Env (Map Var Value) deriving Show

instance Monoid Env where
  mempty  = emptyEnv
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
  penv <- gets stVarEnv
  setVarEnv env
  a <- m
  setVarEnv penv
  return a

withExtendedEnv :: MonadEval m => m a -> Env -> m a
m `withExtendedEnv` env = do
  genv <- gets stVarEnv
  m `withEnv` (joinEnv genv env)

data Value
  = VI !Int
  | VD !Double
  | VC !Char
  | VS !String
  | VB !Bool
  | VU
  | VL [Value] Type
  | VT !Int [Value] [Type] -- VT sz:{Nat | sz >= 2} (ListN Value sz)
  | VA DCon (Maybe Value) Type
  | VR [(String, Ref)] Type
  | VV (Vector Value) Type
  | VF Func
  | VH !Ref (Maybe Type) -- ^ A "hole" that will be filled in later, on demand.
  deriving (Show, Generic)

data Func
  = Func Expr Env
  deriving (Generic)

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
  deriving (Show, Generic)

data RecFlag = Rec | NonRec deriving (Show, Generic)
data MutFlag = Mut | NonMut deriving (Show, Generic)

data SrcSpan = SrcSpan
  { srcSpanStartLine :: !Int
  , srcSpanStartCol  :: !Int
  , srcSpanEndLine   :: !Int
  , srcSpanEndCol    :: !Int
  } deriving (Show, Generic)

srcSpanWidth SrcSpan {..}
  | srcSpanStartLine == srcSpanEndLine
  = srcSpanEndCol - srcSpanStartCol
  | otherwise -- TODO:
  = 1

joinSrcSpan x y = SrcSpan (srcSpanStartLine x) (srcSpanStartCol x)
                          (srcSpanEndLine y)   (srcSpanEndCol y)

type Prog = [Decl]

data Decl
  = DFun SrcSpan RecFlag [(Pat,Expr)]
  | DEvl SrcSpan Expr
  | DTyp SrcSpan [TypeDecl]
  | DExn SrcSpan DataDecl
  deriving (Show, Generic)

getSrcSpan :: Decl -> SrcSpan
getSrcSpan d = case d of
  DFun ss _ _ -> ss
  DEvl ss _ -> ss
  DTyp ss _ -> ss
  DExn ss _ -> ss

type MSrcSpan = Maybe SrcSpan

data Expr
  = Var !MSrcSpan Var
  | Lam !MSrcSpan Pat Expr
  | App !MSrcSpan Expr [Expr]
  | Bop !MSrcSpan Bop Expr Expr
  | Uop !MSrcSpan Uop Expr
  | Lit !MSrcSpan Literal
  | Let !MSrcSpan RecFlag [(Pat,Expr)] Expr
  | Ite !MSrcSpan Expr Expr Expr
  | Seq !MSrcSpan Expr Expr
  | Case !MSrcSpan Expr [Alt]
  | Tuple !MSrcSpan [Expr]
  | ConApp !MSrcSpan DCon (Maybe Expr)
  | Record !MSrcSpan [(String, Expr)]
  | Field !MSrcSpan Expr String
  | SetField !MSrcSpan Expr String Expr
  | Array !MSrcSpan [Expr]
  | Try !MSrcSpan Expr [Alt]
  | Prim1 !MSrcSpan Prim1 Expr
  | Prim2 !MSrcSpan Prim2 Expr Expr
  | Val !MSrcSpan Value -- embed a value inside an Expr for ease of tracing
  | With Env Expr
  | Replace Env Expr
  deriving (Show, Generic)

getSrcSpanExprMaybe :: Expr -> MSrcSpan
getSrcSpanExprMaybe expr = case expr of
  Var ms _ -> ms
  Lam ms _ _ -> ms
  App ms _ _ -> ms
  Bop ms _ _ _ -> ms
  Uop ms _ _ -> ms
  Lit ms _ -> ms
  Let ms _ _ _ -> ms
  Ite ms _ _ _ -> ms
  Seq ms _ _ -> ms
  Case ms _ _ -> ms
  Tuple ms _ -> ms
  ConApp ms _ _ -> ms
  Record ms _ -> ms
  Field ms _ _ -> ms
  SetField ms _ _ _ -> ms
  Array ms _ -> ms
  Try ms _ _ -> ms
  Prim1 ms _ _ -> ms
  Prim2 ms _ _ _ -> ms
  Val ms _ -> ms
  With _ e -> getSrcSpanExprMaybe e
  Replace _ e -> getSrcSpanExprMaybe e

data Prim1 = P1 Var (forall m. MonadEval m => Value -> m Value) Type
instance Show Prim1 where
  show (P1 v _ _) = v
data Prim2 = P2 Var (forall m. MonadEval m => Value -> Value -> m Value) Type Type
instance Show Prim2 where
  show (P2 v _ _ _) = v

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
  = VarPat !MSrcSpan Var
  | LitPat !MSrcSpan Literal
  | IntervalPat !MSrcSpan Literal Literal
  | ConsPat !MSrcSpan Pat Pat
  | ConPat !MSrcSpan Var (Maybe Pat)
  | ListPat !MSrcSpan [Pat]
  | TuplePat !MSrcSpan [Pat]
  | WildPat !MSrcSpan
  | OrPat !MSrcSpan Pat Pat
  | AsPat !MSrcSpan Pat Var
  | ConstraintPat !MSrcSpan Pat Type
  deriving (Show)

getSrcSpanPatMaybe :: Pat -> MSrcSpan
getSrcSpanPatMaybe pat = case pat of
  VarPat ms _ -> ms
  LitPat ms _ -> ms
  IntervalPat ms _ _ -> ms
  ConsPat ms _ _ -> ms
  ConPat ms _ _ -> ms
  ListPat ms _ -> ms
  TuplePat ms _ -> ms
  WildPat ms -> ms
  OrPat ms _ _ -> ms
  AsPat ms _ _ -> ms
  ConstraintPat ms _ _ -> ms

data Type
  = TVar TVar
  -- TCon TCon
  | TApp TCon [Type]
  | Type :-> Type
  | TTup [Type]
  deriving (Show) -- NOTE: explicitly not an instance of Eq since we want to unify

infixr :->

tINT = "int"
tFLOAT = "float"
tCHAR = "char"
tSTRING = "string"
tBOOL = "bool"
tLIST = "list"
tARRAY = "array"
tUNIT = "unit"
tEXN = "exn"
tREF = "ref"

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
  | TRec  [Field]
  deriving (Show)

type Field = (String, MutFlag, Type)

data DataDecl
  = DataDecl { dCon :: DCon, dArgs :: [Type], dType :: TypeDecl }
  deriving (Show)

typeDeclType :: TypeDecl -> Type
typeDeclType TypeDecl {..}
  | null tyVars
  = tCon tyCon
  | otherwise
  = mkTApps tyCon $ map TVar tyVars

typeDataCons :: TypeDecl -> [DataDecl]
typeDataCons TypeDecl { tyRhs = Alg ds } = ds

type TVar = String

type TCon = String

type DCon = String


unify :: MonadEval m => Type -> Type -> m [(TVar, Type)]
unify (TVar a) t = unifyVar a t
unify t (TVar a) = unifyVar a t
-- unify (TCon x) (TCon y)
--    x == y
--   = return []
-- unify (TCon x) t = unifyAlias x [] t
-- unify t (TCon x) = unifyAlias x [] t
unify (xi :-> xo) (yi :-> yo)
  = mappend <$> unify xi yi <*> unify xo yo
unify (TTup xs) (TTup ys)
  = mconcat <$> zipWithM unify xs ys
unify x@(TApp xc xts) y@(TApp yc yts)
  | xc == yc
  = mconcat <$> zipWithM unify xts yts
  | otherwise
  = do xt <- lookupType xc
       yt <- lookupType yc
       case (tyRhs xt, tyRhs yt) of
         (Alias tx, Alias ty) -> unify (subst (zip (tyVars xt) xts) tx)
                                       (subst (zip (tyVars yt) yts) ty)
         (Alias t, _) -> unify (subst (zip (tyVars xt) xts) t) y
         (_, Alias t) -> unify x (subst (zip (tyVars yt) yts) t)
         _ -> typeError $ printf "could not match %s against %s" (show x) (show y)
unify x@(TApp c ts) y = unifyAlias c ts y x
unify x y@(TApp c ts) = unifyAlias c ts x y
unify x y
  = typeError $ printf "could not match %s against %s" (show x) (show y)

unifyVar :: Monad m => TVar -> Type -> m [(TVar, Type)]
unifyVar a t
  | TVar b <- t, a == b = return []
  -- FIXME: occurs check
  | otherwise   = return [(a,t)]

unifyAlias :: MonadEval m => TCon -> [Type] -> Type -> Type -> m [(TVar, Type)]
unifyAlias c ts x y = do
  TypeDecl {..} <- lookupType c
  case tyRhs of
    Alias t -> unify x (subst (zip tyVars ts) t)
    _ -> typeError $ printf "could not match %s against %s" (show x) (show y)

typeOf :: Value -> Type
typeOf v = case v of
  VI _ -> tCon tINT
  VD _ -> tCon tFLOAT
  VC _ -> tCon tCHAR
  VS _ -> tCon tSTRING
  VB _ -> tCon tBOOL
  VU   -> tCon tUNIT
  VL _ t -> mkTApps tLIST [t]
  VT _ _ ts -> TTup ts
  VA _ _ t -> t
  VR _ t -> t
  VV _ t -> mkTApps tARRAY [t]
  VF _ -> TVar "a" :-> TVar "b" -- TODO
  VH _ Nothing -> TVar "a"
  VH _ (Just t) -> t
  -- VF _ -> error "typeOf: <<function>>"

typeOfLit :: Literal -> Type
typeOfLit l = case l of
  LI _ -> tCon tINT
  LD _ -> tCon tFLOAT
  LC _ -> tCon tCHAR
  LS _ -> tCon tSTRING
  LB _ -> tCon tBOOL
  -- LU   -> tCon tUNIT
  

----------------------------------------------------------------------
-- Utilities
----------------------------------------------------------------------

{-@ mkCurried :: ListNE Pat -> Expr -> Expr @-}
mkCurried :: [Pat] -> Expr -> Expr
mkCurried [p]    e = Lam (mergeLocated p e) p e
mkCurried (p:ps) e = Lam (mergeLocated p e) p (mkCurried ps e)
mkCurried p e = error $ "mkCurried: " ++ show p ++ " " ++ show e

mkInfix :: MSrcSpan -> Expr -> Expr -> Expr -> Expr
mkInfix ms x op y = mkApps ms op [x,y]

mkApps :: MSrcSpan -> Expr -> [Expr] -> Expr
mkApps = App

mkConApp :: MSrcSpan -> DCon -> [Expr] -> Expr
mkConApp ms c []  = ConApp ms c Nothing
mkConApp ms c [e] = ConApp ms c (Just e)
mkConApp ms c es  = ConApp ms c (Just (Tuple ms' es))
  where ms' = mergeLocated (head es) (last es)

mkLams :: [Pat] -> Expr -> Expr
mkLams ps e = case ps of
  []   -> e
  p:ps -> Lam (mergeLocated p e) p (mkLams ps e)

mkList :: [Expr] -> Expr
mkList = foldr (\h t -> mkConApp Nothing "::" [h,t]) (mkConApp Nothing "[]" [])

mkFunction :: MSrcSpan -> [Alt] -> Expr
mkFunction ms alts = Lam ms (VarPat ms "$x")
                         (Case ms (Var ms "$x") alts)

mkTApps :: TCon -> [Type] -> Type
mkTApps = TApp

mkUMinus :: MSrcSpan -> Var -> Expr -> Expr
mkUMinus ms "-"  (Lit _ (LI i)) = Lit ms (LI (- i))
mkUMinus ms "-." (Lit _ (LD d)) = Lit ms (LD (- d))
mkUMinus ms "-"  e              = Uop ms Neg e
mkUMinus ms "-." e              = Uop ms FNeg e

mkExn :: DCon -> [Value] -> Value
mkExn dcon []   = VA dcon Nothing (tCon tEXN)
mkExn dcon [a]  = VA dcon (Just a) (tCon tEXN)
mkExn dcon args = VA dcon (Just (VT (length args) args (map typeOf args)))
                     (tCon tEXN)

tCon :: TCon -> Type
tCon c = mkTApps c []

-- eqVal (VI x) (VI y) = return (x == y)
-- eqVal (VD x) (VD y) = return (x == y)
-- eqVal (VB x) (VB y) = return (x == y)
-- eqVal (VC x) (VC y) = return (x == y)
-- eqVal (VS x) (VS y) = return (x == y)
-- eqVal VU     VU     = return True
-- eqVal (VL x _) (VL y _) = and . ((length x == length y) :) <$> zipWithM eqVal x y
-- eqVal (VT i x _) (VT j y _)
--   | i == j
--   = and <$> zipWithM eqVal x y
-- eqVal (VF x) (VF y) = typeError "cannot compare functions"
-- eqVal (VA c1 Nothing t1) (VA c2 Nothing t2)
--   | c1 == c2 = return True
--   | t1 == t2 = return False
-- eqVal (VA c1 (Just v1) t1) (VA c2 (Just v2) t2)
--   | c1 == c2 = eqVal v1 v2
--   | t1 == t2 = return False
-- eqVal x y
--   -- = return False
--   = typeError (printf "cannot compare incompatible types: (%s) (%s)" (show x) (show y) :: String)

eqVal x y = (\(VI x) -> x == 0) <$> cmpVal x y

cmpVal (VI x) (VI y) = return (cmp x y)
cmpVal (VD x) (VD y) = return (cmp x y)
cmpVal (VB x) (VB y) = return (cmp x y)
cmpVal (VC x) (VC y) = return (cmp x y)
cmpVal (VS x) (VS y) = return (cmp x y)
cmpVal VU     VU     = return (VI 0)
cmpVal (VL x _) (VL y _) = cmpAnd . ((length x `cmp` length y) :) <$> zipWithM cmpVal x y
cmpVal (VT i x _) (VT j y _)
  | i == j
  = cmpAnd <$> zipWithM cmpVal x y
cmpVal (VF x) (VF y) = typeError "cannot compare functions"
cmpVal x@(VA c1 v1 _) y@(VA c2 v2 _) = do
  dd1 <- lookupDataCon c2
  dd2 <- lookupDataCon c2
  unless (tyCon (dType dd1) == tyCon (dType dd2)) $
    typeError (printf "cannot compare incompatible types: (%s) (%s)" (show x) (show y) :: String)
  let dcs = map dCon . typeDataCons . dType $ dd1
  case compare (fromJust (elemIndex c1 dcs)) (fromJust (elemIndex c2 dcs)) of
    LT -> return (VI (-1))
    GT -> return (VI 1)
    EQ -> case (v1, v2) of
      (Nothing, Nothing) -> return (VI 0)
      (Just v1, Just v2) -> cmpVal v1 v2
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

data Loc a = L (Maybe SrcSpan) a

getVal (L _ x) = x

instance Located (Loc a) where
  getSrcSpanMaybe (L s _) = s

class Located a where
  getSrcSpanMaybe :: a -> Maybe SrcSpan

instance Located Expr where
  getSrcSpanMaybe = getSrcSpanExprMaybe

instance Located Pat where
  getSrcSpanMaybe = getSrcSpanPatMaybe

mergeLocated x y = joinSrcSpan <$> getSrcSpanMaybe x <*> getSrcSpanMaybe y


----------------------------------------------------------------------
-- traces
----------------------------------------------------------------------

-- {
--   "code": "x = 5\ny = 10\nz = x + y\n\n", 
--   "trace": [
--     {
--       "ordered_globals": [], 
--       "stdout": "", 
--       "func_name": "<module>", 
--       "stack_to_render": [], 
--       "globals": {}, 
--       "heap": {}, 
--       "line": 1, 
--       "event": "step_line"
--     }, 
--     {
--       "ordered_globals": [
--         "x"
--       ], 
--       "stdout": "", 
--       "func_name": "<module>", 
--       "stack_to_render": [], 
--       "globals": {
--         "x": 5
--       }, 
--       "heap": {}, 
--       "line": 2, 
--       "event": "step_line"
--     }, ...
--   ]
-- }

data Event = Event
  { evt_ordered_globals :: ![Var]
  , evt_stdout :: !String
  , evt_func_name :: !Var
  , evt_stack_to_render :: ![Scope]
  , evt_globals :: !(Map Var Value)
  , evt_heap :: !(IntMap Value)
  , evt_line :: !Int
  , evt_column :: !Int
  , evt_expr_width :: !Int
  , evt_event :: !String
  , evt_expr :: !Expr
  } deriving Show

data Scope = Scope
  deriving Show

