{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE LambdaCase #-}
module NanoML.Eval where

import Control.Monad
import Control.Monad.Catch
import Control.Monad.Catch.Pure
import Control.Monad.Fix
import Control.Monad.Writer hiding (Alt)
import Text.Printf

import NanoML.Parser
import NanoML.Pretty
import NanoML.Types

import Debug.Trace

----------------------------------------------------------------------
-- Evaluation
----------------------------------------------------------------------

type Eval a = CatchT (Writer [Expr]) a

runEval :: Eval a -> Either (SomeException, [Expr]) a
runEval x = case runWriter (runCatchT x) of
  (Left e, tr) -> Left (e, tr)
  (Right v, _) -> Right v

--type MonadEval m = (MonadThrow m, MonadFix m)

evalDecl :: MonadEval m => Decl -> Env -> m Env
evalDecl decl env = case decl of
  DFun Rec    binds -> evalRecBinds binds env
  DFun NonRec binds -> evalNonRecBinds binds env
  DTyp _            -> error "type declarations are not yet supported"

evalRecBinds :: MonadEval m => [(Pat,Expr)] -> Env -> m Env
evalRecBinds binds env = mfix $ \fenv -> foldr joinEnv env <$> evalBinds binds fenv

evalNonRecBinds :: MonadEval m => [(Pat,Expr)] -> Env -> m Env
evalNonRecBinds binds env = foldr joinEnv env <$> evalBinds binds env

evalBinds :: MonadEval m => [(Pat,Expr)] -> Env -> m [Env]
evalBinds binds env = mapM (`evalBind` env) binds

-- | @evalBind (p,e) env@ returns the environment matched by @p@
evalBind :: MonadEval m => (Pat,Expr) -> Env -> m Env
evalBind (p,e) env = do
  v <- eval e env
  matchPat v p >>= \case
    Nothing  -> throwM "pattern-match failed"
    Just env -> return env

-- | evaluate an 'Expr' and discard the enclosed log if successful
logExpr :: MonadEval m => Expr -> m a -> m a
logExpr expr m = censor (const mempty) (tell [expr] >> m)

eval :: MonadEval m => Expr -> Env -> m Value
eval expr env = logExpr expr $ case expr of
  Var v ->
    lookupEnv v env
  Lam v e ->
    return (VF (Func expr env))
  App f args -> do
    vf    <- eval f env
    vargs <- mapM (`eval` env) args
    foldM evalApp vf vargs
  Bop b e1 e2 -> do
    v1 <- eval e1 env
    v2 <- eval e2 env
    evalBop b v1 v2
  Lit l -> return (litValue l)
  Let Rec binds body -> do
    env <- evalRecBinds binds env
    eval body env
  Let NonRec binds body -> do
    env <- evalNonRecBinds binds env
    eval body env
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
    evalAlts v as env
  Cons e es -> do
    v     <- eval e env
    VL vs <- eval es env
    return (VL (v : vs))
  Nil -> return (VL [])
  Tuple es -> do
    vs <- mapM (`eval` env) es
    return (VT (length vs) vs)
  Prim1 (P1 f) e -> do
    v <- eval e env
    f v
  Prim2 (P2 f) e1 e2 -> do
    v1 <- eval e1 env
    v2 <- eval e2 env
    f v1 v2

evalApp :: MonadEval m => Value -> Value -> m Value
evalApp f a = logExpr (App (Val f) [Val a]) $ case f of
  VF (Func (Lam p e) env) -> do
    Just pat_env <- matchPat a p
    eval e (joinEnv pat_env env)
  _ -> throwM "tried to apply a non-function"

evalBop :: MonadEval m
        => Bop -> Value -> Value -> m Value
evalBop bop v1 v2 = logExpr (Bop bop (Val v1) (Val v2)) $ case bop of
  Eq     -> VB <$> eqVal v1 v2
  Neq    -> VB . not <$> eqVal v1 v2
  Lt     -> VB <$> ltVal v1 v2
  Le     -> (\x y -> VB (x || y)) <$> ltVal v1 v2 <*> eqVal v1 v2
  Gt     -> VB <$> gtVal v1 v2
  Ge     -> (\x y -> VB (x || y)) <$> gtVal v1 v2 <*> eqVal v1 v2
  Plus   -> plusVal v1 v2
  Minus  -> minusVal v1 v2
  Times  -> timesVal v1 v2
  Div    -> divVal v1 v2
  Mod    -> modVal v1 v2
  FPlus  -> plusVal v1 v2
  FMinus -> minusVal v1 v2
  FTimes -> timesVal v1 v2
  FDiv   -> divVal v1 v2



ltVal (VI x) (VI y) = return (x < y)
ltVal (VD x) (VD y) = return (x < y)
ltVal x      y      = throwM "cannot compare ordering of non-numeric types"

gtVal (VI x) (VI y) = return (x > y)
gtVal (VD x) (VD y) = return (x > y)
gtVal x      y      = throwM "cannot compare ordering of non-numeric types"

plusVal (VI i) (VI j) = return $ VI (i+j)
plusVal (VD i) (VD j) = return $ VD (i+j)
plusVal _      _      = throwM "+ can only be applied to ints"

minusVal (VI i) (VI j) = return $ VI (i-j)
minusVal (VD i) (VD j) = return $ VD (i-j)
minusVal _      _      = throwM "- can only be applied to ints"

timesVal (VI i) (VI j) = return $ VI (i*j)
timesVal (VD i) (VD j) = return $ VD (i*j)
timesVal _      _      = throwM "* can only be applied to ints"

divVal (VI i) (VI j) = return $ VI (i `div` j)
divVal (VD i) (VD j) = return $ VD (i / j)
divVal _      _      = throwM "/ can only be applied to ints"

modVal (VI i) (VI j) = return $ VI (i `mod` j)
modVal _      _      = throwM "mod can only be applied to ints"

litValue :: Literal -> Value
litValue (LI i) = VI i
litValue (LD d) = VD d
litValue (LB b) = VB b
litValue (LS s) = VS s
litValue LU     = VU

evalAlts :: MonadEval m => Value -> [Alt] -> Env -> m Value
evalAlts _ [] _
  = throwM "no matching pattern"
evalAlts v ((p,g,e):as) env
  = matchPat v p >>= \case
      Nothing  -> evalAlts v as env
      Just bnd -> do let newenv = joinEnv bnd env
                     case g of
                      Nothing -> eval e newenv
                      Just g  ->
                        eval g newenv >>= \case
                          VB True  -> eval e newenv
                          VB False -> evalAlts v as env

-- | If a @Pat@ matches a @Value@, returns the @Env@ bound by the
-- pattern.
matchPat :: MonadEval m => Value -> Pat -> m (Maybe Env)
-- NOTE: should be MonadEval m => m (Maybe Env) so we can throw exception on ill-typed pattern match
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
  ListPat ps -> error "matchPat.ListPat"
  TuplePat ps
    | VT n vs <- v
    , length ps == n
      -> fmap (foldr1 joinEnv) . (sequence :: [Maybe Env] -> Maybe [Env])
           <$> zipWithM matchPat vs ps
  WildPat ->
    return $ Just emptyEnv
  ConPat "[]" _
    | VL [] <- v
      -> return (Just emptyEnv)
    | VL _ <- v
      -> return Nothing
  _ -> throwM (printf "type error: tried to match %s against %s"
                      (show $ pretty v) (show $ pretty p) :: String)

unconsVal :: MonadEval m => Value -> m (Value, Value)
unconsVal (VL (x:xs)) = return (x, VL xs)
unconsVal _           = throwM "type error: uncons can only be applied to lists"

matchLit :: Value -> Literal -> Bool
matchLit (VI i1) (LI i2) = i1 == i2
matchLit (VD d1) (LD d2) = d1 == d2
matchLit (VB b1) (LB b2) = b1 == b2
matchLit VU      LU      = True
matchLit _       _       = False
