{-# LANGUAGE LambdaCase    #-}
{-# LANGUAGE MultiWayIf    #-}
{-# LANGUAGE TupleSections #-}

module NanoML.Instantiate where

import           Control.Monad.State
import           Data.List
import           Data.Maybe
import qualified Data.Set as Set
import           Data.Containers.ListUtils (nubOrd)

import           NanoML.Types
import           NanoML.Classify
import           NanoML.Monad
import           NanoML.Prim

import           Debug.Trace

-- State holding number of
--   {variable names, function names}
-- seen so far
data ExprState = ExprState { stVar :: Int, stFun :: Int }

incVar, incFun :: State ExprState ()
incVar = modify $ \e -> e {stVar = 1 + stVar e}
incFun = modify $ \e -> e {stFun = 1 + stFun e}

var, fun :: State ExprState String
var = incVar >> gets (('x':) . show . stVar)
fun = incFun >> gets (('f':) . show . stFun)


instantiateExpr' :: ExprGeneric -> State ExprState Expr
instantiateExpr' = \case
  EmptyG            -> TypedHole Nothing <$> var
  VarG              -> TypedVar Nothing <$> var
  LamG p e          -> Lam Nothing <$> instantiatePat' p <*> instantiateExpr' e <*> typevar
  AppG se           -> App Nothing <$> (TypedHole Nothing <$> fun) <*> mapM instantiateExpr' (Set.toList se)
  BopG e1 e2        -> Bop Nothing BB <$> instantiateExpr' e1 <*> instantiateExpr' e2
  UopG e            -> Uop Nothing Neg <$> instantiateExpr' e
  LitG              -> pure $ Lit Nothing (LL "Lit")
  LetG recFlag se e -> let wrap :: (PatGeneric, ExprGeneric) -> State ExprState (Pat, Expr)
                           wrap (p, e) = (,) <$> instantiatePat' p <*> instantiateExpr' e
                       in Let Nothing recFlag <$> mapM wrap (Set.toList se) <*> instantiateExpr' e
  IteG e1 e2 e3     -> Ite Nothing <$> instantiateExpr' e1 <*> instantiateExpr' e2 <*> instantiateExpr' e3
  SeqG e1 e2        -> Seq Nothing <$> instantiateExpr' e1 <*> instantiateExpr' e2
  CaseG cases       -> let wrap :: (PatGeneric, Maybe ExprGeneric, ExprGeneric) -> State ExprState (Pat, Guard, Expr)
                           wrap (p, g, e) = (,,) <$> instantiatePat' p <*> mapM instantiateExpr' g <*> instantiateExpr' e
                       in Case Nothing <$> instantiateExpr' VarG <*> mapM wrap (Set.toList cases)
  TupleG se         -> Tuple Nothing <$> mapM instantiateExpr' (Set.toList se)
  ConAppG me        -> ConApp Nothing "con" <$> mapM instantiateExpr' me <*> typevar
  ListG e           -> List Nothing <$> mapM instantiateExpr' (Set.toList e) <*> typevar
  where
    typevar = pure Nothing


instantiateExpr :: ExprGeneric -> Expr
instantiateExpr e = evalState (instantiateExpr' e) (ExprState 0 0)


instantiatePat' :: PatGeneric -> State ExprState Pat
instantiatePat' = \case
  EmptyPatG        -> TypedPat Nothing <$> var
  VarPatG          -> TypedPat Nothing <$> var
  LitPatG          -> pure $ LitPat Nothing (LL "LitPat")
  IntervalPatG     -> pure $ IntervalPat Nothing (LL "x") (LL "y")
  ConsPatG p1 p2   -> ConsPat Nothing <$> instantiatePat' p1 <*> instantiatePat' p2
  ConPatG Nothing  -> pure $ ConPat Nothing "con" Nothing
  ConPatG (Just p) -> ConPat Nothing "con" <$> (Just <$> instantiatePat' p)
  ListPatG ps      -> ListPat Nothing <$> mapM instantiatePat' (Set.toList ps)
  TuplePatG ps     -> TuplePat Nothing <$> mapM instantiatePat' (Set.toList ps)
  WildPatG         -> pure $ WildPat Nothing
  OrPatG p1 p2     -> OrPat Nothing <$> instantiatePat' p1 <*> instantiatePat' p2
  AsPatG p         -> AsPat Nothing <$> instantiatePat' p <*> var
  ConstrPatG p t   -> ConstraintPat Nothing <$> instantiatePat' p <*> pure t


synthesize :: Prog -> Expr -> ExprGeneric -> [Expr]
synthesize p bad tmpl = nubOrd (basic : typed_res)
  where
    bad_ss = getSrcSpanExprMaybe bad
    basic  = onSrcSpanExpr (const bad_ss) $ instantiateExpr tmpl
    subs   = sortOn (\e -> sizeOfTree (mkGenericTrees e) 0) $ nub $ map killSpans $ allSubExprs bad
    funs   = getFunsInScope p
    vars   = nubOrd (getVarsInScope p (fromJust bad_ss) ++ ["min_float", "max_float"])
    lits   = nubOrd (getLits $ concatMap allSubExprs $ progExprs p ++ someLits)
    res    = filter (\e -> pruneGTree 2 (mkGenericTrees basic) == pruneGTree 2 (mkGenericTrees e)) $
                    synth basic subs vars (nubOrd (funs ++ getPrimFuns p)) lits
    res_ss = map (onSrcSpanExpr (const bad_ss)) res
    typed_res = take 40 $ filter (\e -> fromJust bad_ss `notElem` errorSlice (replaceSSWithExpr p e)) res_ss


-- removeSubTmpls :: [Expr] -> [Expr]
-- removeSubTmpls [] = []
-- removeSubTmpls (e:es) = e : removeSubTmpls (filter (/= basic) es)
--   where
--     basic = instantiateExpr (mkGenericTrees e)


-- synth :: Expr -> Int -> [Expr] -> [Expr]
-- synth tmpl depth subs = possible2 {- ++ possible1 -} ++ res_sub ++ possible0 ++ [tmpl]
--   where
--     gen_tmpl = mkGenericTrees tmpl
--     tmplMatch2 s = pruneGTree depth gen_tmpl == pruneGTree depth (mkGenericTrees s)
--     possible2 = filter tmplMatch2 subs
--     d = depth - 1
--     -- tmplMatch1 s = (pruneGTree d gen_tmpl == pruneGTree d (mkGenericTrees s)) &&
--     --               (Set.fromList (map (pruneGTree d . mkGenericTrees) (subExprs tmpl)) == Set.fromList (map (pruneGTree d . mkGenericTrees) (subExprs s)))
--     -- possible1 = filter tmplMatch1 subs
--     tmplMatch0 s = pruneGTree d gen_tmpl == pruneGTree d (mkGenericTrees s)
--     possible0 = filter tmplMatch0 subs
--     res_sub = [replaceSubExprs tmpl es | nn (subExprs tmpl) && depth > 0,
--                es <- allCombos $ map (\s -> filter (\s' -> pruneGTree d (mkGenericTrees s) == pruneGTree d (mkGenericTrees s')) subs ++ [s]) (subExprs tmpl)]
--               --  es <- allCombos $ map (\ s -> synth s d subs ++ [s]) (subExprs tmpl)]
--     nn = not . null


synth :: Expr -> [Expr] -> [Var] -> [(Var, Int)] -> [Expr] -> [Expr]
synth tmpl subs vars funs lits = results ++ [tmpl]
  where
    results = case tmpl of
      Var ms _         -> map (Var ms) vars
      TypedVar ms _    -> map (Var ms) vars
      Lam ms p e menv  -> map (\e' -> Lam ms p e' menv) $ synth e subs vars funs lits
      App ms _ es      -> map (\(f, es') -> if f == "::"
                                              then ConApp ms "::" (Just (Tuple Nothing es')) Nothing
                                              else App ms (Var Nothing f) es') all_cs
        where
          -- All instantiations for all possible parameter combinations
          insts = allCombos (map (\e' -> synth e' subs vars funs lits) es)
          all_cs = concatMap (\(f, n) -> map (f,) $ concatMap (`perms` n) insts) funs
      Bop ms v x y     -> map (\(b, x', y') -> Bop ms b x' y') insts
        where
          insts = (,,) <$> nubOrd (getBops subs ++ allBops ++ [BB]) <*> synth x subs vars funs lits <*> synth y subs vars funs lits
      Uop ms v x       -> map (\(b, x') -> Uop ms b x') insts
        where
          insts = (,) <$> [Neg, FNeg] <*> synth x subs vars funs lits
      Lit ms l         -> lits
      Let ms r pes e   -> map (\(pes', e') -> Let ms r pes' e') insts
        where
          insts = (,) <$> allCombos (map (\(p, e') -> map (p,) $ synth e' subs vars funs lits) pes) <*> synth e subs vars funs lits
      Ite ms x y z     -> map (\(x', y', z') -> Ite ms x' y' z') insts
        where
          insts = (,,) <$> synth x subs vars funs lits <*> synth y subs vars funs lits <*> synth z subs vars funs lits
      Seq ms x y       -> map (\(x', y') -> Seq ms x' y') insts
        where
          insts = (,) <$> synth x subs vars funs lits <*> synth y subs vars funs lits
      Case ms e as     -> map (\(e', as') -> Case ms e' as') insts
        where
          insts = (,) <$> synth e subs vars funs lits <*> allCombos (map (\(p, g, e') -> map (p,g,) $ synth e' subs vars funs lits) as)
      Tuple ms es      -> map (Tuple ms) $ all_combos es
      ConApp ms c me s -> map (\(c', me') -> ConApp ms c' me' s) insts
        where
          insts = (,) <$> allDCons <*> mapM (\e -> synth e subs vars funs lits) me
      List ms es mt    -> map (\es' -> List ms es' mt) $ all_combos es
      TypedHole ms _   -> nub $ map (Var ms) vars ++ filter (\e -> sizeOfTree (mkGenericTrees e) 0 < 3) subs ++ lits
      _ -> []

    perms :: Ord a => [a] -> Int -> [[a]]
    perms es n = if
      | n < les   -> []
      | n == les  -> nubOrd $ permutations es
      | otherwise -> nubOrd $ concatMap permutations $ fmap (++) [es] <*> allCombos (replicate (n - les) es)
      where
        les = length es
    -- All instantiations for all possible parameter combinations
    all_combos :: [Expr] -> [[Expr]]
    all_combos es = insts ++ concatMap (`perms` (ll + 1)) insts ++ concatMap (`perms` (ll + 2)) insts
      where
        insts = allCombos (map (\e' -> synth e' subs vars funs lits) es)
        ll = length es


allCombos :: [[a]] -> [[a]]
allCombos [] = []
allCombos [es] = map (:[]) es
allCombos ([] : es) = []
allCombos ((h:t) : es) = map (h:) (allCombos es) ++ allCombos (t:es)


-- replaceSubExprs :: Expr -> [Expr] -> Expr
-- replaceSubExprs e kids = case e of
--   Lam ms x e y     -> Lam ms x (head kids) y
--   App ms e es      -> App ms (head kids) (tail kids)
--   Bop ms v x y     -> Bop ms v (head kids) (head $ tail kids)
--   Uop ms v x       -> Uop ms v (head kids)
--   Let ms v pes e   -> Let ms v pes' (head rk)
--                         where
--                           rk = reverse kids
--                           pes' = zip (map fst pes) (reverse $ tail rk)
--   Ite ms x y z     -> Ite ms (head kids) (head ys) (head zs)
--                         where
--                           ys = tail kids
--                           zs = tail ys
--   Seq ms x y       -> Seq ms (head kids) (head $ tail kids)
--   Case ms e as     -> Case ms (head kids) (zip3 (map fst3 as) (map snd3 as) (tail kids)) -- FIXME: snd3 not correct
--   Tuple ms es      -> Tuple ms kids
--   ConApp ms v me s -> case maybeToList me of -- FIXME: maybe not correct
--       [Tuple ms' es] -> ConApp ms v (Just (Tuple ms' kids)) s
--       es             -> ConApp ms v (if null kids then Nothing else Just (head kids)) s
--   List ms es v     -> List ms kids v
--   _ -> e


typeCheck :: Prog -> Bool
typeCheck prog =
  case runEval stdOpts (typeProg prog) of
    Left e        -> False
    Right (_, cs) -> null $ mapMaybe constraintSpan (Set.toList (mconcat cs))


errorSlice :: Prog -> [SrcSpan]
errorSlice prog =
  case runEval stdOpts (typeProg prog) of
    Left e        -> []
    Right (_, cs) -> mapMaybe constraintSpan (Set.toList (mconcat cs))


spanHasNoError :: Prog -> SrcSpan -> Bool
spanHasNoError p ss = ss `notElem` slice && not (any (`isSubSpanOf` ss) slice)
  where
    slice = errorSlice p


pruneGTree :: Int -> ExprGeneric -> ExprGeneric
pruneGTree maxd e' = if depth <= maxd then e' else ne
  where
    depth = sizeOfTree e' 0
    ne    = cutSubTrs e' maxd
    cutSubTrs :: ExprGeneric -> Int -> ExprGeneric
    cutSubTrs e 0 = EmptyG
    cutSubTrs e d = case e of
      EmptyG        -> EmptyG
      VarG          -> VarG
      LamG p e'     -> LamG (cutSubPs p (d - 1)) (cutSubTrs e' (d - 1))
      AppG es       -> AppG (Set.map (\e'' -> cutSubTrs e'' (d - 1)) es)
      BopG e1 e2    -> BopG (cutSubTrs e1 (d - 1)) (cutSubTrs e2 (d - 1))
      UopG e'       -> UopG (cutSubTrs e' (d - 1))
      LitG          -> LitG
      LetG r pes e' -> LetG r (Set.map (\(p, e'') -> (cutSubPs p (d - 1), cutSubTrs e'' (d - 1))) pes) (cutSubTrs e' (d - 1))
      IteG e1 e2 e3 -> IteG (cutSubTrs e1 (d - 1)) (cutSubTrs e2 (d - 1)) (cutSubTrs e3  (d - 1))
      SeqG e1 e2    -> SeqG (cutSubTrs e1 (d - 1)) (cutSubTrs e2 (d - 1))
      CaseG as      -> CaseG (Set.map (\(p, me, e'')
                        -> (cutSubPs p (d - 1), me >>= (\ e'' -> Just (cutSubTrs e'' (d - 1))), cutSubTrs e'' (d - 1))) as)
      TupleG es     -> TupleG (Set.map (\e' -> cutSubTrs e' (d - 1)) es)
      ConAppG me    -> ConAppG (me >>= (\e' -> Just (cutSubTrs e' (d - 1))))
      ListG es      -> ListG (Set.map (\e' -> cutSubTrs e' (d - 1)) es)

    cutSubPs :: PatGeneric -> Int -> PatGeneric
    cutSubPs e 0 = EmptyPatG
    cutSubPs e d = case e of
      EmptyPatG        -> EmptyPatG
      VarPatG          -> VarPatG
      LitPatG          -> LitPatG
      IntervalPatG     -> IntervalPatG
      ConsPatG p1 p2   -> ConsPatG (cutSubPs p1 (d - 1)) (cutSubPs p2 (d - 1))
      ConPatG Nothing  -> ConPatG Nothing
      ConPatG (Just p) -> ConPatG (Just $ cutSubPs p (d - 1))
      ListPatG ps      -> ListPatG (Set.map (\p' -> cutSubPs p' (d - 1)) ps)
      TuplePatG ps     -> TuplePatG (Set.map (\p' -> cutSubPs p' (d - 1)) ps)
      WildPatG         -> WildPatG
      OrPatG p1 p2     -> OrPatG (cutSubPs p1 (d - 1)) (cutSubPs p2 (d - 1))
      AsPatG p         -> AsPatG (cutSubPs p (d - 1))
      ConstrPatG p t   -> ConstrPatG (cutSubPs p (d - 1)) t


numOfArgs :: Int -> [Var] -> Expr -> [Var]
numOfArgs n l = \case
  Prim1 {}    -> ["th1"]
  Prim2 {}    -> ["th1", "th2"]
  Prim3 {}    -> ["th1", "th2", "th3"]
  Lam _ _ e _ -> numOfArgs (n + 1) (l ++ ["th" ++ show n]) e
  e           -> l


rankedPrimVars :: [Var]
rankedPrimVars = [ "List.rev"
                  , "@"
                  , "::"
                  , "List.append"
                  , "List.combine"
                  , "List.length"
                  , "List.fold_left"
                  , "fst"
                  , "snd"
                  , "^"
                  , "max"
                  , "min"
                  , "List.map"
                  , "List.fold_right"
                  , "**"
                  , "&&"
                  , "&"
                  , "||"
                  , "not"
                  , "List.hd"
                  , "List.tl"
                  , "List.mem"
                  , "List.nth"
                  , "List.split"
                  , "String.length"
                  , "String.concat"
                  , "char_of_int"
                  , "int_of_char"
                  , "int_of_float"
                  , "int_of_string"
                  , "float"
                  , "float_of_int"
                  , "float_of_string"
                  , "string_of_bool"
                  , "string_of_int"
                  , "string_of_float"
                  , "abs"
                  , "abs_float"
                  , "exp"
                  , "log"
                  , "log10"
                  , "mod_float"
                  , "modf"
                  , "sqrt"
                  , "acos"
                  , "asin"
                  , "atan"
                  , "cos"
                  , "sin"
                  , "tan"
                  , "tanh"
                  , "!"
                  , ":="
                  , "ref"
                  , "List.assoc"
                  , "List.exists"
                  , "List.for_all"
                  , "List.filter"
                  , "List.iter"
                  , "List.partition"
                  , "Array.get"
                  , "Array.of_list"
                  , "Char.code"
                  , "Char.compare"
                  , "Char.escaped"
                  , "Char.lowercase"
                  , "Char.uppercase"
                  , "String.create"
                  , "String.get"
                  , "String.make"
                  , "Random.State.make"
                  , "Random.State.int"
                  , "print_char"
                  , "print_int"
                  , "print_float"
                  , "print_string"
                  , "print_endline"
                  , "print_newline"
                  , "truncate"
                  , "compare"
                  , "raise"
                  , "Printexc.to_string"
                  , "Printf.printf"
                  , "Format.printf"
                  , "Printf.sprintf"
                  , "Format.sprintf"
                 ]

allPrimFuns :: [(Var, Int)]
allPrimFuns = map (\p -> (fst p, length $ numOfArgs 1 [] (snd p))) $
                filter (\p -> fst p `notElem` ["min_float", "max_float", "Sys.argv"]) pvars
  where
    a = TVar "a"
    cap = mkPrim2Fun $ P2 "::" pappend (tL a) (tL a)
    pvars = map (\v -> fromMaybe ("::", cap) $ find ((== v) . fst) primVars) rankedPrimVars

allBops :: [Bop]
allBops = map snd primBops


allDCons :: [DCon]
allDCons = ["()", "[]", "::"] --, "VarX", "VarY", "Sine", "Cosine", "Average", "Times", "Thresh"]


someLits :: [Expr]
someLits = map (Lit Nothing) [LI 0, LI 1, LI 2, LI 3, LI 10,
                              LD 0.0, LD 1.0, LD 2.0, LD 3.0, LD 10.0,
                              LB True, LB False,
                              LC 'a', LC 'b', LC 'x',
                              LS "", LS "[]", LS "x",
                              LL "Any"]


progFuns :: Prog -> [(Var, [Var])]
progFuns [] = []
progFuns (d:ds) = case d of
  DFun _ _ pes -> (takeVarPat $ fst $ head pes, numOfArgs 1 [] (snd $ head pes)) : progFuns ds
  _            -> progFuns ds
  where
    takeVarPat p = case p of
      VarPat _ v -> v
      _          -> errorWithoutStackTrace "progFuns"


getFunsInScope :: Prog -> [(Var, Int)]
getFunsInScope p = map (\(v, as) -> (v, length as)) (progFuns p)


getPrimFuns :: Prog -> [(Var, Int)]
getPrimFuns p = mapMaybe (\f -> find ((==f) . fst) allPrimFuns) funs
  where
    es = concatMap allSubExprs $ progExprs p
    go e = case e of
      App _ (Var _ f) _ -> Just f
      ConApp _ "::" (Just (Tuple _ _)) _ -> Just "::"
      _ -> Nothing
    funs = nubOrd $ mapMaybe go es

    
getVarsInScope :: Prog -> SrcSpan -> [Var]
getVarsInScope [] _ = []
getVarsInScope (d:ds) ss = case d of
  DFun _ _ pes -> concatMap ((`getVars` ss) . snd) pes ++ getVarsInScope ds ss
  DEvl _ e     -> getVars e ss ++ getVarsInScope ds ss
  _            -> getVarsInScope ds ss


getVars :: Expr -> SrcSpan -> [Var]
getVars e' ss | ss `isSubSpanOf` getLoc e'
  = case e' of
    Var _ x         -> [x]
    Lam _ x e _     -> getVarsP x ++ getVars e ss
    App _ _ es      -> concatMap (`getVars` ss) es
    Bop _ _ x y     -> getVars x ss ++ getVars y ss
    Uop _ _ x       -> getVars x ss
    Let _ _ pes e   -> concatMap (getVarsP . fst) pes ++ concatMap ((`getVars` ss) . snd) pes ++ getVars e ss
    Ite _ x y z     -> getVars x ss ++ getVars y ss ++ getVars z ss
    Seq _ x y       -> getVars x ss ++ getVars y ss
    Case _ e as     -> getVars e ss ++ concatMap (getVarsP . fst3) as ++ concatMap ((`getVars` ss) . thd3) as
    Tuple _ es      -> concatMap (`getVars` ss) es
    ConApp _ _ me _ -> case maybeToList me of -- FIXME: maybe not correct
        [Tuple _ es] -> concatMap (`getVars` ss) es
        es           -> concatMap (`getVars` ss) es
    List _ es _     -> concatMap (`getVars` ss) es
    _ -> []
  where
    getLoc e = fromJust (getSrcSpanExprMaybe e)
getVars _ _ = []


getVarsP :: Pat -> [Var]
getVarsP p = case p of
  VarPat _ x          -> [x]
  LitPat {}           -> []
  IntervalPat {}      -> []
  ConsPat _ x y       -> getVarsP x ++ getVarsP y
  ConPat _ _ mp       -> concatMap getVarsP $ maybeToList mp
  ListPat _ ps        -> concatMap getVarsP ps
  TuplePat _ ps       -> concatMap getVarsP ps
  WildPat {}          -> []
  OrPat _ x y         -> getVarsP x ++ getVarsP y
  AsPat _ p x         -> getVarsP p ++ [x]
  ConstraintPat _ p _ -> getVarsP p


getBops :: [Expr] -> [Bop]
getBops es = mapMaybe go es
  where
    go e' = case e' of
      Bop _ b _ _ -> Just b
      _           -> Nothing


getLits :: [Expr] -> [Expr]
getLits es = map killSpans $ filter go es
  where
    go e' = case e' of
      Lit {} -> True
      _      -> False