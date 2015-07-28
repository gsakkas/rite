{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NamedFieldPuns   #-}
{-# LANGUAGE BangPatterns     #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase       #-}
{-# LANGUAGE ViewPatterns     #-}
module NanoML.Step where

import Control.Applicative
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

writeTrace :: String -> Seq.Seq Event -> IO ()
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
  (Left e, st, _)  -> traceShow e $ stTrace st
  (Right v, st, _) -> stTrace st

stepAll expr = do
  --traceShowM $ pretty expr
  expr' <- step expr
  if isVal expr'
     then return expr'
     else stepAll expr'

stepAllProg [] = return ()
stepAllProg (d:p) = do
--  traceShowM $ pretty d
  md <- stepDecl d `catchError` \e -> addUncaughtException e >> throwError e
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
    r <- stepOne es
         (\vs -> Nothing <$ (setVarEnv =<< evalNonRecBinds (zip ps vs)))
         (\es -> return . Just $ DFun ss NonRec (zip ps es))
    gcScopes r
    return r
  DEvl ss expr
    | isVal expr -> return Nothing
    | otherwise  -> do
        e <- step expr
        env <- gets stVarEnv
        -- traceShowM (pretty expr)
        -- traceShowM (pretty e)
        -- traceShowM expr
        -- traceShowM e
        case exprDiff env expr e of
          Nothing -> return ()
          Just (env, expr, kind) -> addEvent expr kind `withEnv` env
        gcScopes e
        -- traceM ""
        return (Just $ DEvl ss e)
  DTyp _ decls -> mapM_ addType decls >> return Nothing
  DExn _ decl -> extendType "exn" decl >> return Nothing

-- stepNonRecBinds binds = do
--   env <- evalNonRecBinds


step :: MonadEval m => Expr -> m Expr
step expr = case expr of
  Val _ v -> return expr
  With env e -> do
    e' <- step e `withEnv` env
    return $ if isVal e'
             then e'
             else With env e'
  -- Replace env e -> do
  --   e' <- step e `withEnv` env
  --   if isVal e'
  --     then addReturn e' `withEnv` env >> return e'
  --     else return $ Replace env e'
  Replace env (With bnd e) -> do
    e' <- step e `withEnv` bnd
    if isVal e'
      then addReturn e' `withEnv` bnd >> return e'
      else return $ Replace env $ With bnd e'
  Var ms v -> do
    -- addEvent expr
    fmap (Val ms) . lookupEnv v =<< gets stVarEnv
  Lam ms _ _ -> -- addEvent expr >>
    Val ms . VF . Func expr <$> gets stVarEnv
  App ms f args -> stepOne (f:args)
                  (\(f:args) -> -- addEvent expr >> 
                                stepApp ms f args)
                  (\(f:args) -> return $ App ms f args)
  Bop ms b e1 e2 -> stepOne [e1,e2]
                   (\[v1,v2] -> -- addEvent expr >> 
                                stepBop ms b v1 v2)
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
    stepOne es
      (\vs -> do env <- evalNonRecBinds (zip ps vs)
                 return $ With env body
      )
      (\es -> return $ Let ms NonRec (zip ps es) body)
  Ite ms b t f
    | Val _ b <- b
      -> -- addEvent expr >>
      case b of
          VB True  -> return t
          VB False -> return f
    | otherwise
      -> do b <- step b
            return $ Ite ms b t f
  Seq ms e1 e2
    | isVal e1  -> -- addEvent expr >>
      return e2
    | otherwise -> (\e1 -> Seq ms e1 e2) <$> step e1
  Case ms e as
    | isVal e   -> -- addEvent expr >> 
      stepAlts e as
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
        otherError $ printf "invalid fields for type %s: %s" tyCon (show $ pretty expr)
      unless (all (`elem` map fst flds) (map fst3 fs)) $
        otherError $ printf "missing fields for type %s: %s" tyCon (show $ pretty expr)
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
        -- traceShowM (map pretty ps, pretty e)
        -- traceShowM (map unVal vs, map unVal es')
        Just pat_env <- mconcat <$> zipWithM matchPat (map unVal vs) ps
        -- pushEnv env
        -- pushEnv pat_env
        nenv <- allocEnvWith ("app:" ++ show (srcSpanStartLine $ fromJust ms)) env pat_env
        let with = With nenv
        Replace env . with <$> case es' of
          [] -> addCall e `withEnv` nenv >> return (onSrcSpanExpr (<|> ms) e)
          _  -> return $ App ms e es'
  _ -> otherError $ printf "'%s' is not a function" (show f)
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
      Just bnd -> do bnd <- allocEnv ("match:" ++ show (srcSpanStartLine $ fromJust ms)) bnd
                     case g of
                      Nothing -> return $ With bnd e
                      Just g  -> do
                        eval g `withEnv` bnd >>= \case
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


addEvent :: MonadEval m => Expr -> Kind -> m ()
addEvent (With env expr) k = addEvent expr k `withEnv` env
addEvent (Replace env expr) k = addEvent expr k `withEnv` env
addEvent expr k
  | Just loc <- getSrcSpanMaybe expr
  , interesting expr || k == Return = do
  let line = srcSpanStartLine loc
  let column = srcSpanStartCol loc
  let expr_width = srcSpanWidth loc
  let event = showKind k
  let stdout = ""
  let func_name = "<top-level>"
  id <- envId <$> gets stVarEnv
  traceShowM (k, id, expr)
  let insertReturn 
        | Return <- k = insertEnv "__return__" (unVal expr)
        | otherwise   = \x -> x
  envs <- IntMap.elems . IntMap.delete 0 . IntMap.adjust insertReturn id <$> gets stEnvMap
--  let Env benv = baseEnv
  -- traceShowM (pretty expr, length envs)
  let genv = [] -- envEnv $ last envs
  let ordered_globals = reverse $ map fst genv
  let globals = Map.fromList genv
  let heap = IntMap.empty
  let stack = mkStack id envs -- (init envs)
  -- traceShowM stack
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
                  , evt_exception_msg = ""
                  , evt_expr = expr
                  }
  modify' $ \s -> s { stTrace = stTrace s Seq.|> evt }
addEvent _ _ = return ()

addUncaughtException :: MonadEval m => NanoError -> m ()
addUncaughtException exn = do
  last_evt <- gets (last . toList . stTrace)
  let evt = last_evt { evt_event = "uncaught_exception"
                     , evt_exception_msg = show (pretty exn)
                     }
  modify' $ \s -> s { stTrace = stTrace s Seq.|> evt }

addCall :: MonadEval m => Expr -> m ()
-- addCall expr
--   | Just loc <- getSrcSpanMaybe expr = do
--   -- traceShowM $ pretty expr
--   let line = srcSpanStartLine loc
--   let column = srcSpanStartCol loc
--   let expr_width = srcSpanWidth loc
--   let event = "call"
--   let stdout = ""
--   let func_name = "<top-level>"
--   id <- envId <$> gets stVarEnv
--   envs <- IntMap.elems . IntMap.delete 0 <$> gets stEnvMap
-- --  let Env benv = baseEnv
--   -- traceShowM ("call", pretty expr, length envs)
--   let genv = [] -- envEnv $ last envs
--   let ordered_globals = reverse $ map fst genv
--   let globals = Map.fromList genv
--   let heap = IntMap.empty
--   let stack = mkStack id envs -- (init envs)
--   -- traceShowM ("call", stack)

--   let evt = Event { evt_ordered_globals = ordered_globals
--                   , evt_stdout = stdout
--                   , evt_func_name = func_name
--                   , evt_stack_to_render = stack
--                   , evt_globals = globals
--                   , evt_heap = heap
--                   , evt_line = line
--                   , evt_column = column - 1
--                   , evt_expr_width = expr_width
--                   , evt_event = event
--                   , evt_expr = expr
--                   }
--   modify' $ \s -> s { stTrace = stTrace s Seq.|> evt }
addCall _ = return ()

addReturn :: MonadEval m => Expr -> m ()
-- addReturn expr
--   | Just loc <- getSrcSpanMaybe expr = do
--   -- traceShowM $ pretty expr
--   let line = srcSpanStartLine loc
--   let column = srcSpanStartCol loc
--   let expr_width = srcSpanWidth loc
--   let event = "return"
--   let stdout = ""
--   let func_name = "<top-level>"
--   id <- envId <$> gets stVarEnv
--   envs <- IntMap.elems . IntMap.delete 0 . IntMap.adjust (insertEnv "__return__" (unVal expr)) id <$> gets stEnvMap
--   -- traceShowM (id, map envId envs)
-- --  let Env benv = baseEnv
--   -- traceShowM ("return", pretty expr, length envs)
--   let genv = [] -- envEnv $ last envs
--   let ordered_globals = reverse $ map fst genv
--   let globals = Map.fromList genv
--   let heap = IntMap.empty
--   let stack = mkStack id envs -- (init envs)
--   -- traceShowM stack

--   let evt = Event { evt_ordered_globals = ordered_globals
--                   , evt_stdout = stdout
--                   , evt_func_name = func_name
--                   , evt_stack_to_render = stack
--                   , evt_globals = globals
--                   , evt_heap = heap
--                   , evt_line = line
--                   , evt_column = column - 1
--                   , evt_expr_width = expr_width
--                   , evt_event = event
--                   , evt_expr = expr
--                   }
--   modify' $ \s -> s { stTrace = stTrace s Seq.|> evt }
addReturn _ = return ()

mkStack :: Ref -> [Env] -> [Scope]
mkStack id env = markParents (map (mkScope id) env)
  -- s : ss -> s { scp_is_highlighted = True } : ss
  -- ss -> ss

mkScope :: Ref -> Env -> Scope
mkScope id e = Scope
  { scp_frame_id = envId e
  , scp_encoded_locals = Map.fromList $ envEnv e
  , scp_is_highlighted = envId e == id
  , scp_is_parent = False
  , scp_func_name = envName e
  , scp_is_zombie = False
  , scp_parent_frame_id_list = maybe [] (\p -> [envId p] \\ [0]) (envParent e) -- (\\[0]) . map envId . tail $ toListEnv e
  , scp_unique_hash = mkHash e
  , scp_ordered_varnames = reverse $ map fst (envEnv e)
  }

mkHash :: Env -> String
mkHash e = envName e ++ "_f" ++ show (envId e)

markParents :: [Scope] -> [Scope]
markParents []     = []
markParents (s:ss) = s' : ss'
  where
  ss' = markParents ss
  s'  = if any (\p -> scp_frame_id s `elem` scp_parent_frame_id_list p) ss'
        then s { scp_is_parent = True, scp_unique_hash = scp_unique_hash s ++ "_p" }
        else s

gcScopes :: (MonadEval m, CollectEnvIds a) => a -> m ()
gcScopes expr = do
  let ids = collectEnvIds expr
  envMap <- gets stEnvMap
  modify' $ \s -> s { stEnvMap = IntMap.filterWithKey (\k _ -> k `elem` ids) (stEnvMap s) }

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
    , "exception_msg"   Aeson..= Aeson.toJSON evt_exception_msg
    , "expr"            Aeson..= Aeson.toJSON (show (pretty evt_expr))
    ]

instance Aeson.ToJSON Scope where
  toJSON Scope {..} = Aeson.object
    [ "frame_id"        Aeson..= Aeson.toJSON scp_frame_id
    , "encoded_locals"  Aeson..= Aeson.toJSON scp_encoded_locals
    , "is_highlighted"  Aeson..= Aeson.toJSON scp_is_highlighted
    , "is_parent"       Aeson..= Aeson.toJSON scp_is_parent
    , "func_name"       Aeson..= Aeson.toJSON scp_func_name
    , "is_zombie"       Aeson..= Aeson.toJSON scp_is_zombie
    , "parent_frame_id_list" Aeson..= Aeson.toJSON scp_parent_frame_id_list
    , "unique_hash"     Aeson..= Aeson.toJSON scp_unique_hash
    , "ordered_varnames" Aeson..= Aeson.toJSON scp_ordered_varnames
    ]

instance Aeson.ToJSON Value where
  toJSON (VI i) = Aeson.toJSON i
  toJSON (VD d) = Aeson.toJSON d
  toJSON (VB b) = Aeson.toJSON b
  toJSON (VC c) = Aeson.toJSON c
  toJSON (VS s) = Aeson.toJSON s
  toJSON _      = Aeson.toJSON ("<<unknown>>" :: String)
