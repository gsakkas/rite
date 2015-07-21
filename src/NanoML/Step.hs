{-# LANGUAGE NamedFieldPuns   #-}
{-# LANGUAGE BangPatterns     #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase       #-}
{-# LANGUAGE ViewPatterns     #-}
module NanoML.Step where

import Control.Monad.Except
import Control.Monad.State
import Data.Maybe
import qualified Data.Vector as Vector
import Text.Printf

import NanoML.Eval
import NanoML.Misc
import NanoML.Pretty
import NanoML.Prim
import NanoML.Types

import Debug.Trace

stepAll expr = do
  traceShowM $ pretty expr
  expr' <- step expr
  if isVal expr'
     then return expr'
     else stepAll expr'

stepAllProg [] = return ()
stepAllProg (d:p) = do
  traceShowM $ pretty d
  md <- stepDecl d
  case md of
    Nothing -> stepAllProg p
    Just d  -> stepAllProg (d:p)

stepDecl :: MonadEval m => Decl -> m (Maybe Decl)
stepDecl decl = case decl of
  DFun ss Rec    binds -> do
    setVarEnv =<< evalRecBinds binds
    return Nothing
  DFun ss NonRec binds -> do
    let (ps, es) = unzip binds
    stepOne es
      (\vs -> Nothing <$ (setVarEnv =<< evalNonRecBinds (zip ps vs)))
      (\es -> return . Just $ DFun ss NonRec (zip ps es))
  DEvl ss expr
    | isVal expr -> return Nothing
    | otherwise  -> Just . DEvl ss <$> step expr
  DTyp _ decls -> mapM_ addType decls >> return Nothing
  DExn _ decl -> extendType "exn" decl >> return Nothing


step :: MonadEval m => Expr -> m Expr
step expr = case expr of
  Val v -> return expr
  With env e -> do
    e' <- step e `withExtendedEnv` env
    return $ if isVal e'
             then e'
             else With env e'
  Replace env e -> do
    e' <- step e `withEnv` env
    return $ if isVal e'
             then e'
             else Replace env e'
  Var v -> 
    fmap Val . lookupEnv v =<< gets stVarEnv
  Lam _ _ -> 
    Val . VF . Func expr <$> gets stVarEnv
  App f args -> stepOne (f:args)
                  (\(f:args) -> stepApp f args)
                  (\(f:args) -> return $ App f args)
  Bop b e1 e2 -> stepOne [e1,e2]
                   (\[v1,v2] -> stepBop b v1 v2)
                   (\[e1,e2] -> return $ Bop b e1 e2)
  Uop u e
    | isVal e   -> stepUop u e
    | otherwise -> Uop u <$> step e
  Lit l -> return (Val (litValue l))
  Let Rec binds body -> do
    env <- evalRecBinds binds
    return $ With env body
    -- let (ps, es) = unzip binds
    -- env <- gets stVarEnv
    -- stepOne es
    --   (\vs -> do fenv <- foldr joinEnv env <$> zipWithM matchPat vs ps
    --              )
    --   (\es -> return $ Let Rec (zip ps es) body)
  Let NonRec binds body -> do
    let (ps, es) = unzip binds
    env <- gets stVarEnv
    stepOne es
      (\vs -> flip With body <$> evalNonRecBinds (zip ps vs))
      (\es -> return $ Let NonRec (zip ps es) body)
  Ite b t f
    | Val b <- b
      -> case b of
          VB True  -> return t
          VB False -> return f
    | otherwise
      -> do b <- step b
            return $ Ite b t f
  Seq e1 e2
    | isVal e1  -> return e2
    | otherwise -> flip Seq e2 <$> step e1
  Case e as
    | isVal e   -> stepAlts e as
    | otherwise -> flip Case as <$> step e
  Tuple es -> stepOne es
                (\vs -> return . Val $ VT (length vs) (map unVal vs) (map (typeOf . unVal) vs))
                (\es -> return $ Tuple es)
  ConApp dc Nothing -> do
    Val <$> evalConApp dc Nothing
  ConApp dc (Just e)
    | Val v <- e -> Val <$> evalConApp dc (Just v)
    | otherwise  -> ConApp dc . Just <$> step e
  Record flds
    | all (isVal . snd) flds -> do
      td@TypeDecl {tyCon, tyRhs = TRec fs} <- lookupField $ fst $ head flds
      (vs, sus) <- fmap unzip $ forM fs $ \ (f, m, t) -> do
        let Val v = fromJust $ lookup f flds
        force v t $ \v -> do
          su <- unify t (typeOf v)
          i <- fresh
          writeStore i (m,v)
          return ((f,i),su)
      let t = subst (mconcat sus) $ typeDeclType td
      return . Val $ VR vs t
    | otherwise -> do
      td@TypeDecl {tyCon, tyRhs = TRec fs} <- lookupField $ fst $ head flds
      unless (all (`elem` map fst3 fs) (map fst flds)) $
        typeError $ printf "invalid fields for type %s: %s" tyCon (show $ pretty expr)
      unless (all (`elem` map fst flds) (map fst3 fs)) $
        typeError $ printf "missing fields for type %s: %s" tyCon (show $ pretty expr)
      let (fs, es) = unzip flds
      stepOne es
        (error "step.Record: impossible")
        (\es -> return $ Record $ zip fs es)
  Field e f
    | Val v <- e -> Val <$> getField v f
  SetField r f e -> stepOne [r,e]
                      (\[Val vr, Val ve] -> setField vr f ve >> return (Val VU))
                      (\[r,e] -> return $ SetField r f e)
  Array [] -> return $ Val (VV Vector.empty (TVar "a"))
  Array es -> stepOne es
                (\(map unVal -> (v:vs)) -> do
                    mapM_ (unify (typeOf v) . typeOf) vs
                    return (Val (VV (Vector.fromList (v:vs)) (typeOf v))))
                (\es -> return $ Array es)
  Try e alts
    | isVal e   -> return e
    | otherwise -> do
        env <- gets stVarEnv
        flip Try alts <$> step e `catchError` \e -> do
          setVarEnv env
          case e of
            MLException ex -> stepAlts (Val ex) alts
            _              -> Val <$> maybeThrow e
  Prim1 p@(P1 x f t) e
    | Val v <- e -> fmap Val . force v t $ \v -> f v
    | otherwise  -> Prim1 p <$> step e
  Prim2 p@(P2 x f t1 t2) e1 e2 ->
    stepOne [e1,e2]
      (\[Val v1, Val v2] -> fmap Val . forces [(v1,t1),(v2,t2)] $ \[v1,v2] -> f v1 v2)
      (\[e1,e2] -> return (Prim2 p e1 e2))
  _ -> error (show expr)

stepApp :: MonadEval m => Expr -> [Expr] -> m Expr
stepApp (Val f) (Val v : es) = case f of
  VF (Func (Lam p e) env) -> do
    Just pat_env <- matchPat v p
    -- pushEnv env
    -- pushEnv pat_env
    return . Replace env . With pat_env $ case es of
      [] -> e
      _  -> App e es
  _ -> typeError $ printf "'%s' is not a function" (show f)
stepApp f es = error (show (f:es))

-- stepApp (Val f) (map unVal -> vs) = do
--   let (ps, e, env) = gatherLams f
--   let (hd, tl) = splitAt (length ps) vs
--   Just pat_env <- mconcat <$> zipWithM matchPat hd ps
--   case tl of
--           -- this doesn't seem right..
--     [] -> return e -- step e `withExtendedEnv` joinEnv pat_env env
--     --vs -> 

stepBop :: MonadEval m => Bop -> Expr -> Expr -> m Expr
stepBop bop (Val v1) (Val v2) = Val <$> evalBop bop v1 v2

stepUop :: MonadEval m => Uop -> Expr -> m Expr
stepUop uop (Val v) = Val <$> evalUop uop v

stepAlts :: MonadEval m => Expr -> [Alt] -> m Expr
stepAlts _ []
  = fmap Val . maybeThrow $ MLException (mkExn "Match_failure" [])
stepAlts (Val v) ((p,g,e):as)
  = matchPat v p >>= \case
      Nothing  -> stepAlts (Val v) as
      Just bnd -> do newenv <- joinEnv bnd <$> gets stVarEnv
                     case g of
                      Nothing -> return $ With bnd e
                      Just g  ->
                        eval g `withExtendedEnv` newenv >>= \case
                          VB True  -> return $ With bnd e
                          VB False -> stepAlts (Val v) as

----------------------------------------------------------------------
-- Utilities
----------------------------------------------------------------------

stepOne :: MonadEval m
        => [Expr]          -- ^ possible expressions to step through
        -> ([Expr] -> m a) -- ^ what to do when they're all values
        -> ([Expr] -> m a) -- ^ what to do after stepping a single expression
        -> m a
stepOne es kv ke = do
  let (vals, exprs) = span isVal es
  case exprs of
    []     -> kv vals
    (e:es) -> do
      v <- step e
      ke (vals ++ v : es)
          
-- single :: Functor m => m a -> m [a]
-- single = fmap (:[])

-- choose :: MonadEval m => [Expr] -> ([Expr] -> m Expr) -> m [Expr]
-- choose exprs k = go exprs []
--   where
--   -- go :: MonadEval m => [Expr] -> [Expr] -> m [Expr]
--   go []     !vals = single (k vals)
--   go (e:es) !vals
--     | isVal e     = go es (vals ++ [e])
--     | otherwise   = do vs <- step e
--                        concatMapM (\v -> do x <- k (vals ++ v : es)
--                                             (x:) <$> go es (vals ++ [v])
--                                   ) vs
                       

isVal :: Expr -> Bool
isVal (Val _)    = True
-- isVal (With _ e) = isVal e
isVal _          = False

unVal :: Expr -> Value
unVal (Val v) = v

spanVals :: [Expr] -> ([Value],[Expr])
spanVals xs = let (vs,es) = span isVal xs
              in (map unVal vs, es)

gatherLams :: Value -> ([Pat], Expr, Env)
gatherLams (VF (Func (Lam p e) env)) = go [p] e
  where
  go ps (Lam p e) = go (p:ps) e
  go ps e         = (reverse ps, e, env)

concatMapM :: Monad m => (a -> m [b]) -> [a] -> m [b]
concatMapM f xs = liftM concat (mapM f xs)
