{-# LANGUAGE TupleSections #-}
{-# LANGUAGE ImplicitParams #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NamedFieldPuns   #-}
{-# LANGUAGE BangPatterns     #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase       #-}
{-# LANGUAGE ViewPatterns     #-}
module NanoML.Step where

import Prelude hiding (read)

import Control.Applicative
import Control.Arrow
import Control.Exception
import Control.Monad.Except
import Control.Monad.Reader
import Control.Monad.State
import qualified Data.Aeson as Aeson
import qualified Data.ByteString.Lazy as LBS
import qualified Data.Graph.Inductive.Dot as Graph
import qualified Data.Graph.Inductive.Graph as Graph
import qualified Data.Graph.Inductive.NodeMap as Graph
import qualified Data.Graph.Inductive.PatriciaTree as Graph
import Data.List
import Data.Foldable
import qualified Data.IntMap as IntMap
import qualified Data.Map as Map
import Data.Maybe hiding (fromJust)
import Data.Monoid hiding (Alt)
import qualified Data.Sequence as Seq
import qualified Data.Vector as Vector
import System.Mem.StableName
import Text.Printf
import GHC.Stack

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
  (Left e, st, _)  -> -- traceShow e $
                      stTrace st
  (Right v, st, _) -> stTrace st

-- checkProg :: String -> IO [[Expr]]
-- checkProg s = do
--   let Right p = parseTopForm s
--   let (r, st, _) = runEvalFull stdOpts (stepAllProg =<< mapM refreshDecl p)
--   -- print r
--   case r of
--     Right _ -> return []
--     Left e -> makePaths st

-- makePaths st = do
--       gr <- buildGraph (stEdges st)
--       paths <- mkPaths st
--       return [ [ fromJust (Graph.lab gr n) | n <- path ] | path <- paths ]

renderPath :: [Expr] -> Doc Annot
renderPath xs = vsep (intersperse (text "  ==>") (pairwiseNub $ map pretty xs))

----------------------------------------------------------------------
-- Working with the reduction graph
----------------------------------------------------------------------

type Graph = Graph.Gr Node EdgeKind
-- type Node  = Graph.LNode Expr
-- type Edge  = Graph.LEdge EdgeKind

runGraph opts x = case runEvalFull opts x of
  (Left e, st, _)  -> Left (e, stTrace st, stEdges st, stCurrentExpr st)
  (Right v, st, _) -> Right (stEdges st)

-- mkPaths st = do
--   let expr = stCurrentExpr st
--   let edges = stEdges st
--   gr <- buildGraph edges
--   root <- findRoot gr expr

--   let check v t =
--         case runEval stdOpts (put st >> unify (typeOf v) t) of
--           Left _ -> False
--           Right _ -> True

--   let checkpoly vts =
--         case runEval stdOpts (put st >> foldM (\su (v,t) -> (su++) <$> unify (typeOf v) (subst su t)) [] vts) of
--           Left _ -> False
--           Right _ -> True

--   -- with a single subterm we always prioritize it over the parent
--   let checkOne x = findRoot gr x >>= \xn -> return [mkPath gr xn, mkPath gr root]

--   -- otherwise we order as follows
--   -- 1. subterms that don't unify on their own
--   -- 2. subterms that constribute to inconsistent instantiation of tyvars
--   --    e.g. in `1 :: [true]` we would have `a ~ int` and `a ~ bool`
--   -- 3. the parent term
--   -- 4. subterms that unify
--   let checkMany xts = do
--         let bad  = filter (not . uncurry check) xts
--         let poly = let grps = Map.elems $ Map.fromListWith (++) $
--                               concatMap (\(x,t) -> map (,[(x,t)]) (freeTyVars t)) xts
--                    in concat $ filter (not . checkpoly) grps
--         ns <- mapM (findRoot gr) (nub $ map fst bad ++ map fst poly ++ [expr] ++ map fst xts)
--         return $ map (mkPath gr) ns

--   case expr of
--     Uop _ u x -> checkOne x
--     Bop _ b x y -> checkMany [(x, typeOfBop b), (y, typeOfBop b)]
--     ConApp _ c (Just x) _
--       -> let ts = dArgs $ stDataEnv st Map.! c
--          in case (x, ts) of
--               (_, [t]) -> checkOne x
--               (VT _ vs, _) -> checkMany $ zip vs ts
--     Record _ fs _
--       -> let TRec fts = tyRhs $ stFieldEnv st Map.! fst (head fs)
--          in checkMany [ (fromJust $ lookup f fs, t) | (f, _, t) <- fts ]
--     Case _ x as -> checkOne x
--     App ms (Var _ v) xs
--       | Just f <- lookupEnv v (stVarEnv st)
--       -> undefined
--     App _ (Prim1 _ p@(P1 _ f t)) [x] -> checkOne x
--     App _ (Prim2 _ p@(P2 _ f tx ty)) [x,y] -> checkMany [(x, tx), (y, ty)]
--     _ -> error $ "mkPaths impossible: " ++ show expr


buildGraph :: [(Node, EdgeKind, Node)] -> Graph.Gr Node EdgeKind
buildGraph tr = fst $ Graph.mkMapGraph (nub nodes) (nub edges)
  where
  nodes = concatMap (\(e1,_,e2) -> [e1,e2]) tr
  edges = map (\(e1,l,e2) -> (e1,e2,l)) tr

-- buildGraph tr = do
--   nodes <- concatMapM mkNode tr
-- --  print (length nodes, length (nub nodes))
--   edges <- mapM mkEdge tr
--   return $ Graph.mkGraph (nub nodes) (nub edges)
--   where
--   mkNode (x, k, y) = do
--     xn <- makeStableName =<< evaluate x
--     yn <- makeStableName =<< evaluate y
--     return [(hashStableName xn, x), (hashStableName yn, y)]
--   mkEdge (x, k, y) = do
--     xn <- makeStableName =<< evaluate x
--     yn <- makeStableName =<< evaluate y
--     return (hashStableName xn, hashStableName yn, k)

-- findRoot :: (?callStack :: CallStack) => Graph -> Expr -> IO
  -- Graph.Node
findRoot :: (?callStack :: CallStack) => Graph -> Node -> Graph.Node
findRoot gr e = case lookup e . map (\(a,b) -> (b,a)) $ Graph.labNodes gr of
  Just n -> n
  Nothing -> trace (printf "findRoot: couldn't find: %s" (show e)) 0
-- findRoot gr e = do
--   en <- makeStableName =<< evaluate e
--   let p (n,x) = do xn <- makeStableName =<< evaluate x
--                    return (xn == en)
--   fst . fromJust <$> findM p (Graph.labNodes gr)

-- addEnvs :: [(Expr, Env)] -> Graph -> IO Graph
-- addEnvs st gr = do
--   envs <- fmap IntMap.fromList $ forM (stExprEnvs st) $ \(x,e) -> do
--     xn <- makeStableName =<< evaluate x
--     return (hashStableName xn, e)
--   return $ Graph.gmap (\(i,n,l,o) ->
--       (i, n, (l, addFreeVars st l <$> IntMap.lookup n envs), o))
--     gr

-- addFreeVars :: Expr -> Env -> [(Var,Value)]
addFreeVars st x e = nub $ map (second (render . pretty . fillHoles st)) $ freeVars x e

isStepsTo (StepsTo {}) = True
isStepsTo _            = False

isSubTerm (SubTerm {}) = True
isSubTerm _            = False

-- | Follow the 'StepsTo' relation forward once from a node.
forwardstep :: Graph -> Graph.Node -> Maybe Graph.Node
forwardstep gr n = case find (isStepsTo . snd) $ Graph.lsuc gr n of
  Nothing      -> Nothing
  Just (n', _) -> Just n'

backwardstep :: Graph.Gr a EdgeKind -> Graph.Node -> Maybe Graph.Node
backwardstep gr n = case find (isStepsTo . snd) $ Graph.lpre gr n of
  Nothing      -> Nothing
  Just (n', _) -> Just n'

-- | Follow the 'StepsTo' relation as far back as possible from a node.
backjump :: Graph -> Graph.Node -> Maybe Graph.Node
backjump gr n = case find (isStepsTo . snd) $ Graph.lpre gr n of
  Nothing -> Nothing
  Just (n', StepsTo k)
    | k == CallStep -> Just n'
    | otherwise     -> backjump gr n' <|> Just n'

forwardjump :: Graph -> Graph.Node -> Maybe Graph.Node
forwardjump gr n = case find (isStepsTo . snd) $ Graph.lsuc gr n of
  Nothing -> Nothing
  Just (n', StepsTo k)
      -- TODO: is this right??
    | k == CallStep -> Just n'
    | otherwise     -> forwardjump gr n' <|> Just n'

backback :: Graph.Gr a EdgeKind -> Graph.Node -> Graph.Node
backback gr n = case backwardstep gr n of
  Nothing -> n
  Just n' -> backback gr n'

forwardforward :: Graph -> Graph.Node -> Graph.Node
forwardforward gr n = case forwardstep gr n of
  Nothing -> n
  Just n' -> forwardforward gr n'

-- | Find the 'SubTerm's of a node.
subterms :: Graph -> Graph.Node -> [Graph.Node]
subterms gr n = map fst . filter (isSubTerm . snd) $ Graph.lsuc gr n

ancestor :: Graph -> Graph.Node -> Graph.Node
ancestor gr n = case find (isSubTerm . snd) (Graph.lpre gr n) of
  Nothing -> n
  Just (n', _) -> ancestor gr n'

candidates :: Graph -> Graph.Node -> [Graph.Node]
candidates gr n = maybeToList (forwardstep gr n)
               ++ mapMaybe (backjump gr) (subterms gr n)

bfs :: Graph -> Graph.Node -> [Graph.Node]
bfs gr n = go [n]
  where
  go []     = []
  go (x:xs) = x : go (xs ++ candidates gr x)

  -- next ++ concatMap (bfs gr) next -- FIXME: this doesn't look right..
  -- where next = candidates gr n

dfs :: Graph -> Graph.Node -> [Graph.Node]
dfs gr n = n : concatMap (dfs gr) (candidates gr n)

search :: Graph -> Graph.Node -> SrcSpan
       -> (Graph -> Graph.Node -> [Graph.Node])
       -> [Graph.Node]
search gr root target strat =
  case span notTarget walk of
    (xs, t:_) -> xs ++ [t]
  where
  walk = strat gr root
  notTarget n = case getSrcSpanMaybe . fst . fromJust $ Graph.lab gr n of
    Nothing -> True
    Just ss -> ss /= target

-- | Compute all "interesting" paths involving a term.
--
-- 1. The 'StepsTo' path that leads to the term itself.
-- 2. The 'StepsTo' paths that lead to the term's immediate subterms.
paths :: Graph -> Graph.Node -> [Graph.Path]
paths gr root = map (mkPath gr) (root : subterms gr root)

mkPath gr n = go (backjump gr n) (maybe [n] (const []) (backjump gr n))
  where
  go Nothing  p = p
  go (Just n) p = go (forwardstep gr n) (p ++ [n])

----------------------------------------------------------------------
-- Stepping
----------------------------------------------------------------------
transStep expr' = do
  modify' $ \s -> s { stEdges = mempty }
  expr <- refreshExpr expr'
  env <- gets stVarEnv
  setEntry (expr, env)
  stepAll expr

stepAll expr = do
  -- traceShowM $ pretty expr
  modify' (\s -> s { stStepKind = BoringStep })
  expr' <- step expr
  modify' $ \s -> s { stSteps = stSteps s + 1 }
  ss <- gets stSteps
  maxss <- asks maxSteps
  when (ss >= maxss) $
    throwError (TimeoutError ss)
  if isValue expr'
     then return expr'
     else stepAll expr'

stepAllProg [d]   = transStepDecl d
stepAllProg (d:p) = transStepDecl d >> stepAllProg p

setEntry e = modify' $ \s -> s { stRoot = e }

transStepDecl d = modify' (\s -> s { stEdges = mempty }) >> refreshDecl d >>= \case
  DEvl _ expr
    -> transStep expr
  DFun _ Rec binds
    -> do env <- matchRecBinds binds
          setVarEnv env
          return . snd . last . envEnv $ env
  DFun _ NonRec binds
    -> do let (ps, es) = unzip binds
          vs <- mapM transStep es
          setVarEnv =<< matchNonRecBinds (zip ps vs)
          return (last vs)
  DTyp _ decls
    -> mapM_ addType decls >> mkFakeStep
  DExn _ decl
    -> extendType "exn" decl >> mkFakeStep

mkFakeStep :: MonadEval m => m Value
mkFakeStep = do
  x <- gets stRoot
  build (fst x) $ return (VU Nothing)

-- transStepDecl d = do
--   -- traceShowM $ pretty d
--   modify' (\s -> s { stStepKind = BoringStep })
--   md <- stepDecl d `catchError` \e -> addUncaughtException e >> throwError e
--   modify' $ \s -> s { stSteps = stSteps s + 1 }
--   ss <- gets stSteps
--   maxss <- asks maxSteps
--   -- traceShowM (ss, maxss)
--   when (ss >= maxss) $
--     throwError TimeoutError
--   case md of
--     Nothing
--       -> gets stCurrentExpr
--     Just d@(DEvl _ v)
--       | isValue v -> return v
--       | otherwise -> transStepDecl d
--     Just d
--       -> transStepDecl d

-- stepDecl :: MonadEval m => Decl -> m (Maybe Decl)
-- stepDecl decl = case decl of
--   DFun ss Rec    binds -> do
--     setVarEnv =<< matchRecBinds binds
--     return Nothing
--   DFun ss NonRec binds -> do
--     let (ps, es) = unzip binds
--     r <- stepOne es
--          (\vs -> do modify' (\s -> s { stCurrentExpr = head vs })
--                     Nothing <$ (setVarEnv =<< matchNonRecBinds (zip ps vs)))
--          (\es -> return . Just $ DFun ss NonRec (zip ps es))
--     gcScopes r
--     return r
--   DEvl ss expr
--     | isValue expr -> modify' (\s -> s { stCurrentExpr = expr }) >> return (Just (DEvl ss expr))
--     | otherwise    -> do
--         e <- step expr
--         env <- gets stVarEnv
--         -- addEdge StepsTo expr e
--         -- -- traceShowM (pretty expr)
--         -- -- traceShowM (pretty e)
--         -- -- traceShowM expr
--         -- -- traceShowM e
--         -- -- addEdge StepsTo expr e
--         -- case exprDiff env expr e of
--         --   Nothing -> traceShowM "no diff" >> traceShowM (pretty expr) >> traceShowM (pretty e) >> traceShowM ""
--         --   Just (env, before, after, kind) -> do
--         --     traceShowM (pretty before)
--         --     traceShowM (pretty after)
--         --     traceShowM ""
--         --     addEvent before after kind (getSrcSpanExprMaybe expr) `withEnv` env
--         --     unless (kind == Return) $ addEdge StepsTo before after
--         --     -- TODO: need to add StepsTo edges for all sub-terms along the path to the changed term
--         --     -- see, e.g., the `1 + 2` sub-term in evaluation of `1 + 2 + 3`
--         gcScopes e
--         -- traceM ""
--         return (Just $ DEvl ss e)
--   DTyp _ decls -> mapM_ addType decls >> return Nothing
--   DExn _ decl -> extendType "exn" decl >> return Nothing

-- stepNonRecBinds binds = do
--   env <- evalNonRecBinds

build :: MonadEval m => Expr -> m Expr -> m Expr
build before mkAfter = do
  env1 <- gets stVarEnv
  (did_throw, after) <- (fmap (False,) mkAfter) `catchError` onlyMLExn
  env2 <- gets stVarEnv
  -- addEvent before after StepLine (getSrcSpanExprMaybe before) -- kind (getSrcSpanExprMaybe expr) `withEnv` env
  sk <- gets stStepKind
  addEdge (StepsTo sk) (before,env1) (after,env2)
  addSubTerms after
  if did_throw
    then throwError (MLException after)
    else return after

onlyMLExn (MLException e) = return (True, e)
onlyMLExn e = throwError e

matchRecBinds :: MonadEval m => [(Pat,Value)] -> m Env
matchRecBinds binds = do
  penv <- gets stVarEnv
  mfix $ \fenv -> do
    -- setVarEnv fenv
    unless (all (\(p,v) -> -- isFunPat p ||
                           isFun v) binds) $
      otherError "'let rec' must only bind functions"
    binds' <- forM binds $ \(p,Lam ms p1 e _) -> return (p,Lam ms p1 e (Just fenv))
    bnd <- matchBinds binds'
    allocEnvWith "let-rec" penv bnd

isFun (Lam {}) = True
isFun _        = False

matchNonRecBinds :: MonadEval m => [(Pat,Value)] -> m Env
matchNonRecBinds binds = do
  bnd <- matchBinds binds
  allocEnv "let" bnd

matchBinds :: MonadEval m => [(Pat,Value)] -> m [(Var,Value)]
matchBinds binds = concatMapM matchBind binds

-- | @matchBind (p,e) env@ returns the environment matched by @p@
matchBind :: MonadEval m => (Pat,Value) -> m [(Var,Value)]
matchBind (p,v) = do
  matchPat v p >>= \case
    Nothing  -> withCurrentProvM $ \prv -> throwError $ MLException (mkExn "Match_failure" [] prv)
    Just env -> return env

unshadow :: MonadEval m => Expr -> Env -> m (Env, Expr)
unshadow expr env = do
  (su, expr') <- unshadow' expr env
  let env' = env { envEnv = substEnv su (envEnv env) }
  expr' <- refreshExpr expr' `withEnv` env'
  return (env', expr')
  -- bound <- map fst . concat . map envEnv . tail . toListEnv <$> gets stVarEnv
  -- let su = mapMaybe (`shadows` bound) (map fst $ envEnv env)
  -- expr' <- refreshExpr $ substVars su expr
  -- let env' = env { envEnv = substEnv su (envEnv env) }
  -- traceShowM (envEnv env, envEnv env', pretty expr')
  -- return (env', expr')

unshadow' :: MonadEval m => Expr -> Env -> m ([(Var,Var)], Expr)
unshadow' expr env = do
  bound <- map fst . concatMap envEnv . tail . toListEnv <$> gets stVarEnv
  let su = mapMaybe ((`shadows` bound) . fst) (envEnv env)
  let expr' = substVars su expr
  -- traceShowM (su, pretty expr')
  return (su, expr')

substEnv :: [(Var, Var)] -> [(Var,Value)] -> [(Var,Value)]
substEnv su env = map (first (\v -> fromMaybe v $ lookup v su)) env

substVars :: [(Var, Var)] -> Expr -> Expr
substVars su = go
  where
  su \\ vs = filter (\(v,_) -> v `notElem` vs) su

  go (Var ms v) = Var ms $ fromMaybe v $ lookup v su
  go (Lam ms p e x) = Lam ms p (substVars (su \\ bindersOf p) e) x
  go (App ms f xs) = App ms (go f) (map go xs)
  go (Bop ms b x y) = Bop ms b (go x) (go y)
  go (Uop ms u x) = Uop ms u (go x)
  go (Lit ms l) = Lit ms l
  go (Let ms NonRec bnds body)
    = Let ms NonRec (map (second go) bnds)
                    (substVars (su \\ bindersOfBinds bnds) body)
  go (Let ms Rec bnds body)
    = Let ms Rec (map (second (substVars (su \\ bindersOfBinds bnds))) bnds)
                 (substVars (su \\ bindersOfBinds bnds) body)
  go (Ite ms b t f) = Ite ms (go b) (go t) (go f)
  go (Seq ms x y) = Seq ms (go x) (go y)
  go (Case ms e alts) = Case ms (go e) (map goAlt alts)
  go (Tuple ms xs) = Tuple ms (map go xs)
  go (ConApp ms d me mt) = ConApp ms d (fmap go me) mt
  go (Record ms flds mt) = Record ms (map (second go) flds) mt
  go (Field ms e f) = Field ms (go e) f
  go (SetField ms e f x) = SetField ms (go e) f (go x)
  go (Array ms xs mt) = Array ms (map go xs) mt
  go (List ms xs mt) = List ms (map go xs) mt
  go (Try ms e alts) = Try ms (go e) (map goAlt alts)
  go (Prim1 ms p) = Prim1 ms p
  go (Prim2 ms p) = Prim2 ms p
  go (With ms x e) = With ms x (go e)
  go (Replace ms x e) = Replace ms x (go e)
  go (Hole ms r mt) = Hole ms r mt
  go (Ref r) = Ref r

  goAlt (p, g, e) = let su' = su \\ bindersOf p
                    in (p, fmap (substVars su') g, substVars su' e)

shadows :: Var -> [Var] -> Maybe (Var, Var)
shadows v' vs' =
  if n > 0
  then Just $ (v', v ++ '|' : show n)
  else Nothing
  where
  eqvs = filter ((==v) . dropSuffix) vs'
  n = if null eqvs then 0 :: Int
      else 1 + maximum (map (read . onlySuffix) eqvs)
  v = dropSuffix v'
  vs = map dropSuffix vs'
{-# INLINE shadows #-}

dropSuffix :: Var -> Var
dropSuffix = takeWhile (/='|')
{-# INLINE dropSuffix #-}

onlySuffix :: Var -> Var
onlySuffix v = let sx = dropWhile (/='|') v
               in if null sx then "0" else tail sx
{-# INLINE onlySuffix #-}

step :: MonadEval m => Expr -> m Expr
step expr = withCurrentExpr expr $ build expr $ case expr of
  -- Val _ v -> return expr
  -- With ms env e
  --   | isVal e   -> return e
  --   | otherwise -> do
  --       e' <- step e `withEnv` env
  --       build expr $ With ms env e'
  With ms env e
    | isValue e -> return e
    | otherwise -> do
        e' <- step e `withEnv` env
        return $ With ms env e'
  Replace ms env e
    | isValue e -> return e <* modify' (\s -> s { stStepKind = ReturnStep })
    | otherwise -> do
        e' <- step e `withEnv` env
        return $ Replace ms env e'
        -- build expr $ Replace ms env e'
  Var ms v -> do
    -- addEvent expr
    lookupVar v
  Lam ms p e (Just env) -> return $ Lam ms p e (Just env)
  Lam ms p e Nothing -> Lam ms p e . Just <$> gets stVarEnv
  -- Lam ms _ _ -> withCurrentProvM $ \prv -> -- addEvent expr >>
  --   Val ms . VF prv . Func expr <$> gets stVarEnv
  -- NOTE: special-case `App (Var f) xs` to evaluate `xs` before looking up `f`.
  --       this makes the trace a bit more readable.
  App ms f'@(Var _ v) args -> stepOne args
                  (\args -> do f <- lookupVar v
                               -- env <- gets stVarEnv
                               -- addEdge (StepsTo BoringStep) (f',env) (f,env)
                               -- _ <- build f' $ return f
                               -- traceShowM f
                               stepApp ms f args)
                  (\args -> return $ App ms f' args)
  App ms f args -> stepOne (f:args)
                  (\(f:vs) -> -- addEvent expr >>
                                stepApp ms f vs)
                  (\(f:es) -> return $ App ms f es)
  Bop ms b e1 e2 -> stepOne [e1,e2]
                   (\[v1,v2] -> -- addEvent expr >>
                                stepBop ms b v1 v2)
                   (\[e1,e2] -> return $ Bop ms b e1 e2)
  Uop ms u e
    | isValue e -> stepUop ms u e
    | otherwise -> Uop ms u <$> step e
  Lit ms l -> return $ mkLit ms l
  -- Lit ms l -> build expr
  Let ms Rec binds body -> do
    env <- matchRecBinds binds
    (env', body') <- unshadow body env
    return $ With ms env' body'
    -- let (ps, es) = unzip binds
    -- env <- gets stVarEnv
    -- stepOne es
    --   (\vs -> do fenv <- foldr joinEnv env <$> zipWithM matchPat vs ps
    --              )
    --   (\es -> return $ Let Rec (zip ps es) body)
  Let ms NonRec binds body -> do
    let (ps, es) = unzip binds
    stepOne es
      (\vs -> do env <- matchNonRecBinds (zip ps vs)
                 (env', body') <- unshadow body env
                 return $ With ms env' body'
      )
      (\es -> return $ Let ms NonRec (zip ps es) body)
  Ite ms b t f
    | isValue b
      -> -- addEvent expr >>
      force b tB $ \b -> case b of
          VB _ True  -> return t
          VB _ False -> return f
          -- _ -> typeError (tCon tBOOL) (typeOf b)
    | otherwise
      -> do b <- step b
            return $ Ite ms b t f
  Seq ms e1 e2
    | isValue e1  -> -- addEvent expr >>
      return e2
    | otherwise -> (\e1 -> Seq ms e1 e2) <$> step e1
  Case ms e as
    | isValue e   -> -- addEvent expr >>
        stepAlts (Case ms) e as
    | otherwise -> (\e -> Case ms e as) <$> step e
  Tuple ms es -> stepOne es
                (\vs -> withCurrentProvM $ \prv ->
                  return $ VT prv vs)
                (\es -> return $ Tuple ms es)
  ConApp ms dc Nothing Nothing -> do
    evalConApp dc Nothing
  ConApp ms dc (Just e) Nothing
    | isValue e -> evalConApp dc (Just e)
    | otherwise -> ConApp ms dc . Just <$> step e <*> pure Nothing
  Record ms flds Nothing
    | all (isValue . snd) flds -> do
      td@TypeDecl {tyCon, tyVars, tyRhs = TRec fs} <- lookupField $ fst $ head flds
      su <- fmap Map.fromList $ forM tyVars $ \tv ->
        (tv,) . TVar <$> freshTVar
      vs <- forM fs $ \ (f, m, t) -> do
        let v = fromJust $ lookup f flds
        force v (subst su t) $ \v -> do
          i <- fresh
          writeStore i (m,v)
          return (f, Ref i)
      t <- substM $ mkTApps tyCon (map (subst su . TVar) tyVars)
      withCurrentProv $ \prv -> VR prv vs (Just t)
    | otherwise -> do
      td@TypeDecl {tyCon, tyRhs = TRec fs} <- lookupField $ fst $ head flds
      unless (all (`elem` map fst3 fs) (map fst flds)) $
        otherError $ printf "invalid fields for type %s: %s" tyCon (show $ pretty expr)
      unless (all (`elem` map fst flds) (map fst3 fs)) $
        otherError $ printf "missing fields for type %s: %s" tyCon (show $ pretty expr)
      let (fs, es) = unzip flds
      stepOne es
        (error "step.Record: impossible")
        (\es -> return $ Record ms (zip fs es) Nothing)
  Field ms e f
    | isValue e -> getField e f
    | otherwise -> (\e' -> Field ms e' f) <$> step e
  SetField ms r f e -> stepOne [r,e]
                      (\[vr, ve] -> setField vr f ve >> withCurrentProv VU)
                      (\[r,e] -> return $ SetField ms r f e)
  Array ms [] _ -> withCurrentProvM $ \prv -> do
    a <- freshTVar
    return $ VV prv [] (Just (TVar a))
  Array ms es mt -> stepOne es
                (\(v:vs) -> do
                    vt <- typeOfM v
                    vts <- mapM typeOfM vs
                    mapM_ (unify vt) vts
                    vt' <- substM vt
                    withCurrentProv $ \prv -> VV prv (v:vs) (Just vt'))
                (\es -> return $ Array ms es mt)
  List ms [] _ -> withCurrentProvM $ \prv -> do
    a <- freshTVar
    return $ VL prv [] (Just (TVar a))
  List ms es mt -> stepOne es
                (\(v:vs) -> do
                    vt <- typeOfM v
                    vts <- mapM typeOfM vs
                    mapM_ (unify vt) vts
                    vt' <- substM vt
                    withCurrentProv $ \prv -> VL prv (v:vs) (Just vt'))
                (\es -> return $ List ms es mt)
  Try ms e alts
    | isValue e -> return e
    | otherwise -> do
        env <- gets stVarEnv
        (\e -> Try ms e alts) <$> step e `catchError` \e -> do
          setVarEnv env
          case e of
            MLException ex -> stepAlts (Case ms) ex alts
            _              -> maybeThrow e
  -- Prim1 ms p@(P1 x f t) e
  --   | isValue e -> build expr =<< (force e t $ \v su -> f v)
  --   | otherwise -> build expr =<< Prim1 ms p <$> step e
  -- Prim2 ms p@(P2 x f t1 t2) e1 e2 ->
  --   stepOne [e1,e2]
  --     (\[v1, v2] -> build expr =<< (forces [(v1,t1),(v2,t2)] $ \[v1,v2] su -> f v1 v2))
  --     (\[e1,e2] -> build expr (Prim2 ms p e1 e2))
  _ -> error ("step: " ++ show (pretty expr))

stepApp :: MonadEval m => MSrcSpan -> Value -> [Value] -> m Expr
stepApp ms (With _ env f) es = stepApp ms f es `withEnv` env
stepApp ms (Replace _ env f) es = stepApp ms f es `withEnv` env
stepApp ms f' es = do
 a <- freshTVar
 b <- freshTVar
 force f' (TVar a :-> TVar b) $ \f' -> case f' of
  -- With _ e f -> stepApp ms f es
  -- Replace _ e f -> stepApp ms f es
  -- immediately apply saturated primitve wrappers
  Prim1 ms' (P1 x f' t) -> do
    -- traceShowM (f, es)
    modify' (\s -> s { stStepKind = PrimStep })
    su <- fmap Map.fromList $ forM (freeTyVars t) $ \tv -> (tv,) . TVar <$> freshTVar
    case es of
     [e] -> force e (subst su t) $ \v -> f' v
     e:es -> do x <- force e (subst su t) $ \v -> f' v
                return (App ms x es)
  Prim2 ms' (P2 x f t1 t2) -> do
    modify' (\s -> s { stStepKind = PrimStep })
    su <- fmap Map.fromList $ forM (nub $ freeTyVars t1 ++ freeTyVars t2) $ \tv ->
      (tv,) . TVar <$> freshTVar
    let t1' = subst su t1
        t2' = subst su t2
    case es of
     [e1] -> do env <- gets stVarEnv
                return (Lam ms (VarPat ms "$x") (App ms f' (es ++ [Var ms "$x"])) (Just env))
     [e1,e2] -> forces [(e1,t1'),(e2,t2')] $ \[v1,v2] -> f v1 v2
     e1:e2:es -> do x <- forces [(e1,t1'),(e2,t2')] $ \[v1,v2] -> f v1 v2
                    return (App ms x es)
     -- _ -> do traceShowM (pretty $ App Nothing (Prim2 ms' (P2 x f t1 t2)) es)
     --         undefined
  Lam _ _ _ (Just _) -> do
        let (ps, e, env) = gatherLams f'
            (eps, es', ps') = zipWithLeftover es ps
        -- traceShowM (eps, es', ps')
        -- traceShowM (f,es)
        pat_env' <- mconcat <$> mapM (\(v, p) -> matchPat v p) eps
        pat_env <- maybe (withCurrentProvM $
                           throwError . MLException . mkExn "Match_failure" [])
                          return
                          pat_env'
        -- pat_env <- forM pat_env' $ \(var, val) -> (var,) <$> refreshExpr val
        -- traceShowM pat_env
        -- traceM ""
        -- pushEnv env
        -- pushEnv pat_env
        nenv' <- allocEnvWith ("app:" ++ show (srcSpanStartLine $ fromJust ms)) env pat_env
        -- NOTE: we unshadow wrt to the *surrounding* env, not the
        -- closed-over env
        cenv <- gets stVarEnv
        (su, e') <- unshadow' e cenv
        let nenv = nenv' { envEnv = substEnv su (envEnv nenv') }
        case (ps', es') of
          ([], []) -> do
            modify' (\s -> s { stStepKind = CallStep })
            refreshExpr (Replace ms nenv e')
            -- Replace ms nenv <$> (refreshExpr e' `withEnv` nenv) -- only refresh at saturated applications
          ([], _) -> do
            modify' (\s -> s { stStepKind = CallStep })
            refreshExpr (Replace ms nenv (App ms e' es'))
            -- e'' <- refreshExpr e' `withEnv` nenv
            -- Replace ms nenv <$> addSubTerms (App ms e'' es')
          (_, []) -> mkLamsSubTerms ps' e' >>= \(Lam ms p e _) ->
                       return $ Lam ms p e $ Just nenv -- WRONG?? mkLamsSubTerms ps' e
  _ -> error $ "stepApp: impossible: " ++ show f'
  -- _ -> typeError (TVar "a" :-> TVar "b") (typeOf f') -- otherError $ printf "'%s' is not a function" (show f')
-- stepApp _ f es = error (show (f:es))

mkLamsSubTerms [] e = return e
mkLamsSubTerms (p:ps) e = do
  x <- mkLamsSubTerms ps e
  addSubTerms $ Lam (mergeLocated p x) p x Nothing

zipWithLeftover = go []
  where
  go xys xs     []     = (reverse xys, xs, [])
  go xys []     ys     = (reverse xys, [], ys)
  go xys (x:xs) (y:ys) = go ((x,y):xys) xs ys

-- stepApp (Val f) (map unVal -> vs) = do
--   let (ps, e, env) = gatherLams f
--   let (hd, tl) = splitAt (length ps) vs
--   Just pat_env <- mconcat <$> zipWithM matchPat hd ps
--   case tl of
--           -- this doesn't seem right..
--     [] -> return e -- step e `withExtendedEnv` joinEnv pat_env env
--     --vs ->

--stepBop :: MonadEval m => Bop -> Expr -> Expr -> m Expr
stepBop ms bop v1 v2 = do modify' (\s -> s { stStepKind = PrimStep })
                          evalBop bop v1 v2

--stepUop :: MonadEval m => Uop -> Expr -> m Expr
stepUop ms uop v = do modify' (\s -> s { stStepKind = PrimStep })
                      evalUop uop v

stepAlts :: MonadEval m => (Expr -> [Alt] -> Expr) -> Expr -> [Alt] -> m Expr
stepAlts _ _ []
  = withCurrentProvM $ \prv ->
    maybeThrow $ MLException (mkExn "Match_failure" [] prv)
stepAlts f v ((p,g,e):as)
  = matchPat v p >>= \case
      Nothing  -> stepAlts f v as
      Just bnd -> do let ms = getSrcSpanExprMaybe v
                     bnd <- allocEnv ("match:" ++ show (srcSpanStartLine $ fromJust ms)) bnd
                     case g of
                      Nothing -> do (bnd', e') <- unshadow e bnd
                                    return $ With ms bnd' e'
                      Just g
                        | VB _ True  <- g -> do (bnd', e') <- unshadow e bnd
                                                return $ With ms bnd' e'
                        | VB _ False <- g -> stepAlts f v as
                        | isValue g -> do gt <- typeOfM g
                                          typeError (tCon tBOOL) gt
                        | otherwise -> do g' <- step g
                                          return $ f v ((p,Just g',e):as)

                        -- FIXME: `step` the guard instead
                        -- eval g `withEnv` bnd >>= \case
                        --   VB _ True  -> return $ With ms bnd e
                        --   VB _ False -> stepAlts v as

----------------------------------------------------------------------
-- Utilities
----------------------------------------------------------------------

stepOne :: MonadEval m
        => [Expr]          -- ^ possible expressions to step through
        -> ([Expr] -> m a) -- ^ what to do when they're all values
        -> ([Expr] -> m a) -- ^ what to do after stepping a single expression
        -> m a
stepOne es kv ke = do
  (vals, exprs) <- spanM isValueOrFunVar es
  case exprs of
    []     -> kv =<< mapM resolveVar vals
    (e:es) -> do
      -- noteRedex e
      v <- step e
      ke (vals ++ v : es)

noteRedex e = do
  super <- gets stCurrentExpr
  env <- gets stVarEnv
  addEdge RedexOf super (e,env)

isValueOrFunVar (Var _ v) = isFun <$> lookupVar v
isValueOrFunVar e = return (isValue e)

resolveVar (Var _ v) = lookupVar v
resolveVar e         = return e

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


-- isVal :: Expr -> Bool
-- isVal (Val _ _)  = True
-- isVal _          = False

-- unVal :: Expr -> Value
-- unVal (Val _ v) = v

spanVals :: [Expr] -> ([Value],[Expr])
spanVals xs = let (vs,es) = span isValue xs
              in (vs, es)

gatherLams :: Value -> ([Pat], Expr, Env)
gatherLams (Lam _ p e (Just env)) = go [p] e
  where
  go ps (Lam _ p e _) = go (p:ps) e
  go ps e             = (reverse ps, e, env)


addEvent :: MonadEval m => Expr -> Expr -> Kind -> MSrcSpan -> m ()
addEvent bf (With _ env expr) k ms = addEvent bf expr k ms `withEnv` env
addEvent bf (Replace _ env expr) k ms = addEvent bf expr k ms `withEnv` env
addEvent bf expr k (Just loc)
  | interesting expr || k == Return = do
  let line = srcSpanStartLine loc
  let column = srcSpanStartCol loc
  let expr_width = srcSpanWidth loc
  let event = showKind k
  let stdout = ""
  let func_name = "<top-level>"
  id <- envId <$> gets stVarEnv
  -- traceShowM (k, id, expr)
  let insertReturn
        | Return <- k = insertEnv "__return__" expr
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
                  , evt_before = bf
                  , evt_after = expr
                  }
  modify' $ \s -> s { stTrace = stTrace s Seq.|> evt }
addEvent _ _ _ _ = return ()

addUncaughtException :: MonadEval m => NanoError -> m ()
addUncaughtException exn = do
  last_evt <- gets (last . toList . stTrace)
  let evt = last_evt { evt_event = "uncaught_exception"
                     , evt_exception_msg = show (pretty exn)
                     , evt_before = evt_after last_evt
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
  -- Val {} -> False
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
    , "expr_before"     Aeson..= Aeson.toJSON (show (pretty evt_before))
    , "expr_after"      Aeson..= Aeson.toJSON (show (pretty evt_after))
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

instance Aeson.ToJSON Expr where
  toJSON (VI _ i) = Aeson.toJSON i
  toJSON (VD _ d) = Aeson.toJSON d
  toJSON (VB _ b) = Aeson.toJSON b
  toJSON (VC _ c) = Aeson.toJSON c
  toJSON (VS _ s) = Aeson.toJSON s
  toJSON _      = Aeson.toJSON ("<<unknown>>" :: String)
