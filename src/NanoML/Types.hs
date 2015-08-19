{-# LANGUAGE ConstraintKinds       #-}
{-# LANGUAGE DefaultSignatures     #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE LambdaCase            #-}
{-# LANGUAGE MultiWayIf            #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE RankNTypes            #-}
{-# LANGUAGE RecordWildCards       #-}
{-# LANGUAGE OverlappingInstances     #-}
{-# LANGUAGE TypeSynonymInstances  #-}
{-# LANGUAGE TypeOperators         #-}
module NanoML.Types where

import           Control.Applicative
import           Control.Exception
import           Control.Monad
import           Control.Monad.Except
import           Control.Monad.Random
import           Control.Monad.Reader
import           Control.Monad.State
import           Control.Monad.Writer         hiding (Alt)
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
  | TypeError Expr Type Type
  | ParseError String
  | MissingFields Type Expr
  | InvalidFields Type Expr
  | OutputTypeMismatch Value Type
  | OtherError String
  deriving (Show, Generic, Typeable)

instance Exception NanoError

varToInt (TVar _)     = tCon tINT
--varToInt (TCon c)     = TCon c
varToInt (TTup ts)    = TTup (map varToInt ts)
varToInt (TApp c ts)  = TApp c (map varToInt ts)
varToInt (ti :-> to)  = varToInt ti :-> varToInt to


typeError :: MonadEval m => Type -> Type -> m a
typeError t1 t2 = gets stCurrentExpr >>= \e -> throwError (TypeError e t1 t2)

outputTypeMismatchError :: MonadEval m => Value -> Type -> m a
outputTypeMismatchError v t = throwError (OutputTypeMismatch v (varToInt t))

otherError :: MonadEval m => String -> m a
otherError = throwError . OtherError

data EvalState = EvalState
  { stVarEnv   :: Env
  , stTypeEnv  :: !(Map TCon TypeDecl)
  , stDataEnv  :: !(Map DCon DataDecl)
  , stFieldEnv :: !(Map String TypeDecl)
  , stFresh    :: !Ref
  , stStore    :: !(IntMap (MutFlag, Value))
  , stArgs     :: ![Expr]
  , stTrace    :: !(Seq Event)
  , stEnvMap   :: !(IntMap Env)
  -- , stNodes    :: !(Map Expr Int)
  , stEdges    :: ![(Expr, EdgeKind, Expr)]
  , stCurrentExpr :: Expr
  } deriving Show

withCurrentExpr :: MonadEval m => Expr -> m a -> m a
withCurrentExpr e x = do
  e' <- gets stCurrentExpr
  modify' $ \s -> s { stCurrentExpr = e }
  a <- x
  modify' $ \s -> s { stCurrentExpr = e' }
  return a

addEdge :: MonadEval m => EdgeKind -> Expr -> Expr -> m ()
addEdge k e1 e2 = unless (x == y) $ modify' $ \s -> s { stEdges = (x, k, y) : stEdges s }
  where
  x = skipEnv e1
  y = skipEnv e2

addSubTerms :: MonadEval m => Expr -> m Expr
addSubTerms expr = do
  case expr of
    Var _ _ -> return ()
    Lam _ _ b -> addEdge (SubTerm 0) expr b
    App _ f xs -> zipWithM_ (\i e -> addEdge (SubTerm i) expr e) [0..] (f:xs)
    Bop _ _ x y -> addEdge (SubTerm 0) expr x >> addEdge (SubTerm 1) expr y
    Uop _ _ x -> addEdge (SubTerm 0) expr x
    Lit _ _ -> return ()
    Let _ _ binds body -> zipWithM_ (\i e -> addEdge (SubTerm i) expr e) [0..] (body : map snd binds)
    Ite _ b t f -> addEdge (SubTerm 0) expr b >> addEdge (SubTerm 1) expr t >> addEdge (SubTerm 2) expr f
    Seq _ x y -> addEdge (SubTerm 0) expr x >> addEdge (SubTerm 1) expr y

    Prim1 _ _ x -> addEdge (SubTerm 0) expr x
    Prim2 _ _ x y -> addEdge (SubTerm 0) expr x >> addEdge (SubTerm 1) expr y
    _ -> return ()

  return expr

skipEnv :: Expr -> Expr
skipEnv expr = case expr of
  With _ _ e -> skipEnv e
  Replace _ _ e -> skipEnv e
  _ -> expr

refreshDecl :: MonadEval m => Decl -> m Decl
refreshDecl decl = case decl of
  DFun ss r binds -> DFun ss r <$> mapM refreshBind binds
  DEvl ss x -> DEvl ss <$> refreshExpr x
  DTyp {} -> return decl
  DExn {} -> return decl

refreshExpr :: MonadEval m => Expr -> m Expr
refreshExpr expr = addSubTerms =<< case expr of
  Var ms v -> return $ Var ms v
  Lam ms p e -> Lam ms p <$> refreshExpr e
  App ms f xs -> App ms <$> refreshExpr f <*> mapM refreshExpr xs
  Bop ms b x y -> Bop ms b <$> refreshExpr x <*> refreshExpr y
  Uop ms u x -> Uop ms u <$> refreshExpr x
  Lit ms l -> return $ Lit ms l
  Let ms r binds body -> Let ms r <$> mapM refreshBind binds <*> refreshExpr body
  Ite ms b t f -> Ite ms <$> refreshExpr b <*> refreshExpr t <*> refreshExpr f
  Seq ms x y -> Seq ms <$> refreshExpr x <*> refreshExpr y
  Case ms e alts -> Case ms <$> refreshExpr e <*> mapM refreshAlt alts
  Tuple ms xs -> Tuple ms <$> mapM refreshExpr xs
  ConApp ms c Nothing -> return $ ConApp ms c Nothing
  ConApp ms c (Just x) -> ConApp ms c . Just <$> refreshExpr x
  Record ms fs -> Record ms <$> mapM refreshBind fs
  Field ms e f -> Field ms <$> refreshExpr e <*> pure f
  SetField ms e f x -> SetField ms <$> refreshExpr e <*> pure f <*> refreshExpr x
  Array ms xs -> Array ms <$> mapM refreshExpr xs
  Try ms e alts -> Try ms <$> refreshExpr e <*> mapM refreshAlt alts
  Prim1 ms p x -> Prim1 ms p <$> refreshExpr x
  Prim2 ms p x y -> Prim2 ms p <$> refreshExpr x <*> refreshExpr y
  Val ms v -> return expr --  Val ms v
  With ms e x -> With ms e <$> refreshExpr x
  Replace ms e x -> Replace ms e <$> refreshExpr x

refreshBind :: MonadEval m => (a, Expr) -> m (a, Expr)
refreshBind (a,e) = do
  e <- refreshExpr e
  return (a,e)

refreshAlt :: MonadEval m => Alt -> m Alt
refreshAlt (p,Nothing,e) = do
  e <- refreshExpr e
  return (p,Nothing,e)
refreshAlt (p,Just g,e) = do
  e <- refreshExpr e
  g <- refreshExpr g
  return (p,Just g,e)

rememberArgs :: MonadEval m => [Expr] -> m ()
rememberArgs args = modify' $ \s -> s { stArgs = args }

getStepIndex :: MonadEval m => m Int
getStepIndex = Seq.length <$> gets stTrace

getCurrentProv :: MonadEval m => m Prov
getCurrentProv = Prov <$> getStepIndex

withCurrentProv :: MonadEval m => (Prov -> a) -> m a
withCurrentProv f = f <$> getCurrentProv

withCurrentProvM :: MonadEval m => (Prov -> m a) -> m a
withCurrentProvM f = f =<< getCurrentProv

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
    Nothing -> otherError ("unknown type: " ++ tcon)
    Just t -> return t

lookupDataCon :: MonadEval m => DCon -> m DataDecl
lookupDataCon dc = do
  dcons <- gets stDataEnv
  case Map.lookup dc dcons of
    Nothing -> otherError ("unknown data constructor: " ++ dc)
    Just d  -> return d

lookupField :: MonadEval m => String -> m TypeDecl
lookupField fld = do
  flds <- gets stFieldEnv
  case Map.lookup fld flds of
    Nothing -> otherError ("unknown record field: " ++ fld)
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

-- TODO: this is not precise enough for the visualizer.
-- we need an environment graph so we can have, eg multiple
-- scopes from recursive calls that all share the global
-- scope as a parent
-- newtype Env = Env [[(Var,Value)]] deriving Show

data Env = Env
  { envId :: !Ref
  , envName :: !String
  , envParent :: !(Maybe Env)
  , envEnv :: ![(Var,Value)]
  } deriving (Generic)

instance Show Env where
  show e = "Env " ++ show (envId e)

instance Eq Env where
  e1 == e2 = envId e1 == envId e2

instance Monoid Env where
  mempty  = emptyEnv
  mappend = joinEnv

allocEnv fn bnd = do
  p <- gets stVarEnv
  allocEnvWith fn p bnd

allocEnvWith :: MonadEval m => Var -> Env -> [(Var,Value)] -> m Env
allocEnvWith fn p bnd = do
  i <- fresh
--  traceShowM (i, fn)
--  traceShowM (i, envId p)
  let e = Env { envId = i, envName = fn, envParent = Just p
              -- we reverse the binders here so we can add new binders to the front and
              -- maintain ordering by appearance in the source program
              , envEnv = reverse bnd }
  modify' $ \s -> s { stEnvMap = IntMap.insert i e (stEnvMap s) }
  return e

-- freeEnv :: MonadEval m => Ref -> m ()
-- freeEnv = undefined

insertEnv :: Var -> Value -> Env -> Env
insertEnv var val env = env { envEnv = (var,val) : envEnv env }
-- insertEnv var val (Env []) = Env [[(var, val)]]
-- insertEnv var val (Env (e:es)) = Env (((var, val) : e): es)

-- | Left-biased union of environments.
joinEnv :: Env -> Env -> Env
joinEnv e1 e2 = e1 { envEnv = envEnv e1 ++ envEnv e2 }

lookupEnv :: MonadEval m => Var -> Env -> m Value
lookupEnv v Env {..} = case lookup v envEnv of
  Nothing
    | Just p <- envParent -> lookupEnv v p
    | otherwise           -> throwError (UnboundVariable v)
  Just x                  -> return x
  -- where
  -- go [] = throwError (UnboundVariable v)
  -- go (e:es) = case lookup v e of
  --   Nothing -> go es
  --   Just x  -> return x

getEnv :: MonadEval m => Ref -> m Env
getEnv i = (IntMap.! i) <$> gets stEnvMap

lookupVar :: MonadEval m => Var -> m Value
lookupVar v = lookupEnv v =<< gets stVarEnv

toListEnv :: Env -> [Env]
toListEnv env = env : maybe [] toListEnv (envParent env)

-- toListEnv :: Env -> [(Var,Value)]
-- toListEnv (Env e) = concat e

emptyEnv :: Env
emptyEnv = Env 0 "" Nothing []

withEnv :: MonadEval m => m a -> Env -> m a
m `withEnv` env = do
  penv <- gets stVarEnv
  setVarEnv env
  a <- m
  setVarEnv penv
  return a

-- withExtendedEnv :: MonadEval m => m a -> Env -> m a
-- m `withExtendedEnv` env = do
--   genv <- gets stVarEnv
--   m `withEnv` (joinEnv env genv)

-- | The provenance of a 'Value' is the index of the step that created it
data Prov = Prov Int
  deriving (Show, Eq, Generic)

nullProv :: Prov
nullProv = Prov 0

data Value
  = VI !Prov !Int
  | VD !Prov !Double
  | VC !Prov !Char
  | VS !Prov !String
  | VB !Prov !Bool
  | VU !Prov
  | VL !Prov [Value] Type
  | VT !Prov !Int [Value] [Type] -- VT sz:{Nat | sz >= 2} (ListN Value sz)
  | VA !Prov DCon (Maybe Value) Type
  | VR !Prov [(String, Ref)] Type
  | VV !Prov (Vector Value) Type
  | VF !Prov Func
  | VH !Ref (Maybe Type) -- ^ A "hole" that will be filled in later, on demand.
  deriving (Show, Generic, Eq)

data Func
  = Func Expr Env
  deriving (Generic, Eq)

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
  deriving (Show, Generic, Eq)

data RecFlag = Rec | NonRec deriving (Show, Generic, Eq)
data MutFlag = Mut | NonMut deriving (Show, Generic, Eq)

data SrcSpan = SrcSpan
  { srcSpanStartLine :: !Int
  , srcSpanStartCol  :: !Int
  , srcSpanEndLine   :: !Int
  , srcSpanEndCol    :: !Int
  } deriving (Show, Generic, Eq)

-- instance Show MSrcSpan where
--   show _ = ""

srcSpanWidth SrcSpan {..}
  | srcSpanStartLine == srcSpanEndLine
  = srcSpanEndCol - srcSpanStartCol
  | otherwise -- TODO:
  = 100

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
  | With !MSrcSpan Env Expr
  | Replace !MSrcSpan Env Expr
  deriving (Show, Generic, Eq)

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
  With ms _ _ -> ms
  Replace ms _ _ -> ms

onSrcSpanExpr :: (MSrcSpan -> MSrcSpan) -> Expr -> Expr
onSrcSpanExpr f expr = case expr of
  Var ms x -> Var (f ms) x
  Lam ms x y -> Lam (f ms) x y
  App ms x y -> App (f ms) x y
  Bop ms x y z -> Bop (f ms) x y z
  Uop ms x y -> Uop (f ms) x y
  Lit ms x -> Lit (f ms) x
  Let ms x y z -> Let (f ms) x y z
  Ite ms x y z -> Ite (f ms) x y z
  Seq ms x y -> Seq (f ms) x y
  Case ms x y -> Case (f ms) x y
  Tuple ms x -> Tuple (f ms) x
  ConApp ms x y -> ConApp (f ms) x y
  Record ms x -> Record (f ms) x
  Field ms x y -> Field (f ms) x y
  SetField ms x y z -> SetField (f ms) x y z
  Array ms x -> Array (f ms) x
  Try ms x y -> Try (f ms) x y
  Prim1 ms x y -> Prim1 (f ms) x y
  Prim2 ms x y z -> Prim2 (f ms) x y z
  Val ms x -> Val (f ms) x
  With ms x y -> With (f ms) x y
  Replace ms x y -> Replace (f ms) x y

data Prim1 = P1 Var (forall m. MonadEval m => Value -> m Value) Type
instance Show Prim1 where
  show (P1 v _ _) = v
instance Eq Prim1 where
  P1 v1 _ _ == P1 v2 _ _ = v1 == v2

data Prim2 = P2 Var (forall m. MonadEval m => Value -> Value -> m Value) Type Type
instance Show Prim2 where
  show (P2 v _ _ _) = v
instance Eq Prim2 where
  P2 v1 _ _ _ == P2 v2 _ _ _ = v1 == v2

data Uop
  = Neg | FNeg
  deriving (Show, Eq)

data Bop
  = Eq | Neq
  | Lt | Le
  | Gt | Ge
  | And | Or
  | Plus  | Minus  | Times  | Div  | Mod
  | FPlus | FMinus | FTimes | FDiv | FExp
  deriving (Show, Eq)

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
  deriving (Show, Generic, Eq)

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
  deriving (Show, Generic, Eq)

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
         _ -> typeError x y
unify x@(TApp c ts) y = unifyAlias c ts y x
unify x y@(TApp c ts) = unifyAlias c ts x y
unify x y
  = typeError x y

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
    _ -> typeError x y

typeOf :: Value -> Type
typeOf v = case v of
  VI _ _ -> tCon tINT
  VD _ _ -> tCon tFLOAT
  VC _ _ -> tCon tCHAR
  VS _ _ -> tCon tSTRING
  VB _ _ -> tCon tBOOL
  VU _   -> tCon tUNIT
  VL _ _ t -> mkTApps tLIST [t]
  VT _ _ _ ts -> TTup ts
  VA _ _ _ t -> t
  VR _ _ t -> t
  VV _ _ t -> mkTApps tARRAY [t]
  VF _ _ -> TVar "a" :-> TVar "b" -- TODO
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
mkInfix ms x op y
  | Var _ o <- op
  , Just bop <- lookup o primBops
  = Bop ms bop x y
  | otherwise
  = mkApps ms op [x,y]

primBops :: [(Var, Bop)]
primBops = [("+",Plus), ("-",Minus), ("*",Times), ("/",Div), ("mod",Mod)
           ,("+.",FPlus), ("-.",FMinus), ("*.",FTimes), ("/.",FDiv)
           ,("=",Eq), ("==",Eq), ("<>",Neq), ("!=",Neq)
           ,(">",Gt), (">=", Ge), ("<",Lt), ("<=",Le)
           ]

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

mkExn :: DCon -> [Value] -> Prov -> Value
mkExn dcon []   prv = VA prv dcon Nothing (tCon tEXN)
mkExn dcon [a]  prv = VA prv dcon (Just a) (tCon tEXN)
mkExn dcon args prv = VA prv dcon (Just (VT prv (length args) args (map typeOf args)))
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

eqVal x y = (\(VI _ x) -> x == 0) <$> cmpVal x y

cmpVal (VI _ x) (VI _ y) = cmp x y
cmpVal (VD _ x) (VD _ y) = cmp x y
cmpVal (VB _ x) (VB _ y) = cmp x y
cmpVal (VC _ x) (VC _ y) = cmp x y
cmpVal (VS _ x) (VS _ y) = cmp x y
cmpVal (VU _)   (VU _) = getCurrentProv >>= \prv -> return (VI prv 0)
cmpVal (VL _ x _) (VL _ y _) = do
  lcmp <- length x `cmp` length y
  xscmp <- zipWithM cmpVal x y
  return $ cmpAnd (lcmp : xscmp)
cmpVal (VT _ i x _) (VT _ j y _)
  | i == j
  = cmpAnd <$> zipWithM cmpVal x y
cmpVal (VF _ x) (VF _ y) = otherError "cannot compare functions"
cmpVal x@(VA _ c1 v1 _) y@(VA _ c2 v2 _) = do
  dd1 <- lookupDataCon c2
  dd2 <- lookupDataCon c2
  unless (tyCon (dType dd1) == tyCon (dType dd2)) $
    typeError (typeOf x) (typeOf y)
  let dcs = map dCon . typeDataCons . dType $ dd1
  prv <- getCurrentProv
  case compare (fromJust (elemIndex c1 dcs)) (fromJust (elemIndex c2 dcs)) of
    LT -> return (VI prv (-1))
    GT -> return (VI prv 1)
    EQ -> case (v1, v2) of
      (Nothing, Nothing) -> return (VI prv 0)
      (Just v1, Just v2) -> cmpVal v1 v2
cmpVal x y
  -- = return False
  = typeError (typeOf x) (typeOf y)

cmp x y = getCurrentProv >>= \prv -> return $ VI prv $ fromEnum (compare x y) - 1

cmpAnd []        = error "cmpAnd: empty list"
cmpAnd (VI _ 0:xs) = cmpAnd xs
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
  , evt_exception_msg :: !String
  , evt_before :: !Expr
  , evt_after :: !Expr
  } deriving Show


-- {
--   "frame_id": 2, 
--   "encoded_locals": {
--     "a": 1, 
--     "b": 2
--   }, 
--   "is_highlighted": false, 
--   "is_parent": false, 
--   "func_name": "bar", 
--   "is_zombie": false, 
--   "parent_frame_id_list": [], 
--   "unique_hash": "bar_f2", 
--   "ordered_varnames": [
--     "a", 
--     "b"
--   ]
-- }, 

data Scope = Scope
  { scp_frame_id :: !Int
  , scp_encoded_locals :: !(Map Var Value)
  , scp_is_highlighted :: !Bool
  , scp_is_parent :: !Bool
  , scp_func_name :: !String
  , scp_is_zombie :: !Bool
  , scp_parent_frame_id_list :: ![Int]
  , scp_unique_hash :: !String
  , scp_ordered_varnames :: ![Var]
  } deriving Show


class CollectEnvIds a where
  collectEnvIds :: a -> [Ref]
  default collectEnvIds :: (Generic a, GCollectEnvIds (Rep a)) => a -> [Ref]
  collectEnvIds x = gcollectEnvIds (from x)

instance CollectEnvIds Env where
  collectEnvIds Env {..} = envId : maybe [] collectEnvIds envParent

class GCollectEnvIds f where
  gcollectEnvIds :: f a -> [Ref]

instance GCollectEnvIds U1 where
  gcollectEnvIds _ = []

instance GCollectEnvIds a => GCollectEnvIds (M1 i c a) where
  gcollectEnvIds (M1 x) = gcollectEnvIds x

instance CollectEnvIds a => GCollectEnvIds (K1 i a) where
  gcollectEnvIds (K1 x) = collectEnvIds x

instance (GCollectEnvIds f, GCollectEnvIds g) => GCollectEnvIds (f :+: g) where
  gcollectEnvIds (L1 x) = gcollectEnvIds x
  gcollectEnvIds (R1 x) = gcollectEnvIds x

instance (GCollectEnvIds f, GCollectEnvIds g) => GCollectEnvIds (f :*: g) where
  gcollectEnvIds (f :*: g) = gcollectEnvIds f ++ gcollectEnvIds g

instance CollectEnvIds Decl
instance CollectEnvIds Expr
instance CollectEnvIds Pat
instance CollectEnvIds Type
instance CollectEnvIds Prov where
  collectEnvIds _ = []
instance CollectEnvIds Value
instance CollectEnvIds Func

instance CollectEnvIds a => CollectEnvIds (Maybe a) where
  collectEnvIds = maybe [] collectEnvIds

instance CollectEnvIds a => CollectEnvIds [a] where
  collectEnvIds = concatMap collectEnvIds

instance CollectEnvIds a => CollectEnvIds (Vector a) where
  collectEnvIds = concatMap collectEnvIds . Vector.toList

instance (CollectEnvIds a, CollectEnvIds b) => CollectEnvIds (a,b) where
  collectEnvIds (a,b) = collectEnvIds a ++ collectEnvIds b

instance (CollectEnvIds a, CollectEnvIds b, CollectEnvIds c) => CollectEnvIds (a,b,c) where
  collectEnvIds (a,b,c) = collectEnvIds a ++ collectEnvIds b ++ collectEnvIds c

instance CollectEnvIds Bool where
  collectEnvIds _ = []

instance CollectEnvIds Char where
  collectEnvIds _ = []

instance CollectEnvIds Double where
  collectEnvIds _ = []

instance CollectEnvIds Int where
  collectEnvIds _ = []

instance CollectEnvIds Bop where
  collectEnvIds _ = []

instance CollectEnvIds Uop where
  collectEnvIds _ = []

instance CollectEnvIds Prim1 where
  collectEnvIds _ = []

instance CollectEnvIds Prim2 where
  collectEnvIds _ = []

instance CollectEnvIds Literal where
  collectEnvIds _ = []

instance CollectEnvIds RecFlag where
  collectEnvIds _ = []

instance CollectEnvIds SrcSpan where
  collectEnvIds _ = []

instance CollectEnvIds DataDecl where
  collectEnvIds _ = []

instance CollectEnvIds TypeDecl where
  collectEnvIds _ = []


data Kind = StepLine | Call | Return
  deriving (Show, Eq, Generic)

showKind StepLine = "step_line"
showKind Call = "call"
showKind Return = "return"

-- | Compute the difference between two expressions
exprDiff :: Env -> Expr -> Expr -> Maybe (Env, Expr, Expr, Kind)
exprDiff env e1 e2 = case (e1, e2) of
  (Var lx x, Var ly y)
    | lx == ly && x == y
      -> Nothing
  (Lam lx px x, Lam ly py y)
    | lx == ly && px == py
      -> exprDiff env x y
  (App lx fx ax, App ly fy ay)
    | lx == ly && length ax == length ay
      -> exprDiff env fx fy <|> msum (zipWith (exprDiff env) ax ay)
  (Bop lx bx x1 x2, Bop ly by y1 y2)
    | lx == ly && bx == by
      -> exprDiff env x1 y1 <|> exprDiff env x2 y2
  (Uop lx ux x, Uop ly uy y)
    | lx == ly && ux == uy
      -> exprDiff env x y
  (Lit lx x, Lit ly y)
    | lx == ly && x == y
      -> Nothing
  (Let lx rx xbs x, Let ly ry ybs y)
    | lx == ly && rx == ry && length xbs == length ybs && map fst xbs == map fst ybs
      -> msum (zipWith (exprDiff env) (map snd xbs) (map snd ybs)) <|> exprDiff env x y
  (Ite lx bx tx fx, Ite ly by ty fy)
    | lx == ly
      -> exprDiff env bx by <|> exprDiff env tx ty <|> exprDiff env fx fy
  (Seq lx x1 x2, Seq ly y1 y2)
    | lx == ly
      -> exprDiff env x1 y1 <|> exprDiff env x2 y2
  (Case lx x axs, Case ly y ays)
    | lx == ly && length axs == length ays && map fst3 axs == map fst3 ays && map snd3 axs == map snd3 ays
      -> exprDiff env x y <|> msum (zipWith (exprDiff env) (map thd3 axs) (map thd3 ays))
  (Tuple lx xs, Tuple ly ys)
    | lx == ly && length xs == length ys
      -> msum (zipWith (exprDiff env) xs ys)
  (ConApp lx cx mx, ConApp ly cy my)
    | lx == ly && cx == cy -> if
        | Just x <- mx, Just y <- my
          -> exprDiff env x y
        | Nothing <- mx, Nothing <- my
          -> Nothing
        | otherwise
          -> Just (env, e1, e2, StepLine)
  (Record lx fxs, Record ly fys)
    | lx == ly && map fst fxs == map fst fys
      -> msum (zipWith (exprDiff env) (map snd fxs) (map snd fys))
  (Prim1 lx (P1 vx _ _) x, Prim1 ly (P1 vy _ _) y)
    | lx == ly && vx == vy
      -> exprDiff env x y
  (Prim2 lx (P2 vx _ _ _) x1 x2, Prim2 ly (P2 vy _ _ _) y1 y2)
    | lx == ly && vx == vy
      -> exprDiff env x1 y1 <|> exprDiff env x2 y2
  (Val _ x, Val _ y)
    | x == y
      -> Nothing
  (With lx ex x, With ly ey y)
    | lx == ly && envId ex == envId ey
      -> exprDiff ex x y
  (Replace lx ex x, Replace ly ey y)
    | lx == ly && envId ex == envId ey
      -> exprDiff ex x y
  (_, Replace _ _ _)
    -> Just (env, e1, e2, Call)
  (Replace _ env' _, _)
    -> Just (env', e1, e2, Return)
  _ -> Just (env, e1, e2, StepLine)

fst3 (a,b,c) = a
snd3 (a,b,c) = b
thd3 (a,b,c) = c


data EdgeKind
  = StepsTo
  | SubTerm !Int
  deriving (Show, Generic, Eq)
