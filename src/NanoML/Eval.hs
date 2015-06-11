{-# LANGUAGE LambdaCase #-}
module NanoML.Eval where

import Control.Monad
import Control.Monad.Catch
import Control.Monad.Fix
import Text.Printf

import NanoML.Parser
import NanoML.Types

import Debug.Trace

----------------------------------------------------------------------
-- Evaluation
----------------------------------------------------------------------

evalDecl :: (MonadThrow m, MonadFix m) => Decl -> Env -> m Env
evalDecl decl env = case decl of
  DFun Rec    binds -> evalRecBinds binds env
  DFun NonRec binds -> evalNonRecBinds binds env

evalRecBinds :: (MonadThrow m, MonadFix m) => [(Pat,Expr)] -> Env -> m Env
evalRecBinds binds env = mfix $ \fenv -> foldM (evalBind fenv) env binds
  where
  evalBind fenv env (p,e) = do
    v    <- eval e fenv
    Just benv <- matchPat v p
    return (joinEnv benv env)

evalNonRecBinds = undefined

  -- DFun Rec (FunPat f ps) e -> do
  --   c <- setClosureName f <$> eval (mkCurried ps e) env
  --   return (insertEnv f c env)
  -- DFun NonRec (FunPat f ps) e -> do
  --   c <- eval (mkCurried ps e) env
  --   return (insertEnv f c env)

eval :: MonadThrow m => Expr -> Env -> m Value
eval expr env = traceShow expr $ case expr of
  Var v ->
    lookupEnv v env
  Lam v e ->
    return (VF (Func v e env))
  -- App (App f e1) e2 | isPrimOp f -> do
  --   v1 <- eval e1 env
  --   v2 <- eval e2 env
  --   evalPrimOp f v1 v2
  App e1 e2 -> do
    v1 <- eval e1 env
    v2 <- eval e2 env
    evalApp v1 v2
  Bop b e1 e2 -> do
    v1 <- eval e1 env
    v2 <- eval e2 env
    evalBop b v1 v2
  Lit l -> return (litValue l)
  -- Let Rec (FunPat f ps) e b -> do
  --   c <- setClosureName f <$> eval (mkCurried ps e) env
  --   eval b (insertEnv f c env)
  -- Let NonRec (FunPat f ps) e b -> do
  --   c <- eval (mkCurried ps e) env
  --   eval b (insertEnv f c env)
  -- Let NonRec p e b ->
  --   eval (Case e [(p,Nothing,b)]) env
  Ite eb et ef -> do
    vb <- eval eb env
    case vb of
      VB True  -> eval et env
      VB False -> eval ef env
      _        -> throwM "if-then-else given a non-boolean"
  Seq e1 e2 ->
    eval e1 env >> eval e2 env
  Case e as -> do
    v <- eval e env
    traceM $ "matching: " ++ show v
    traceM $ "against:  " ++ show as
    evalAlts v as env
  Cons e es -> do
    v     <- eval e env
    VL vs <- eval es env
    return (VL (v : vs))
  Nil -> return (VL [])
  Tuple es -> do
    vs <- mapM (`eval` env) es
    return (VT (length vs) vs)

evalApp :: MonadThrow m => Value -> Value -> m Value
evalApp f a = case f of
  VF (Func p e env) -> do
    Just pat_env <- matchPat a p
    eval e (joinEnv pat_env env)
  -- VF (Just me) env p e -> do
  --   Just pat_env <- matchPat a p
  --   eval e (joinEnv pat_env (insertEnv me f env))
  _ -> throwM "tried to apply a non-function"

-- isPrimOp :: Var -> Bool
-- isPrimOp f = f `elem` ["+", "-", "*", "/", "="]

evalBop :: MonadThrow m
        => Bop -> Value -> Value -> m Value
evalBop Eq    v1 v2 = VB <$> eqVal v1 v2
evalBop Neq   v1 v2 = VB . not <$> eqVal v1 v2
evalBop Lt    v1 v2 = VB <$> ltVal v1 v2
evalBop Le    v1 v2 = (\x y -> VB (x || y)) <$> ltVal v1 v2 <*> eqVal v1 v2
evalBop Gt    v1 v2 = VB <$> gtVal v1 v2
evalBop Ge    v1 v2 = (\x y -> VB (x || y)) <$> gtVal v1 v2 <*> eqVal v1 v2
evalBop Plus  v1 v2 = VI <$> plusVal v1 v2
evalBop Minus v1 v2 = VI <$> minusVal v1 v2
evalBop Times v1 v2 = VI <$> timesVal v1 v2
evalBop Div   v1 v2 = VI <$> divVal v1 v2

eqVal (VI x) (VI y) = return (x == y)
eqVal (VD x) (VD y) = return (x == y)
eqVal (VB x) (VB y) = return (x == y)
eqVal VU     VU     = return True
eqVal (VL x) (VL y) = and . ((length x == length y) :) <$> zipWithM eqVal x y
eqVal (VT i x) (VT j y)
  | i == j
  = and <$> zipWithM eqVal x y
eqVal x y
  = throwM (printf "cannot check incompatible types for equality: (%s) (%s)" (show x) (show y) :: String)

ltVal (VI x) (VI y) = return (x < y)
ltVal (VD x) (VD y) = return (x < y)
ltVal x      y      = throwM "cannot compare ordering of non-numeric types"

gtVal (VI x) (VI y) = return (x > y)
gtVal (VD x) (VD y) = return (x > y)
gtVal x      y      = throwM "cannot compare ordering of non-numeric types"

plusVal (VI i) (VI j) = return (i+j)
plusVal _      _      = throwM "+ can only be applied to ints"

minusVal (VI i) (VI j) = return (i-j)
minusVal _      _      = throwM "- can only be applied to ints"

timesVal (VI i) (VI j) = return (i*j)
timesVal _      _      = throwM "* can only be applied to ints"

divVal (VI i) (VI j) = return (i `div` j)
divVal _      _      = throwM "/ can only be applied to ints"


litValue :: Literal -> Value
litValue (LI i) = VI i
litValue (LD d) = VD d
litValue (LB b) = VB b
litValue (LS s) = VS s
litValue LU     = VU

evalAlts :: MonadThrow m => Value -> [Alt] -> Env -> m Value
evalAlts _ [] _
  = throwM "no matching pattern"
evalAlts v ((p,g,e):as) env
  = matchPat v p >>= \case
      Nothing  -> evalAlts v as env
      Just bnd -> eval e (joinEnv bnd env)

-- | If a @Pat@ matches a @Value@, returns the @Env@ bound by the
-- pattern.
matchPat :: MonadThrow m => Value -> Pat -> m (Maybe Env)
-- FIXME: should be MonadThrow m => m (Maybe Env) so we can throw exception on ill-typed pattern match
matchPat v p = case p of
  VarPat var ->
    return $ Just (insertEnv var v emptyEnv)
  LitPat lit ->
    return $ if matchLit v lit then Just emptyEnv else Nothing
  ConsPat p ps -> do
    (x,xs) <- unconsVal v
    Just env1 <- matchPat x p
    Just env2 <- matchPat xs ps
    return $ Just (joinEnv env1 env2)
  ListPat ps -> throwM "matchPat.ListPat"
  TuplePat ps -> throwM "matchPat.TuplePat"
--  FunPat _ _ -> throwM "cannot pattern-match on function"
  WildPat ->
    return $ Just emptyEnv

unconsVal :: MonadThrow m => Value -> m (Value, Value)
unconsVal (VL (x:xs)) = return (x, VL xs)
unconsVal _           = throwM "type error: uncons can only be applied to lists"

matchLit :: Value -> Literal -> Bool
matchLit (VI i1) (LI i2) = i1 == i2
matchLit (VD d1) (LD d2) = d1 == d2
matchLit (VB b1) (LB b2) = b1 == b2
matchLit VU      LU      = True
matchLit _       _       = False
