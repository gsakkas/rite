{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NamedFieldPuns   #-}
{-# LANGUAGE BangPatterns     #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase       #-}
{-# LANGUAGE ViewPatterns     #-}
module NanoML.Step where

import Control.Monad.Except
import Control.Monad.State
import qualified Data.Aeson as Aeson
import qualified Data.ByteString.Lazy as LBS
import Data.List
import Data.Foldable
import qualified Data.IntMap as IntMap
import qualified Data.Map as Map
import Data.Maybe
import Data.Monoid hiding (Alt)
import qualified Data.Sequence as Seq
import qualified Data.Vector as Vector
import Text.Printf

import NanoML.Eval
import NanoML.Misc
import NanoML.Parser
import NanoML.Pretty
import NanoML.Prim
import NanoML.Types

import Debug.Trace

writeTrace p tr = LBS.writeFile "../OnlinePythonTutor/v3/test-trace.js"
                                ("var trace = " <> Aeson.encode obj)
  where
  obj = Aeson.object [ "code" Aeson..= p, "trace" Aeson..= short ]
  short = map head
        $ groupBy eqSpan
        $ toList tr
  eqSpan x y =  evt_line x == evt_line y && evt_column x == evt_column y
             && evt_expr_width x == evt_expr_width y
             && evt_event x == evt_event y

runStep opts x = case runEvalFull opts x of
  (_, st, _) -> stTrace st

stepAll expr = do
  --traceShowM $ pretty expr
  expr' <- step expr
  if isVal expr'
     then return expr'
     else stepAll expr'

stepAllProg [] = return ()
stepAllProg (d:p) = do
  --traceShowM $ pretty d
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
  Val _ v -> return expr
  With env e -> do
    e' <- step e `withExtendedEnv` env
    return $ if isVal e'
             then e'
             else With env e'
  Replace env e -> do
    e' <- step e `withEnv` env
    if isVal e'
      then addReturn e' >> return e'
      else return $ Replace env e'
  Var ms v -> do
    addEvent expr
    fmap (Val ms) . lookupEnv v =<< gets stVarEnv
  Lam ms _ _ -> addEvent expr >>
    Val ms . VF . Func expr <$> gets stVarEnv
  App ms f args -> stepOne (f:args)
                  (\(f:args) -> addEvent expr >> stepApp ms f args)
                  (\(f:args) -> return $ App ms f args)
  Bop ms b e1 e2 -> stepOne [e1,e2]
                   (\[v1,v2] -> addEvent expr >> stepBop ms b v1 v2)
                   (\[e1,e2] -> return $ Bop ms b e1 e2)
  Uop ms u e
    | isVal e   -> stepUop ms u e
    | otherwise -> Uop ms u <$> step e
  Lit ms l -> return (Val ms (litValue l))
  Let ms Rec binds body -> do
    env <- evalRecBinds binds
    return $ With env body
    -- let (ps, es) = unzip binds
    -- env <- gets stVarEnv
    -- stepOne es
    --   (\vs -> do fenv <- foldr joinEnv env <$> zipWithM matchPat vs ps
    --              )
    --   (\es -> return $ Let Rec (zip ps es) body)
  Let ms NonRec binds body -> do
    let (ps, es) = unzip binds
    env <- gets stVarEnv
    stepOne es
      (\vs -> flip With body <$> evalNonRecBinds (zip ps vs))
      (\es -> return $ Let ms NonRec (zip ps es) body)
  Ite ms b t f
    | Val _ b <- b
      -> addEvent expr >> case b of
          VB True  -> return t
          VB False -> return f
    | otherwise
      -> do b <- step b
            return $ Ite ms b t f
  Seq ms e1 e2
    | isVal e1  -> addEvent expr >> return e2
    | otherwise -> (\e1 -> Seq ms e1 e2) <$> step e1
  Case ms e as
    | isVal e   -> addEvent expr >> stepAlts e as
    | otherwise -> (\e -> Case ms e as) <$> step e
  Tuple ms es -> stepOne es
                (\vs -> return . Val ms $ VT (length vs) (map unVal vs) (map (typeOf . unVal) vs))
                (\es -> return $ Tuple ms es)
  ConApp ms dc Nothing -> do
    Val ms <$> evalConApp dc Nothing
  ConApp ms dc (Just e)
    | Val _ v <- e -> Val ms <$> evalConApp dc (Just v)
    | otherwise  -> ConApp ms dc . Just <$> step e
  Record ms flds
    | all (isVal . snd) flds -> do
      td@TypeDecl {tyCon, tyRhs = TRec fs} <- lookupField $ fst $ head flds
      (vs, sus) <- fmap unzip $ forM fs $ \ (f, m, t) -> do
        let Val _ v = fromJust $ lookup f flds
        force v t $ \v -> do
          su <- unify t (typeOf v)
          i <- fresh
          writeStore i (m,v)
          return ((f,i),su)
      let t = subst (mconcat sus) $ typeDeclType td
      return . Val ms $ VR vs t
    | otherwise -> do
      td@TypeDecl {tyCon, tyRhs = TRec fs} <- lookupField $ fst $ head flds
      unless (all (`elem` map fst3 fs) (map fst flds)) $
        typeError $ printf "invalid fields for type %s: %s" tyCon (show $ pretty expr)
      unless (all (`elem` map fst flds) (map fst3 fs)) $
        typeError $ printf "missing fields for type %s: %s" tyCon (show $ pretty expr)
      let (fs, es) = unzip flds
      stepOne es
        (error "step.Record: impossible")
        (\es -> return $ Record ms $ zip fs es)
  Field ms e f
    | Val _ v <- e -> Val ms <$> getField v f
  SetField ms r f e -> stepOne [r,e]
                      (\[Val _ vr, Val _ ve] -> setField vr f ve >> return (Val ms VU))
                      (\[r,e] -> return $ SetField ms r f e)
  Array ms [] -> return $ Val ms (VV Vector.empty (TVar "a"))
  Array ms es -> stepOne es
                (\(map unVal -> (v:vs)) -> do
                    mapM_ (unify (typeOf v) . typeOf) vs
                    return (Val ms (VV (Vector.fromList (v:vs)) (typeOf v))))
                (\es -> return $ Array ms es)
  Try ms e alts
    | isVal e   -> return e
    | otherwise -> do
        env <- gets stVarEnv
        (\e -> Try ms e alts) <$> step e `catchError` \e -> do
          setVarEnv env
          case e of
            MLException ex -> stepAlts (Val ms ex) alts
            _              -> Val ms <$> maybeThrow e
  Prim1 ms p@(P1 x f t) e
    | Val _ v <- e -> fmap (Val ms) . force v t $ \v -> f v
    | otherwise  -> Prim1 ms p <$> step e
  Prim2 ms p@(P2 x f t1 t2) e1 e2 ->
    stepOne [e1,e2]
      (\[Val _ v1, Val _ v2] -> fmap (Val ms) . forces [(v1,t1),(v2,t2)] $ \[v1,v2] -> f v1 v2)
      (\[e1,e2] -> return (Prim2 ms p e1 e2))
  _ -> error (show expr)

stepApp :: MonadEval m => MSrcSpan -> Expr -> [Expr] -> m Expr
stepApp ms (Val _ f) es = case f of
  VF (Func x env)
    | (ps, e, env) <- gatherLams f -> do
        let (vs, es') = splitAt (length ps) es
        traceShowM (map pretty ps, pretty e)
        traceShowM (map unVal vs, map unVal es')
        Just pat_env <- mconcat <$> zipWithM matchPat (map unVal vs) ps
        -- pushEnv env
        -- pushEnv pat_env
        Replace env . With pat_env <$> case es' of
          [] -> traceShowM (pretty e) >> return (onSrcSpanExpr (<|> ms) e)
          _  -> return $ App ms e es'
  _ -> typeError $ printf "'%s' is not a function" (show f)
stepApp _ f es = error (show (f:es))

-- stepApp (Val f) (map unVal -> vs) = do
--   let (ps, e, env) = gatherLams f
--   let (hd, tl) = splitAt (length ps) vs
--   Just pat_env <- mconcat <$> zipWithM matchPat hd ps
--   case tl of
--           -- this doesn't seem right..
--     [] -> return e -- step e `withExtendedEnv` joinEnv pat_env env
--     --vs -> 

--stepBop :: MonadEval m => Bop -> Expr -> Expr -> m Expr
stepBop ms bop (Val _ v1) (Val _ v2) = Val ms <$> evalBop bop v1 v2

--stepUop :: MonadEval m => Uop -> Expr -> m Expr
stepUop ms uop (Val _ v) = Val ms <$> evalUop uop v

stepAlts :: MonadEval m => Expr -> [Alt] -> m Expr
stepAlts _ []
  = fmap (Val Nothing) . maybeThrow $ MLException (mkExn "Match_failure" [])
stepAlts (Val ms v) ((p,g,e):as)
  = matchPat v p >>= \case
      Nothing  -> stepAlts (Val ms v) as
      Just bnd -> do newenv <- joinEnv bnd <$> gets stVarEnv
                     case g of
                      Nothing -> return $ With bnd e
                      Just g  ->
                        eval g `withExtendedEnv` newenv >>= \case
                          VB True  -> return $ With bnd e
                          VB False -> stepAlts (Val ms v) as

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
isVal (Val _ _)    = True
isVal _          = False

unVal :: Expr -> Value
unVal (Val _ v) = v

spanVals :: [Expr] -> ([Value],[Expr])
spanVals xs = let (vs,es) = span isVal xs
              in (map unVal vs, es)

gatherLams :: Value -> ([Pat], Expr, Env)
gatherLams (VF (Func (Lam _ p e) env)) = go [p] e
  where
  go ps (Lam _ p e) = go (p:ps) e
  go ps e           = (reverse ps, e, env)

concatMapM :: Monad m => (a -> m [b]) -> [a] -> m [b]
concatMapM f xs = liftM concat (mapM f xs)


addEvent :: MonadEval m => Expr -> m ()
addEvent expr
  | Just loc <- getSrcSpanMaybe expr
  , interesting expr = do
  let line = srcSpanStartLine loc
  let column = srcSpanStartCol loc
  let expr_width = srcSpanWidth loc
  let event = "step_line"
  let stdout = ""
  let func_name = "<top-level>"
  Env env <- gets stVarEnv
  let Env benv = baseEnv
  let env' = Map.difference env benv
  let ordered_globals = map fst $ Map.toList env'
  let globals = env'
  let heap = IntMap.empty
  let stack = []
  let evt = Event { evt_ordered_globals = ordered_globals
                  , evt_stdout = stdout
                  , evt_func_name = func_name
                  , evt_stack_to_render = stack
                  , evt_globals = globals
                  , evt_heap = heap
                  , evt_line = line
                  , evt_column = column - 1
                  , evt_expr_width = expr_width
                  , evt_event = event
                  , evt_expr = expr
                  }
  modify' $ \s -> s { stTrace = stTrace s Seq.|> evt }
addEvent _ = return ()

addReturn :: MonadEval m => Expr -> m ()
addReturn expr
  | Just loc <- getSrcSpanMaybe expr = do
--  traceShowM $ pretty expr
  let line = srcSpanStartLine loc
  let column = srcSpanStartCol loc
  let expr_width = srcSpanWidth loc
  let event = "return"
  let stdout = ""
  let func_name = "<top-level>"
  Env env <- gets stVarEnv
  let Env benv = baseEnv
  let env' = Map.difference env benv
  let ordered_globals = map fst $ Map.toList env'
  let globals = Map.insert "__return__" (unVal expr) env'
  let heap = IntMap.empty
  let stack = []
  let evt = Event { evt_ordered_globals = ordered_globals
                  , evt_stdout = stdout
                  , evt_func_name = func_name
                  , evt_stack_to_render = stack
                  , evt_globals = globals
                  , evt_heap = heap
                  , evt_line = line
                  , evt_column = column - 1
                  , evt_expr_width = expr_width
                  , evt_event = event
                  , evt_expr = expr
                  }
  modify' $ \s -> s { stTrace = stTrace s Seq.|> evt }
addReturn _ = return ()

interesting expr = case expr of
  Val {} -> False
  Var {} -> False
  _      -> True

instance Aeson.ToJSON Event where
  toJSON Event {..} = Aeson.object
    [ "ordered_globals" Aeson..= Aeson.toJSON evt_ordered_globals
    , "stdout"          Aeson..= Aeson.toJSON evt_stdout
    , "func_name"       Aeson..= Aeson.toJSON evt_func_name
    , "stack_to_render" Aeson..= Aeson.toJSON evt_stack_to_render
    , "globals"         Aeson..= Aeson.toJSON evt_globals
    , "heap"            Aeson..= Aeson.toJSON evt_heap
    , "line"            Aeson..= Aeson.toJSON evt_line
    , "column"          Aeson..= Aeson.toJSON evt_column
    , "expr_width"      Aeson..= Aeson.toJSON evt_expr_width
    , "event"           Aeson..= Aeson.toJSON evt_event
    , "expr"            Aeson..= Aeson.toJSON (show (pretty evt_expr))
    ]

instance Aeson.ToJSON Scope where
  toJSON _ = Aeson.object []

instance Aeson.ToJSON Value where
  toJSON (VI i) = Aeson.toJSON i
  toJSON (VD d) = Aeson.toJSON d
  toJSON (VB b) = Aeson.toJSON b
  toJSON (VC c) = Aeson.toJSON c
  toJSON (VS s) = Aeson.toJSON s
  toJSON _      = Aeson.toJSON ("<<unknown>>" :: String)
