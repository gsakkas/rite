{-# LANGUAGE LambdaCase    #-}
{-# LANGUAGE MultiWayIf    #-}
{-# LANGUAGE TupleSections #-}

module NanoML.Instantiate where

import           Control.Monad.State
import           Data.List
import           Data.Maybe
import qualified Data.Set as Set
import           Data.Containers.ListUtils (nubOrd, nubOrdOn)

import           NanoML.Types
import           NanoML.Classify
import           NanoML.Monad
import           NanoML.Prim

import           Debug.Trace

-- State holding number of
--   {variable names, function names}
-- seen so far
data ExprState = ExprState { stVar :: Int, stFun :: Int, stSS :: [SrcSpan]}

incVar, incFun, dropSS :: State ExprState ()
incVar = modify $ \e -> e {stVar = 1 + stVar e}
incFun = modify $ \e -> e {stFun = 1 + stFun e}
dropSS = modify $ \e -> e {stSS = tail (stSS e)}

var, fun, ufun :: State ExprState String
var = incVar >> gets ((++ "__") . ("__var_" ++) . show . stVar)
fun = incFun >> gets ((++ "__") . ("__fun_" ++) . show . stFun)
ufun = incFun >> gets ((++ "__") . ("__ufun_" ++) . show . stFun)

nss :: State ExprState MSrcSpan
nss = dropSS >> gets (Just . head . stSS)


instantiateExpr' :: ExprGeneric -> State ExprState Expr
instantiateExpr' = \case
  EmptyG            -> TypedHole <$> nss <*> var
  VarG              -> TypedVar <$> nss <*> var
  LamG p e          -> Lam <$> nss <*> instantiatePat' p <*> instantiateExpr' e <*> typevar
  AppG se           -> App <$> nss <*> (TypedHole <$> nss <*> fun) <*> mapM instantiateExpr' se
  UserAppG se       -> App <$> nss <*> (TypedHole <$> nss <*> ufun) <*> mapM instantiateExpr' se
  BopG e1 e2        -> Bop <$> nss <*> pure BB <*> instantiateExpr' e1 <*> instantiateExpr' e2
  UopG e            -> Uop <$> nss <*> pure Neg <*> instantiateExpr' e
  LitG              -> Lit <$> nss <*> pure (LL "__Lit__")
  LetG recFlag se e -> let wrap :: (PatGeneric, ExprGeneric) -> State ExprState (Pat, Expr)
                           wrap (p, e) = (,) <$> instantiatePat' p <*> instantiateExpr' e
                       in Let <$> nss <*> pure recFlag <*> mapM wrap se <*> instantiateExpr' e
  IteG e1 e2 e3     -> Ite <$> nss <*> instantiateExpr' e1 <*> instantiateExpr' e2 <*> instantiateExpr' e3
  SeqG e1 e2        -> Seq <$> nss <*> instantiateExpr' e1 <*> instantiateExpr' e2
  CaseG e cases     -> let wrap :: (PatGeneric, Maybe ExprGeneric, ExprGeneric) -> State ExprState (Pat, Guard, Expr)
                           wrap (p, g, e) = (,,) <$> instantiatePat' p <*> mapM instantiateExpr' g <*> instantiateExpr' e
                       in Case <$> nss <*> instantiateExpr' e <*> mapM wrap cases
  TupleG se         -> Tuple <$> nss <*> mapM instantiateExpr' se
  ConAppG me        -> ConApp <$> nss <*> pure "con" <*> mapM instantiateExpr' me <*> typevar
  ListG es          -> List <$> nss <*> mapM instantiateExpr' es <*> typevar
  where
    typevar = pure Nothing


instantiateExpr :: ExprGeneric -> SrcSpan -> Expr
instantiateExpr e ss = evalState (instantiateExpr' e) (ExprState 0 0 (ss : getAllSrcSpans))


instantiatePat' :: PatGeneric -> State ExprState Pat
instantiatePat' = \case
  EmptyPatG        -> TypedPat <$> nss <*> var
  VarPatG          -> TypedPat <$> nss <*> var
  LitPatG          -> LitPat <$> nss <*> pure (LL "LitPat")
  IntervalPatG     -> IntervalPat <$> nss <*> pure (LL "x") <*> pure (LL "y")
  ConsPatG p1 p2   -> ConsPat <$> nss <*> instantiatePat' p1 <*> instantiatePat' p2
  ConPatG Nothing  -> ConPat <$> nss <*> pure "con" <*> pure Nothing
  ConPatG (Just p) -> ConPat <$> nss <*> pure "con" <*> (Just <$> instantiatePat' p)
  ListPatG ps      -> ListPat <$> nss <*> mapM instantiatePat' (Set.toList ps)
  TuplePatG ps     -> TuplePat <$> nss <*> mapM instantiatePat' ps'
    where
      ps' = case Set.toList ps of
              [EmptyPatG] -> [EmptyPatG, EmptyPatG]
              ps''        -> ps''
  WildPatG         -> WildPat <$> nss
  OrPatG p1 p2     -> OrPat <$> nss <*> instantiatePat' p1 <*> instantiatePat' p2
  AsPatG p         -> AsPat <$> nss <*> instantiatePat' p <*> var
  ConstrPatG p t   -> ConstraintPat <$> nss <*> instantiatePat' p <*> pure t


getAllSrcSpans :: [SrcSpan]
getAllSrcSpans = map (\(sl', sc', el', ec') -> SrcSpan sl' sc' el' ec') all_ss
  where
    all_ss = (,,,) <$> [(-10)..(-1)] <*> [1..10] <*> [(-10)..(-1)] <*> [1..10]


synthesize :: Prog -> Expr -> [ExprGeneric] -> [Var] -> [DCon] -> [Expr]
synthesize _ _ [] _ _ = []
synthesize pr bd (t:ts) funs dcons = synthesize' pr bd t
  where
    synthesize' p bad tmpl' = if null valid then [] else nubOrdOn killSpans (ok_res ++ valid)
      where
        valid  = specialCheck pbadss p (onSrcSpanExpr (const bad_ss) inst)
        bad_ss = getSrcSpanExprMaybe bad
        pbadss = fromJust bad_ss
        inst   = instantiateExpr tmpl' pbadss
        depth  = min 4 (depthOfTree tmpl' 0)
        all_subs = nubOrd $ map killSpans $ allSubExprs bad
        subs   = sortOn (sizeOfTree . mkGenericTrees) $ filter (\e -> depthOfTree (mkGenericTrees e) 0 < depth) all_subs
        prims  = sortOn (\(v, _) -> fromMaybe 1000 $ elemIndex v funs) $ getPrimFuns p
        rfuns  = localFunsFirst subs (nubOrd (getFunsInScope p))
        vars   = reverse $ nubOrd $ getVarsInScope p pbadss
        lits   = nubOrdOn mkGenericTrees (getLits $ concatMap allSubExprs $ progExprs p ++ someLits)
        rdcons = sortOn (\d -> fromMaybe 1000 $ elemIndex d dcons) $ delete "::" $ concatMap getDCons (concatMap allSubExprs (progExprs p))
        res    = map (onSrcSpanExpr (const bad_ss)) $ concatMap (synth 4 vars . killSpans) valid
        ok_res = take 40 $ filter (check pbadss p) $ take 400 res

        -- d == maximum depth for "Hole" synthesis
        synth :: Int -> [Var] -> Expr -> [Expr]
        synth d vrs tmpl = if d > 0 then take 100 results {- ++ filter (\e -> mkGenericTrees e `eq` mkGenericTrees tmpl) subs -} ++ [tmpl] else subs ++ lits
          where
            results = case tmpl of
              Var ms _         -> map (Var ms) vrs
              TypedVar ms _    -> map (Var ms) vrs
              Lam ms p e menv  -> map (\e' -> Lam ms p e' menv) $ synth (d - 1) (getVarsP p ++ vrs) e
              App ms v@(TypedHole ms' f') es
                | "ufun" `isInfixOf` f' -> map (\(f, es') -> if f == "::"
                                                      then ConApp ms "::" (Just (Tuple Nothing es')) Nothing
                                                      else App ms (Var Nothing f) es') all_cs
                where
                  -- All instantiations for all possible parameter combinations
                  vss = getSrcSpanExprMaybe v
                  vld = check pbadss p . onSrcSpanExpr (const (Just pbadss)) . (`instantiateExpr` pbadss) . mkGenericTrees .
                        \(f, _) -> if f == "::"
                          then ConApp ms "::" (Just (Tuple vss es)) Nothing
                          else App ms (Var vss f) es
                  check_funs = filter vld rfuns
                  insts = map (synth (d - 1) vrs) (nubOrdOn mkGenericTrees es)
                  all_cs = concatMap (\(f, n) -> take 100 $ map (f,) $ concatMap allCombos (perms insts n)) check_funs
              App ms v es      -> map (\(f, es') -> if f == "::"
                                                      then ConApp ms "::" (Just (Tuple Nothing es')) Nothing
                                                      else App ms (Var Nothing f) es') all_cs
                where
                  -- All instantiations for all possible parameter combinations
                  vss = getSrcSpanExprMaybe v
                  vld = check pbadss p . onSrcSpanExpr (const (Just pbadss)) . (`instantiateExpr` pbadss) . mkGenericTrees .
                        \(f, _) -> if f == "::"
                          then ConApp ms "::" (Just (Tuple vss es)) Nothing
                          else App ms (Var vss f) es
                  check_funs = filter vld prims
                  insts = map (synth (d - 1) vrs) (nubOrdOn mkGenericTrees es)
                  all_cs = concatMap (\(f, n) -> take 100 $ map (f,) $ concatMap allCombos (perms insts n)) check_funs
              Bop ms v x y     -> map (\(b, x', y') -> Bop ms b x' y') insts
                where
                  x_insts = synth (d - 1) vrs x
                  y_insts = if x == y then x_insts else synth (d - 1) vrs y
                  bops = nubOrd (getBops all_subs ++ allBops)
                  insts = ((,,) <$> bops <*> x_insts <*> y_insts) ++ ((,,) <$> getBopsRev bops <*> x_insts <*> y_insts)
              Uop ms v x       -> map (\(b, x') -> Uop ms b x') insts
                where
                  insts = (,) <$> [Neg, FNeg] <*> synth (d - 1) vrs x
              Lit ms l         -> lits
              Let ms r pes e   -> map (\(pes', e') -> Let ms r pes' e') insts
                where
                  insts = (,) <$> allCombos (map (\(p, e') -> map (p,) $ synth (d - 1) vrs e') pes) <*> synth (d - 1) (concatMap (getVarsP . fst) pes ++ vrs) e
              Ite ms x y z     -> map (\(x', y', z') -> Ite ms x' y' z') insts
                where
                  y_insts = synth (d - 1) vrs y
                  z_insts = if y == z then y_insts else synth (d - 1) vrs z
                  insts = (,,) <$> synth (d - 1) vrs x <*> y_insts <*> z_insts
              Seq ms x y       -> map (\(x', y') -> Seq ms x' y') insts
                where
                  x_insts = synth (d - 1) vrs x
                  y_insts = if x == y then x_insts else synth (d - 1) vrs y
                  insts = (,) <$> x_insts <*> y_insts
              Case ms e as     -> map (\(e', as') -> Case ms e' as') insts
                where
                  pats = nubOrdOn mkGenericPats $ map fst3 as
                  es = nubOrdOn mkGenericTrees $ map thd3 as
                  slen = min (length as) (length pats)
                  blen = max (length as) (length pats) + 1
                  inst = map (\p -> take 100 $ map (p, Nothing,) $ concatMap (synth (d - 1) (getVarsP p ++ vrs)) es)
                  alls = concatMap (concatMap (allCombos . inst) . perms pats) [slen..blen]
                  insts = (,) <$> synth (d - 1) vrs e <*> alls
              Tuple ms es      -> map (Tuple ms) insts
                where
                  insts = concatMap allCombos $ perms (take 100 $ map (synth (d - 1) vrs) (nubOrdOn mkGenericTrees es)) $ length es
              ConApp ms c me s -> map (\(c', me') -> ConApp ms c' me' s) insts
                where
                  insts = (,) <$> rdcons <*> take 100 (mapM (synth (d - 1) vrs) me)
              List ms es mt    -> map (\es' -> List ms es' mt) $ if null es
                                                                 then es : all_combos [TypedHole (Just $ SrcSpan (-42) (-42) (-42) (-42)) "_list_"]
                                                                 else all_combos es
              -- Use for simplified holes
              TypedHole ms _   -> nub $ map (Var ms) vrs ++ subs ++ lits
              -- Use for "full" synthesis
              -- TypedHole ms _   -> concatMap (synth (d - 1) vrs . (`instantiateExpr` pbadss)) [AppG [EmptyG], AppG [EmptyG, EmptyG]
              --                       , AppG [EmptyG, EmptyG, EmptyG], BopG EmptyG EmptyG, UopG EmptyG, LitG, LetG NonRec [(VarPatG, EmptyG)] EmptyG
              --                       , LetG NonRec [(TuplePatG (Set.fromList [VarPatG, VarPatG]), EmptyG)] EmptyG, IteG EmptyG EmptyG EmptyG
              --                       , SeqG EmptyG EmptyG, CaseG EmptyG [(TuplePatG (Set.fromList [VarPatG, VarPatG]), Nothing, EmptyG)]
              --                       , CaseG EmptyG [(LitPatG, Nothing, EmptyG)], CaseG EmptyG [(ConPatG Nothing, Nothing, EmptyG)]
              --                       , CaseG EmptyG [(ConPatG Nothing, Nothing, EmptyG), (ConPatG (Just VarPatG), Nothing, EmptyG)]
              --                       , CaseG EmptyG [(ConsPatG VarPatG EmptyPatG, Nothing, EmptyG)], TupleG [EmptyG], TupleG [EmptyG, EmptyG]
              --                       , TupleG [EmptyG, EmptyG, EmptyG], ConAppG (Just EmptyG), ListG [EmptyG], ListG [EmptyG, EmptyG]
              --                       , ListG [EmptyG, EmptyG, EmptyG], LamG VarPatG EmptyG, VarG, EmptyG]
              _ -> []

            -- All instantiations for all possible parameter combinations
            all_combos :: [Expr] -> [[Expr]]
            all_combos es' = concatMap (take 100 . concatMap allCombos . perms insts) [slen..blen]
              where
                es = nubOrdOn mkGenericTrees es'
                insts = map (synth (d - 1) vrs) es
                slen = min (length es') (length es)
                blen = max (length es') (length es) + 1


perms :: Ord a => [a] -> Int -> [[a]]
perms es n = if
  | n < les   -> []
  | n == les  -> nubOrd $ permutations es
  | otherwise -> nubOrd $ concatMap permutations $ fmap (++) [es] <*> allCombos (replicate (n - les) es)
  where
    les = length es


allCombos :: [[a]] -> [[a]]
allCombos [] = []
allCombos [es] = map (:[]) es
allCombos ([] : es) = []
allCombos ((h:t) : es) = map (h:) (allCombos es) ++ allCombos (t:es)


check :: SrcSpan -> Prog -> Expr -> Bool
check ss p e = isJust slice && ss `notElem` jslice && all non_neg jslice
  where
    non_neg (SrcSpan sl _ el _)
      | sl < 0 || el < 0 = False
    non_neg _ = True
    slice = errorSlice (replaceSSWithExpr p e)
    jslice = fromJust slice


specialCheck :: SrcSpan -> Prog -> Expr -> [Expr]
specialCheck ss p e' = map fst $ filter (all non_neg . snd) gslices
  where
    non_neg (SrcSpan sl _ el _)
      | sl < 0 || el < 0 = False
    non_neg _ = True
    ess = case e' of
            Tuple ms es' -> map (onSrcSpanExpr (const (Just ss)) . (`instantiateExpr` ss)) $ nubOrd $ map (mkGenericTrees . Tuple ms) es''
              where
                es = nubOrdOn mkGenericTrees es'
                slen = min (length es') (length es)
                blen = max (length es') (length es) + 2
                es'' = concatMap (perms es) [slen..blen]
            List ms es mt -> if null es then [e', List ms [TypedHole (Just $ SrcSpan (-42) (-42) (-42) (-42)) "_list_"] mt] else [e']
            _ -> [e']
    slices = map (\e -> (e, errorSlice (replaceSSWithExpr p e))) ess
    jslices = filter (isJust . snd) slices
    gslices = filter (notElem ss . snd) $ map (\(x, y) -> (x, fromJust y)) jslices

typeCheck :: Prog -> Bool
typeCheck prog =
  case runEval stdOpts (typeProg prog) of
    Left e        -> False
    Right (_, cs) -> null $ mapMaybe constraintSpan (Set.toList (mconcat cs))


errorSlice :: Prog -> Maybe [SrcSpan]
errorSlice prog =
  case runEval stdOpts (typeProg prog) of
    Left e        -> Nothing
    Right (_, cs) -> Just $ mapMaybe constraintSpan (Set.toList (mconcat cs))


numOfArgs :: Int -> [Var] -> Expr -> [Var]
numOfArgs n l = \case
  Prim1 {}    -> ["th1"]
  Prim2 {}    -> ["th1", "th2"]
  Prim3 {}    -> ["th1", "th2", "th3"]
  Lam _ _ e _ -> numOfArgs (n + 1) (l ++ ["th" ++ show n]) e
  e           -> l


rankedPrimVars :: [Var]
rankedPrimVars = [  "::"
                  , "List.rev"
                  , "@"
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


getBopsRev :: [Bop] -> [Bop]
getBopsRev = filter (`elem` [Minus, Div, Mod, FMinus, FDiv, Gt, Ge, Lt, Le])

someLits :: [Expr]
someLits = map (Lit Nothing) [LI 0, LI 1, LI 2, LI 10,
                              LD 0.0, LD 1.0, LD 2.0, LD 10.0,
                              LB True, LB False,
                              LC 'c',
                              LS "", LS "[]", LS "someString",
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
      Var _ f -> Just f
      ConApp _ "::" (Just (Tuple _ _)) _ -> Just "::"
      _ -> Nothing
    funs = nubOrd $ mapMaybe go es


getFuns :: [Expr] -> [Var]
getFuns = mapMaybe go
  where
    go = \case
      Var _ f -> Just f
      ConApp _ "::" (Just (Tuple _ _)) _ -> Just "::"
      _ -> Nothing


localFunsFirst :: [Expr] -> [(Var, Int)] -> [(Var, Int)]
localFunsFirst ls funs = nubOrd $ if "::" `elem` local_fs || "@" `elem` local_fs then cons ++ local_funs ++ funs else local_funs ++ funs ++ cons
  where
    local_maybe_funs = getFuns ls
    local_funs = mapMaybe (\f -> find ((==f) . fst) funs) local_maybe_funs
    local_fs = map fst local_funs
    cons = mapMaybe (\f -> find ((==f) . fst) allPrimFuns) ["::", "@"]


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
    Case _ e as     -> getVars e ss ++ concatMap (\(p, g, e'') -> let vs = getVars e'' ss in if null vs then vs else vs ++ getVarsP p) as
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
  TypedPat _ x        -> [x]


getDCons :: Expr -> [DCon]
getDCons = \case
    Lam _ x e _    -> getDConsP x
    Let _ _ pes _  -> concatMap (getDConsP . fst) pes
    Case _ _ as    -> concatMap (getDConsP . fst3) as
    ConApp _ d _ _ -> [d]
    _ -> []


getDConsP :: Pat -> [DCon]
getDConsP = \case
  ConsPat _ x y       -> getDConsP x ++ getDConsP y
  ConPat _ d mp       -> d : concatMap getDConsP (maybeToList mp)
  ListPat _ ps        -> concatMap getDConsP ps
  TuplePat _ ps       -> concatMap getDConsP ps
  OrPat _ x y         -> getDConsP x ++ getDConsP y
  AsPat _ p _         -> getDConsP p
  ConstraintPat _ p _ -> getDConsP p
  _ -> []


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
