{-# LANGUAGE TupleSections #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RecordWildCards #-}
module NanoML.Eval (module NanoML.Eval, module NanoML.Monad) where

import Control.Exception
import Control.Monad
import Control.Monad.Except
import Control.Monad.Fix
import Control.Monad.Random
import Control.Monad.RWS   hiding (Alt)
import Data.IORef
import Data.List
import Data.Maybe
import qualified Data.Vector as Vector
import System.IO.Unsafe
import Text.Printf

import NanoML.Gen
import NanoML.Misc
import NanoML.Monad
import NanoML.Parser
import NanoML.Pretty
import NanoML.Prim
import NanoML.Types

import Debug.Trace

----------------------------------------------------------------------
-- Evaluation
----------------------------------------------------------------------

evalString :: MonadEval m => String -> m Value
evalString s = case parseExpr s of
  Left e  -> throwError (ParseError e)
  Right e -> eval e

evalDecl :: MonadEval m => Decl -> m ()
evalDecl decl = case decl of
  DFun _ Rec    binds  -> evalRecBinds binds >>= setVarEnv
  DFun _ NonRec binds  -> evalNonRecBinds binds >>= setVarEnv
  DEvl _ expr -> void $ eval expr
  DTyp _ decls -> mapM_ addType decls
  DExn _ decl -> extendType "exn" decl

evalRecBinds :: MonadEval m => [(Pat,Expr)] -> m Env
evalRecBinds binds = do
  penv <- gets stVarEnv
  mfix $ \fenv -> do
    setVarEnv fenv
    bnd <- evalBinds binds
    allocEnvWith "let-rec" penv bnd

evalNonRecBinds :: MonadEval m => [(Pat,Expr)] -> m Env
evalNonRecBinds binds = do
  bnd <- evalBinds binds
  allocEnv "let" bnd

evalBinds :: MonadEval m => [(Pat,Expr)] -> m [(Var,Value)]
evalBinds binds = concatMapM evalBind binds

-- | @evalBind (p,e) env@ returns the environment matched by @p@
evalBind :: MonadEval m => (Pat,Expr) -> m [(Var,Value)]
evalBind (p,e) = do
  v <- eval e
  matchPat v p >>= \case
    Nothing  -> withCurrentProvM $ \prv -> throwError $ MLException (mkExn "Match_failure" [] prv)
    Just env -> return env



logEnv :: MonadEval m => m Env -> m Env
logEnv = id
-- logEnv m = mycensor (\env w -> mkLog env) m
--   where
--   mkLog env = map (uncurry (=:)) (toListEnv env)

logMaybeEnv :: MonadEval m => m (Maybe Env) -> m (Maybe Env)
logMaybeEnv = id
-- logMaybeEnv m = mycensor (\env w -> mkLog env) m
--   where
--   mkLog (Just env) = map (uncurry (=:)) (toListEnv env)
--   mkLog _          = []

logExpr :: MonadEval m => Expr -> m Value -> m Value
logExpr _ = id
-- logExpr (Var v) m = mycensor (\v w -> []) (tell [pretty (Var v)] >> m)
-- logExpr (Lit l) m = mycensor (\v w -> []) (tell [pretty (Lit l)] >> m)
-- logExpr (Lam p e) m = mycensor (\v w -> []) (tell [pretty (Lam p e)] >> m)
-- logExpr (Val v) m = mycensor (\v w -> []) (tell [pretty (Val v)] >> m)
-- logExpr e@(ConApp "[]" Nothing) m = mycensor (\v w -> []) (tell [pretty e] >> m)
-- logExpr expr m = mycensor (\v w -> [expr ==> v]) (tell [pretty expr] >> m)

mycensor :: MonadWriter w m => (a -> w -> w) -> m a -> m a
mycensor f m = pass $ do
    a <- m
    return (a, f a)

eval :: MonadEval m => Expr -> m Value
eval expr = logExpr expr $ case expr of
  Var ms v ->
    lookupVar v
  Lam ms _ _ -> withCurrentProvM $ \prv ->
    VF prv . Func expr <$> gets stVarEnv
  App ms f args -> do
    vf    <- eval f
    vargs <- mapM eval args
    -- FIXME: this appears to be discarding bindings introduced by the
    -- function application
    foldM evalApp vf vargs
  Bop ms b e1 e2 -> do
    v1 <- eval e1
    v2 <- eval e2
    evalBop b v1 v2
  Uop ms u e -> do
    v <- eval e
    evalUop u v
  Lit ms l -> litValue l
  Let ms Rec binds body -> do
    env <- evalRecBinds binds
    eval body `withEnv` env
  Let ms NonRec binds body -> do
    env <- evalNonRecBinds binds
    eval body `withEnv` env
  Ite ms eb et ef -> do
    vb <- eval eb
    case vb of
      VB _ True  -> eval et
      VB _ False -> eval ef
      _        -> typeError (typeOf vb) (tCon tBOOL)
  Seq ms e1 e2 ->
    eval e1 >> eval e2
  Case ms e as -> do
    v <- eval e
    evalAlts v as
  Tuple ms es -> do
    vs <- mapM eval es
    withCurrentProv $ \prv -> (VT prv (length vs) vs (map typeOf vs))
  ConApp ms "()" Nothing -> withCurrentProv VU
  ConApp ms "[]" Nothing -> withCurrentProv$ \prv -> (VL prv [] (TVar "a"))
  ConApp ms "::" (Just (Tuple ms' [h,t])) -> do
    vh <- eval h
    vt <- eval t
    force vt (tL (typeOf vh)) $ \(VL _ vt t) -> do
      su <- unify t (typeOf vh)
      withCurrentProv $ \prv -> (VL prv (vh:vt) (subst su t))
  ConApp ms dc Nothing -> do
    evalConApp dc Nothing
  ConApp ms dc (Just e) -> do
    v <- eval e
    evalConApp dc (Just v)
  Record ms flds -> do
    td@TypeDecl {tyCon, tyRhs = TRec fs} <- lookupField $ fst $ head flds
    unless (all (`elem` map fst3 fs) (map fst flds)) $
      otherError $ printf "invalid fields for type %s: %s" tyCon (show $ pretty expr)
    unless (all (`elem` map fst flds) (map fst3 fs)) $
      otherError $ printf "missing fields for type %s: %s" tyCon (show $ pretty expr)
    (vs, sus) <- fmap unzip $ forM fs $ \ (f, m, t) -> do
      let e = fromJust $ lookup f flds
      v <- eval e
      force v t $ \v -> do
        su <- unify t (typeOf v)
        i <- fresh
        writeStore i (m,v)
        return ((f,i),su)
    let t = subst (mconcat sus) $ typeDeclType td
    withCurrentProv $ \prv -> (VR prv vs t)
  Field ms e f -> do
    v <- eval e
    getField v f
  SetField ms r f e -> do
    vr <- eval r
    v  <- eval e
    setField vr f v
    withCurrentProv VU
  Array ms [] -> withCurrentProv $ \prv -> (VV prv Vector.empty (TVar "a"))
  Array ms es -> do
    (v:vs) <- mapM eval es
    mapM_ (unify (typeOf v) . typeOf) vs
    withCurrentProv $ \prv -> (VV prv (Vector.fromList (v:vs)) (typeOf v))
  Try ms e alts -> do
    env <- gets stVarEnv
    eval e `catchError` \e -> do
      setVarEnv env
      case e of
        MLException ex -> evalAlts ex alts
        _              -> maybeThrow e
  Prim1 _ (P1 p f t) e -> do
    v <- eval e
    force v t $ \v -> f v
  Prim2 _ (P2 p f t1 t2) e1 e2 -> do
    v1 <- eval e1
    v2 <- eval e2
    forces [(v1,t1),(v2,t2)] $ \[v1,v2] -> f v1 v2
  Val _ v -> return v

force :: MonadEval m => Value -> Type -> (Value -> m a) -> m a
force x (TVar {}) k = k x -- delay instantiation until we have a concrete type
force (VH r _) t k = do
  lookupStore r >>= \case
    Just (_,v) -> do
      unify (typeOf v) t
      k v
    Nothing -> do
      env <- gets stTypeEnv
      v <- genValue t env
      writeStore r (NonMut,v)
      k v
force v t k = do
  unify (typeOf v) t
  k v

forces :: MonadEval m => [(Value,Type)] -> ([Value] -> m a) -> m a
forces vts k = go vts []
  where
  go []          vs = k (reverse vs)
  go ((v,t):vts) vs = force v t (\v -> go vts (v:vs))

forceSame :: MonadEval m => Value -> Value -> (Value -> Value -> m a) -> m a
forceSame x@(VH {}) y@(VH {}) k =
  forces [(x,tCon tINT),(y,tCon tINT)] $ \[x,y] -> k x y
forceSame x@(VH {}) y k = force x (typeOf y) $ \x -> k x y
forceSame x y@(VH {}) k = force y (typeOf x) $ \y -> k x y
forceSame x y k = unify (typeOf x) (typeOf y) >> k x y

evalApp :: MonadEval m => Value -> Value -> m Value
evalApp f a = logExpr (App Nothing (Val Nothing f) [Val Nothing a]) $ case f of
  VF _ (Func (Lam ms p e) env) -> do
    Just pat_env <- matchPat a p
    eval e `withEnv` error "evalApp" -- joinEnv pat_env env
  _ -> otherError "tried to apply a non-function"

evalConApp :: MonadEval m => DCon -> Maybe Value -> m Value
evalConApp dc v = do
  dd <- lookupDataCon dc
  prv <- getCurrentProv
  case (dArgs dd, v) of
    ([], Nothing)
      | dc == "()" -> return (VU prv)
      | dc == "[]" -> return (VL prv [] (TVar "a"))
      | otherwise  -> return (VA prv dc v (typeDeclType $ dType dd))
    ([a], Just v) -> force v a $ \v -> do
      su <- unify a (typeOf v)
      let t = subst su $ typeDeclType $ dType dd
      return (VA prv dc (Just v) t)
    (as,  Just (VT _ n vs ts))
      | dc == "::"
      , [vh, VL _ vt t] <- vs -> do
        su <- unify (typeOf vh) t
        return (VL prv (vh : vt) (subst su t))
      | length as == n -> forces (zip vs ts) $ \vs -> do
        su <- mconcat <$> zipWithM unify as ts
        let t = subst su $ typeDeclType $ dType dd
        return (VA prv dc v t)
    (as, _) -> do
      let nArgs = case v of
            Nothing         -> 0
            Just (VT _ n _ _) -> n
            Just _          -> 1
      otherError (printf "%s expects %d arguments, but was given %d"
                        dc (length as) nArgs)

evalBop :: MonadEval m
        => Bop -> Value -> Value -> m Value
evalBop bop v1 v2 = withCurrentProvM $ \prv ->
 logExpr (Bop Nothing bop (Val Nothing v1) (Val Nothing v2)) $ case bop of
  Eq     -> forceSame v1 v2 $ \v1 v2 -> VB prv <$> eqVal v1 v2
  Neq    -> forceSame v1 v2 $ \v1 v2 -> VB prv . not <$> eqVal v1 v2
  Lt     -> forceSame v1 v2 $ \v1 v2 -> VB prv <$> ltVal v1 v2
  Le     -> forceSame v1 v2 $ \v1 v2 -> (\x y -> VB prv (x || y)) <$> ltVal v1 v2 <*> eqVal v1 v2
  Gt     -> forceSame v1 v2 $ \v1 v2 -> VB prv <$> gtVal v1 v2
  Ge     -> forceSame v1 v2 $ \v1 v2 -> (\x y -> VB prv (x || y)) <$> gtVal v1 v2 <*> eqVal v1 v2
  Plus   -> forces [(v1,tCon tINT),(v2,tCon tINT)] $ \[v1,v2] -> plusVal v1 v2
  Minus  -> forces [(v1,tCon tINT),(v2,tCon tINT)] $ \[v1,v2] -> minusVal v1 v2
  Times  -> forces [(v1,tCon tINT),(v2,tCon tINT)] $ \[v1,v2] -> timesVal v1 v2
  Div    -> forces [(v1,tCon tINT),(v2,tCon tINT)] $ \[v1,v2] -> divVal v1 v2
  Mod    -> forces [(v1,tCon tINT),(v2,tCon tINT)] $ \[v1,v2] -> modVal v1 v2
  FPlus  -> forces [(v1,tCon tFLOAT),(v2,tCon tFLOAT)] $ \[v1,v2] -> plusVal v1 v2
  FMinus -> forces [(v1,tCon tFLOAT),(v2,tCon tFLOAT)] $ \[v1,v2] -> minusVal v1 v2
  FTimes -> forces [(v1,tCon tFLOAT),(v2,tCon tFLOAT)] $ \[v1,v2] -> timesVal v1 v2
  FDiv   -> forces [(v1,tCon tFLOAT),(v2,tCon tFLOAT)] $ \[v1,v2] -> divVal v1 v2

evalUop :: MonadEval m => Uop -> Value -> m Value
evalUop Neg  v = force v (tCon tINT)   $ \(VI _ i) -> withCurrentProv $ \prv -> VI prv (negate i)
evalUop FNeg v = force v (tCon tFLOAT) $ \(VD _ d) -> withCurrentProv $ \prv -> VD prv (negate d)


-- ltVal (VI x) (VI y) = return (x < y)
-- ltVal (VD x) (VD y) = return (x < y)
-- ltVal x      y      = typeError "cannot compare ordering of non-numeric types"

-- gtVal (VI x) (VI y) = return (x > y)
-- gtVal (VD x) (VD y) = return (x > y)
-- gtVal x      y      = typeError "cannot compare ordering of non-numeric types"

ltVal x y = do
  VI _ i <- cmpVal x y
  return (i == (-1))

gtVal x y = do
  VI _ i <- cmpVal x y
  return (i == 1)

plusVal (VI _ i) (VI _ j) = withCurrentProv $ \prv -> VI prv (i+j)
plusVal (VD _ i) (VD _ j) = withCurrentProv $ \prv -> VD prv (i+j)
-- plusVal _      _      = typeError "+ can only be applied to ints"

minusVal (VI _ i) (VI _ j) = withCurrentProv $ \prv -> VI prv (i-j)
minusVal (VD _ i) (VD _ j) = withCurrentProv $ \prv -> VD prv (i-j)
-- minusVal _      _      = typeError "- can only be applied to ints"

timesVal (VI _ i) (VI _ j) = withCurrentProv $ \prv -> VI prv (i*j)
timesVal (VD _ i) (VD _ j) = withCurrentProv $ \prv -> VD prv (i*j)
-- timesVal _      _      = typeError "* can only be applied to ints"

divVal (VI _ i) (VI _ j) = withCurrentProv $ \prv -> VI prv (i `div` j)
divVal (VD _ i) (VD _ j) = withCurrentProv $ \prv -> VD prv (i / j)
-- divVal _      _      = typeError "/ can only be applied to ints"

modVal (VI _ i) (VI _ j) = withCurrentProv $ \prv -> VI prv (i `mod` j)
-- modVal _      _      = typeError "mod can only be applied to ints"

litValue :: MonadEval m => Literal -> m Value
litValue (LI i) = withCurrentProv $ \prv -> VI prv i
litValue (LD d) = withCurrentProv $ \prv -> VD prv d
litValue (LB b) = withCurrentProv $ \prv -> VB prv b
litValue (LC c) = withCurrentProv $ \prv -> VC prv c
litValue (LS s) = withCurrentProv $ \prv -> VS prv s
--litValue LU     = VU

evalAlts :: MonadEval m => Value -> [Alt] -> m Value
evalAlts _ []
  = withCurrentProvM $ \prv -> maybeThrow $ MLException (mkExn "Match_failure" [] prv)
evalAlts v ((p,g,e):as)
  = matchPat v p >>= \case
      Nothing  -> evalAlts v as
      Just bnd -> do newenv <- error "evalAlts" -- joinEnv bnd <$> gets stVarEnv
                     case g of
                      Nothing -> eval e `withEnv` newenv
                      Just g  ->
                        eval g `withEnv` newenv >>= \case
                          VB _ True  -> eval e `withEnv` newenv
                          VB _ False -> evalAlts v as

-- | If a @Pat@ matches a @Value@, returns the @Env@ bound by the
-- pattern.
matchPat :: MonadEval m => Value -> Pat -> m (Maybe [(Var,Value)])
matchPat v p = case p of
  VarPat _ var ->
    return $ Just [(var,v)]
  LitPat _ lit -> force v (typeOfLit lit) $ \v -> do
    b <- matchLit v lit
    return $ if b then Just mempty else Nothing
  IntervalPat _ lo hi -> force v (typeOfLit lo) $ \v -> do
    VB _ b <- eval (mkApps Nothing (Var Nothing "&&")
                  [ mkApps Nothing (Var Nothing ">=") [Val Nothing v, Lit Nothing lo]
                  , mkApps Nothing (Var Nothing "<=") [Val Nothing v, Lit Nothing hi]])
    return $ if b then Just mempty else Nothing
  ConsPat _ p ps -> force v (tL a) $ \v -> do
    case v of
      VL _ [] _ -> return Nothing
      VL _ _ _ -> do
        (x,xs) <- unconsVal v
        menv1 <- matchPat x p
        menv2 <- matchPat xs ps
        case (menv1, menv2) of
         (Just env1, Just env2) -> return $ Just (env1 <> env2)
         _                      -> return Nothing
  ListPat _ ps -> force v (tL a) $ \(VL _ vs _) -> do
    if length ps /= length vs
      then return Nothing
      else fmap mconcat . sequence -- :: [Maybe _] -> Maybe [_])
             <$> zipWithM matchPat vs ps
  TuplePat _ ps -> force v (TTup (replicate (length ps) a)) $ \(VT _ _ vs _) -> do
    fmap mconcat . sequence -- :: [Maybe _] -> Maybe [_])
       <$> zipWithM matchPat vs ps
  WildPat _ ->
    return $ Just mempty
  ConPat _ "[]" Nothing -> force v (tL a) $ \(VL _ vs _) ->
    case vs of
      [] -> return (Just mempty)
      _  -> return Nothing
  ConPat _ "()" Nothing -> force v tU $ \v ->
     return (Just mempty)
  ConPat _ dc p' -> do
    -- FIXME: this is confusing
    dd <- lookupDataCon dc
    force v (typeDeclType $ dType dd) $ \(VA _ c v' t) -> do
        unless (safeMatch (dArgs dd) p') err
        if dc /= c
          then return Nothing
          else case (p', v') of
          (Nothing, Nothing) -> return (Just mempty)
          (Just p,  Nothing) -> err
          (Nothing, Just p)  -> err
          (Just p,  Just v)  -> matchPat v p
  AsPat _ p x -> do
    Just env <- matchPat v p
    return (Just ((x,v) : env))
  ConstraintPat _ p t -> force v t $ \v -> do
    matchPat v p
  _ -> err
  where err = otherError (printf "tried to match %s against %s"
                      (show $ pretty v) (show $ pretty p) :: String)

safeMatch [] Nothing = True
safeMatch [t] (Just p) = True
safeMatch ts (Just (TuplePat _ ps)) = True
safeMatch ts (Just (WildPat _)) = True
safeMatch _ _ = False

unconsVal :: MonadEval m => Value -> m (Value, Value)
unconsVal (VL prv (x:xs) t) = return (x, VL prv xs t) -- FIXME: is this the right provenance??
unconsVal _             = otherError "type error: uncons can only be applied to lists"

matchLit :: MonadEval m => Value -> Literal -> m Bool
matchLit (VI _ i1) (LI i2) = return $ i1 == i2
matchLit (VD _ d1) (LD d2) = return $ d1 == d2
matchLit (VB _ b1) (LB b2) = return $ b1 == b2
matchLit (VC _ c1) (LC c2) = return $ c1 == c2
matchLit (VS _ s1) (LS s2) = return $ s1 == s2
--matchLit VU      LU      = return True
matchLit v       l       = do
  lv <- litValue l
  typeError (typeOf v) (typeOf lv)


testEval :: String -> IO ()
testEval s = let Right e = parseExpr s
             in print $ runEval stdOpts (eval e)
