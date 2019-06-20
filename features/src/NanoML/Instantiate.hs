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

var, fun :: State ExprState String
var = incVar >> gets (("_var_" ++) . show . stVar)
fun = incFun >> gets (("_fun_" ++) . show . stFun)

nss :: State ExprState MSrcSpan
nss = dropSS >> gets (Just . head . stSS)


instantiateExpr' :: ExprGeneric -> State ExprState Expr
instantiateExpr' = \case
  EmptyG            -> TypedHole <$> nss <*> var
  VarG              -> TypedVar <$> nss <*> var
  LamG p e          -> Lam <$> nss <*> instantiatePat' p <*> instantiateExpr' e <*> typevar
  AppG se           -> App <$> nss <*> (TypedHole <$> nss <*> fun) <*> mapM instantiateExpr' se
  BopG e1 e2        -> Bop <$> nss <*> pure BB <*> instantiateExpr' e1 <*> instantiateExpr' e2
  UopG e            -> Uop <$> nss <*> pure Neg <*> instantiateExpr' e
  LitG              -> Lit <$> nss <*> pure (LL "Lit")
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
  ListG e           -> List <$> nss <*> mapM instantiateExpr' e <*> typevar
  where
    typevar = pure Nothing


instantiateExpr :: ExprGeneric -> SrcSpan -> Expr
instantiateExpr e ss = evalState (instantiateExpr' e) (ExprState 0 0 (ss : getAllSrcSpans))


instantiatePat' :: PatGeneric -> State ExprState Pat
instantiatePat' = \case
  EmptyPatG        -> TypedPat <$> pure Nothing <*> var
  VarPatG          -> TypedPat <$> pure Nothing <*> var
  LitPatG          -> LitPat <$> pure Nothing <*> pure (LL "LitPat")
  IntervalPatG     -> IntervalPat <$> pure Nothing <*> pure (LL "x") <*> pure (LL "y")
  ConsPatG p1 p2   -> ConsPat <$> pure Nothing <*> instantiatePat' p1 <*> instantiatePat' p2
  ConPatG Nothing  -> ConPat <$> pure Nothing <*> pure "con" <*> pure Nothing
  ConPatG (Just p) -> ConPat <$> pure Nothing <*> pure "con" <*> (Just <$> instantiatePat' p)
  ListPatG ps      -> ListPat <$> pure Nothing <*> mapM instantiatePat' (Set.toList ps)
  TuplePatG ps     -> TuplePat <$> pure Nothing <*> mapM instantiatePat' (Set.toList ps)
  WildPatG         -> WildPat <$> pure Nothing
  OrPatG p1 p2     -> OrPat <$> pure Nothing <*> instantiatePat' p1 <*> instantiatePat' p2
  AsPatG p         -> AsPat <$> pure Nothing <*> instantiatePat' p <*> var
  ConstrPatG p t   -> ConstraintPat <$> pure Nothing <*> instantiatePat' p <*> pure t


getAllSrcSpans :: [SrcSpan]
getAllSrcSpans = map (\(sl', sc', el', ec') -> SrcSpan sl' sc' el' ec') all_ss
  where
    all_ss = (,,,) <$> [(-10)..(-1)] <*> [1..10] <*> [(-10)..(-1)] <*> [1..10]


synthesize :: Prog -> Expr -> [ExprGeneric] -> [Var] -> [DCon] -> [Expr]
synthesize _ _ [] _ _ = []
synthesize pr bd (t:ts) funs dcons = synthesize' pr bd t ++ synthesize pr bd ts funs dcons
  where
    synthesize' p bad tmpl = if check pbadss basic then nubOrdOn killSpans (ok_res ++ [basic]) else []
      where
        bad_ss = getSrcSpanExprMaybe bad
        pbadss = fromJust bad_ss
        inst   = instantiateExpr tmpl pbadss
        basic  = onSrcSpanExpr (const bad_ss) inst
        subs   = sortOn (sizeOfTree . mkGenericTrees) $ nub $ map killSpans $ allSubExprs bad
        prims  = sortOn (\(v, _) -> fromMaybe 1000 $ elemIndex v funs) $ getPrimFuns p
        rfuns  = localFunsFirst subs (nubOrd (getFunsInScope p ++ prims))
        vars   = nubOrd (getVarsInScope p pbadss ++ ["min_float", "max_float"])
        lits   = nubOrd (getLits $ concatMap allSubExprs $ progExprs p ++ someLits)
        rdcons = sortOn (\d -> fromMaybe 1000 $ elemIndex d dcons) $ delete "::" $ concatMap getDCons (concatMap allSubExprs (progExprs p))
        check ss e = ss `notElem` errorSlice (replaceSSWithExpr (replaceSSWithExpr p basic) e)
        res    = map (onSrcSpanExpr (const bad_ss)) $ synth (killSpans basic) check subs vars rfuns lits rdcons
        ok_res = take 5 $ filter (check pbadss) res


synth :: Expr -> (SrcSpan -> Expr -> Bool) -> [Expr] -> [Var] -> [(Var, Int)] -> [Expr] -> [DCon] -> [Expr]
synth tmpl check subs vars funs lits dcons = results ++ [tmpl]
  where
    results = case tmpl of
      Var ms _         -> map (Var ms) vars
      TypedVar ms _    -> map (Var ms) vars
      Lam ms p e menv  -> map (\e' -> Lam ms p e' menv) $ synth e check subs vars funs lits dcons
      App ms _ es      -> map (\(f, es') -> if f == "::"
                                              then ConApp ms "::" (Just (Tuple Nothing es')) Nothing
                                              else App ms (Var Nothing f) es') all_cs
        where
          -- All instantiations for all possible parameter combinations
          -- qss = fromJust $ getSrcSpanExprMaybe tmpl
          -- check_funs = filter (check qss . \(f, n) -> if f == "::"
          --                                     then ConApp ms "::" (Just (Tuple Nothing es)) Nothing
          --                                     else App ms (Var Nothing f) es) funs
          insts = allCombos (map (\e' -> synth e' check subs vars funs lits dcons) (nubOrd es))
          all_cs = concatMap (\(f, n) -> map (f,) $ concatMap (`perms` n) insts) funs
      Bop ms v x y     -> map (\(b, x', y') -> Bop ms b x' y') insts
        where
          insts = (,,) <$> nubOrd (getBops subs ++ allBops) <*> synth x check subs vars funs lits dcons <*> synth y check subs vars funs lits dcons
      Uop ms v x       -> map (\(b, x') -> Uop ms b x') insts
        where
          insts = (,) <$> [Neg, FNeg] <*> synth x check subs vars funs lits dcons
      Lit ms l         -> lits
      Let ms r pes e   -> map (\(pes', e') -> Let ms r pes' e') insts
        where
          insts = (,) <$> allCombos (map (\(p, e') -> map (p,) $ synth e' check subs vars funs lits dcons) pes) <*> synth e check subs vars funs lits dcons
      Ite ms x y z     -> map (\(x', y', z') -> Ite ms x' y' z') insts
        where
          insts = (,,) <$> synth x check subs vars funs lits dcons <*> synth y check subs vars funs lits dcons <*> synth z check subs vars funs lits dcons
      Seq ms x y       -> map (\(x', y') -> Seq ms x' y') insts
        where
          insts = (,) <$> synth x check subs vars funs lits dcons <*> synth y check subs vars funs lits dcons
      Case ms e as     -> map (\(e', as') -> Case ms e' as') insts
        where
          insts = (,) <$> synth e check subs vars funs lits dcons <*> allCombos (map (\(p, g, e') -> map (p,g,) $ synth e' check subs vars funs lits dcons) as)
      Tuple ms es      -> map (Tuple ms) $ all_combos es
      ConApp ms c me s -> map (\(c', me') -> ConApp ms c' me' s) insts
        where
          insts = (,) <$> dcons <*> mapM (\e -> synth e check subs vars funs lits dcons) me
      List ms es mt    -> map (\es' -> List ms es' mt) $ all_combos es
      TypedHole ms _   -> nub $ map (Var ms) vars ++ filter (\e -> depthOfTree (mkGenericTrees e) 0 < 3) subs ++ lits
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
        insts = allCombos (map (\e' -> synth e' check subs vars funs lits dcons) es)
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


-- spanHasNoError :: Prog -> SrcSpan -> Bool
-- spanHasNoError p ss = ss `notElem` slice && not (any (`isSubSpanOf` ss) slice)
--   where
--     slice = errorSlice p


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
localFunsFirst ls funs = nubOrd $ local_funs ++ funs
  where
    local_maybe_funs = getFuns ls
    local_funs = mapMaybe (\f -> find ((==f) . fst) funs) local_maybe_funs



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