{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ImplicitParams #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE MultiWayIf #-}
module NanoML.Classify where


import Control.Monad
import Control.Monad.Except
import Control.Monad.State
import Data.Bifunctor
import Data.Data
import Data.Generics.Aliases (mkM, mkT)
import Data.Generics.Schemes
import Data.Hashable
import qualified Data.Map.Strict as Map
import Data.Map.Strict (Map)
import Data.Maybe
import Data.Monoid hiding (Alt)
import qualified Data.Set as Set
import Data.Set (Set)
import GHC.Generics
import GHC.Stack

import NanoML.Monad
import NanoML.Parser
import NanoML.Pretty
import NanoML.Prim
import NanoML.Types

import Debug.Trace

preds_has :: [Expr -> Double]
preds_has = [has_op o | o <- [Eq .. Mod]]
     ++ [has_con "::", has_con "[]", has_con "(,)", has_fun]

preds_count :: [Expr -> Double]
preds_count = [count_op o | o <- [Eq .. Mod]]
     ++ [count_con "::", count_con "[]", count_con "(,)", count_fun]

type Feature = ([String], (TExpr -> TExpr -> [Double]))

preds_thas :: [Feature] -- [TExpr -> Double]
preds_thas = map (first (take 1) . second (fmap (fmap (take 1))))
             preds_thas_ctx

preds_tsize :: [Feature]
preds_tsize = [ tsize ]

only_ctx :: Feature -> Feature
only_ctx = first (drop 1) . second (fmap (fmap (drop 1)))

preds_tis :: [Feature] -- [TExpr -> TExpr -> [Double]]
preds_tis = map (first (take 1) . second (fmap (fmap (take 1))))
            preds_tis_ctx

preds_tis_novar :: [Feature] -- [TExpr -> TExpr -> [Double]]
preds_tis_novar = init preds_tis

preds_tis_ctx :: [Feature] -- [TExpr -> TExpr -> [Double]]
preds_tis_ctx =
    -- [ (["Is-"++show o], tis_op_ctx o) | o <- [Eq ..]]
    map tis_op_ctx [Eq ..]
 ++ [ tis_anycon_ctx
    , tis_con_ctx "::", tis_con_ctx "[]"
    , tis_con_ctx "(,)"
    , tis_con_ctx "VarX", tis_con_ctx "VarY"
    , tis_con_ctx "Sine", tis_con_ctx "Cosine"
    , tis_con_ctx "Average", tis_con_ctx "Times", tis_con_ctx "Thresh"
    , tis_anycon_case_ctx
    , tis_con_case_ctx "::", tis_con_case_ctx "[]"
    , tis_con_case_ctx "(,)"
    , tis_con_case_ctx "VarX", tis_con_case_ctx "VarY"
    , tis_con_case_ctx "Sine", tis_con_case_ctx "Cosine"
    , tis_con_case_ctx "Average", tis_con_case_ctx "Times", tis_con_case_ctx "Thresh"
    , tis_fun_ctx, tis_app_ctx
    , tis_lit_int_ctx
    , tis_lit_float_ctx
    , tis_lit_bool_ctx
    , tis_lit_char_ctx
    , tis_lit_string_ctx
    , tis_ite_ctx
    , tis_seq_ctx
    , tis_var_ctx
    , tis_let_ctx
    ]

preds_thas_ctx :: [Feature] --  [TExpr -> TExpr -> [Double]]
preds_thas_ctx =
    map thas_op_ctx [Eq ..]
 ++ [ thas_anycon_ctx
    , thas_con_ctx "::", thas_con_ctx "[]"
    , thas_con_ctx "(,)"
    , thas_con_ctx "VarX", thas_con_ctx "VarY"
    , thas_con_ctx "Sine", thas_con_ctx "Cosine"
    , thas_con_ctx "Average", thas_con_ctx "Times", thas_con_ctx "Thresh"
    , thas_anycon_case_ctx
    , thas_con_case_ctx "::", thas_con_case_ctx "[]"
    , thas_con_case_ctx "(,)"
    , thas_con_case_ctx "VarX", thas_con_case_ctx "VarY"
    , thas_con_case_ctx "Sine", thas_con_case_ctx "Cosine"
    , thas_con_case_ctx "Average", thas_con_case_ctx "Times", thas_con_case_ctx "Thresh"
    , thas_fun_ctx, thas_app_ctx
    , thas_lit_int_ctx
    , thas_lit_float_ctx
    , thas_lit_bool_ctx
    , thas_lit_char_ctx
    , thas_lit_string_ctx
    , thas_ite_ctx
    , thas_seq_ctx
    , thas_var_ctx
    , thas_let_ctx
    ]

preds_tcount_ctx :: [Feature] --  [TExpr -> TExpr -> [Double]]
preds_tcount_ctx =
    map tcount_op_ctx [Eq ..]
 ++ [ tcount_anycon_ctx
    , tcount_con_ctx "::", tcount_con_ctx "[]"
    , tcount_con_ctx "(,)"
    , tcount_con_ctx "VarX", tcount_con_ctx "VarY"
    , tcount_con_ctx "Sine", tcount_con_ctx "Cosine"
    , tcount_con_ctx "Average", tcount_con_ctx "Times", tcount_con_ctx "Thresh"
    , tcount_anycon_case_ctx
    , tcount_con_case_ctx "::", tcount_con_case_ctx "[]"
    , tcount_con_case_ctx "(,)"
    , tcount_con_case_ctx "VarX", tcount_con_case_ctx "VarY"
    , tcount_con_case_ctx "Sine", tcount_con_case_ctx "Cosine"
    , tcount_con_case_ctx "Average", tcount_con_case_ctx "Times", tcount_con_case_ctx "Thresh"
    , tcount_fun_ctx, tcount_app_ctx
    , tcount_lit_int_ctx
    , tcount_lit_float_ctx
    , tcount_lit_bool_ctx
    , tcount_lit_char_ctx
    , tcount_lit_string_ctx
    , tcount_ite_ctx
    , tcount_seq_ctx
    , tcount_var_ctx
    , tcount_let_ctx
    ]

base_types :: [Type]
base_types = map tCon [tINT, tFLOAT, tCHAR, tSTRING, tBOOL, "expr", tUNIT]

concrete_types :: [Type]
concrete_types = base_types
              ++ map (mkTApps tLIST . pure) base_types
-- TODO: make list of interesting types
-- base types + lists + pairs + functions

preds_tcon :: [(String, TExpr -> Double)]
preds_tcon = [ (tc,  is_tcon tc)
             | tc <- [ tINT, tFLOAT, tCHAR, tSTRING, tBOOL
                     , tLIST, tUNIT, "Tuple", "Fun"
                     , "expr"
                     ]
             ] ++ [("Is-var", is_tvar)]

preds_tcon_ctx :: [Feature] -- [TExpr -> TExpr -> [Double]]
preds_tcon_ctx = [is_tcon_ctx tc | tc <- [tINT, tFLOAT, tCHAR, tSTRING, tBOOL, tLIST, tUNIT, "Tuple", "Fun", "expr"]] ++ [is_tvar_ctx]

preds_tcon_children :: [Feature] -- [TExpr -> TExpr -> [Double]]
preds_tcon_children = map (first (drop 2) . second (fmap (fmap (drop 2))))
                      preds_tcon_ctx

preds_tcon_novar_children :: [Feature] -- [TExpr -> TExpr -> [Double]]
preds_tcon_novar_children = init preds_tcon_children


preds_tcon_agg :: [TExpr -> Double]
preds_tcon_agg = [has_tcon tc | tc <- [tINT, tFLOAT, tCHAR, tSTRING, tBOOL, tLIST, tUNIT, "Tuple", "Fun", "expr"]]

preds_tcon_count :: [TExpr -> Double]
preds_tcon_count = [count_tcon tc | tc <- [tINT, tFLOAT, tCHAR, tSTRING, tBOOL, tLIST, tUNIT, "Tuple", "Fun", "expr"]]

fold :: Monoid a => (Expr -> a -> a) -> a -> Expr -> a
fold f z = go
  where
  go e = f e $ case e of
    Var {} -> z
    Lam _ _ b _ -> go b
    App _ f es -> mconcat $ map go (f:es)
    Bop _ _ e1 e2 -> mappend (go e1) (go e2)
    Uop _ _ e -> go e
    Lit {} -> z
    Let _ _ pes e -> mconcat (map (go.snd) pes ++ [go e])
    Ite _ x y z -> go x <> go y <> go z
    Seq _ e1 e2 -> mappend (go e1) (go e2)
    Case _ e as -> mconcat (go e : map (go.thd3) as)
    Tuple _ es -> mconcat (map go es)
    ConApp _ _ me _ -> maybe mempty go me
    Record _ fes _ -> mconcat (map (go.snd) fes)
    Field _ e _ -> go e
    SetField _ e1 _ e2 -> mappend (go e1) (go e2)
    List _ es _ -> mconcat (map go es)
    Array _ es _ -> mconcat (map go es)
    Try _ e as -> mconcat (go e : map (go.thd3) as)
    -- the rest of these should not appear in parsed exprs
    Prim1 {} -> z
    Prim2 {} -> z
    With {} -> z
    Replace {} -> z
    Hole {} -> z
    Ref {} -> z

foldM :: (Monad m, Monoid a) => (Expr -> a -> m a) -> a -> Expr -> m a
foldM f z = go
  where
  go e = f e =<< case e of
    Var {} -> return z
    Lam _ _ b _ -> go b
    App _ f es -> mconcat <$> mapM go (f:es)
    Bop _ _ e1 e2 -> mappend <$> (go e1) <*> (go e2)
    Uop _ _ e -> go e
    Lit {} -> return z
    Let _ _ pes e -> mconcat <$> (mapM go (map snd pes ++ [e]))
    Ite _ x y z -> mconcat <$> sequence [go x, go y, go z]
    Seq _ e1 e2 -> mappend <$> (go e1) <*> (go e2)
    Case _ e as -> mconcat <$> (mapM go (e : map thd3 as))
    Tuple _ es -> mconcat <$> (mapM go es)
    ConApp _ _ me _ -> maybe (return mempty) go me
    Record _ fes _ -> mconcat <$> (mapM (go.snd) fes)
    Field _ e _ -> go e
    SetField _ e1 _ e2 -> mappend <$> (go e1) <*> (go e2)
    List _ es _ -> mconcat <$> (mapM go es)
    Array _ es _ -> mconcat <$> (mapM go es)
    Try _ e as -> mconcat <$> (mapM go (e : map thd3 as))
    -- the rest of these should not appear in parsed exprs
    Prim1 {} -> return z
    Prim2 {} -> return z
    With {} -> return z
    Replace {} -> return z
    Hole {} -> return z
    Ref {} -> return z

-- TODO: rejigger to
-- classify :: [Expr -> Bool] -> Expr -> Map SrcLoc [Bool]
-- so we can iterate fast on different feature vectors
-- produce simple output for ML folks to consume,
-- ideally something like
-- type Check = Bool
-- type Feature = Bool (Float?)
-- [(Check, [Feature])]

classify :: [Expr -> Double] -> Expr -> [(SrcSpan, [Double])]
classify ps = fold f []
  where
  f e acc = (getLoc e, map ($e) ps) : acc
  getLoc e = fromJust (getSrcSpanExprMaybe e)

tclassify :: [TExpr -> Double] -> TExpr -> [(SrcSpan, [Double])]
tclassify ps = tfold f []
  where
  f e acc = (getLoc e, map ($e) ps) : acc
  getLoc = infoSpan . texprInfo

tclassify_ctx :: [TExpr -> TExpr -> [Double]] -> TExpr
              -> [(SrcSpan, [Double])]
tclassify_ctx ps = ctfold f []
  where
  f p e acc = (getLoc e, concatMap (\c -> c p e) ps) : acc
  getLoc = infoSpan . texprInfo

bool2double :: Bool -> Double
bool2double b = if b then 1 else 0

count_op :: Bop -> Expr -> Double
count_op b = getSum . fold f mempty
  where
  f e acc = acc <> case e of
                     Bop _ b' _ _ -> Sum . bool2double $  b == b'
                     _            -> mempty

count_con :: DCon -> Expr -> Double
count_con c = getSum . fold f mempty
  where
  f e acc = acc <> case e of
                     ConApp _ c' _ _ -> Sum . bool2double $ c == c'
                                       -- FIXME
                     Case _ _ as -> Sum . bool2double $ any (pat_has_con c) (map fst3 as)
                     Tuple _ _ -> Sum . bool2double $ c == "(,)"
                     List _ _ _ -> Sum . bool2double $ c == "::" || c == "[]"
                     _ -> mempty

count_fun :: Expr -> Double
count_fun = getSum . fold f mempty
  where
  f e acc = acc <> case e of
                     Lam {} -> Sum 1
                     App {} -> Sum 1
                     _ -> mempty

has_op :: Bop -> Expr -> Double
has_op b = bool2double . getAny . fold f mempty
  where
  f e acc = acc <> case e of
                     Bop _ b' _ _ -> Any $ b == b'
                     _            -> mempty

has_con :: DCon -> Expr -> Double
has_con c = bool2double . getAny . fold f mempty
  where
  f e acc = acc <> case e of
                     ConApp _ c' _ _ -> Any $ c == c'
                     Case _ _ as -> Any $ any (pat_has_con c) (map fst3 as)
                     Tuple _ _ -> Any $ c == "(,)"
                     List _ _ _ -> Any $ c == "::" || c == "[]"
                     _ -> mempty

has_fun :: Expr -> Double
has_fun = bool2double . getAny . fold f mempty
  where
  f e acc = acc <> case e of
                     Lam {} -> Any True
                     App {} -> Any True
                     _ -> mempty

thas_op :: Bop -> TExpr -> Double
thas_op b = bool2double . getAny . tfold f mempty
  where
  f e acc = acc <> case e of
                     T_Bop _ b' _ _ -> Any $ b == b'
                     _            -> mempty

thas_con :: DCon -> TExpr -> Double
thas_con c = bool2double . getAny . tfold f mempty
  where
  f e acc = acc <> case e of
                     T_ConApp _ c' _ -> Any $ c == c'
                     T_Tuple _ _ -> Any $ c == "(,)"
                     T_List _ _ -> Any $ c == "::" || c == "[]"
                     _ -> mempty

thas_con_case :: DCon -> TExpr -> Double
thas_con_case c = bool2double . getAny . tfold f mempty
  where
  f e acc = acc <> case e of
                     T_Case _ _ as -> Any $ any (pat_has_con c) (map fst3 as)
                     _ -> mempty

thas_var :: TExpr -> Double
thas_var = bool2double . getAny . tfold f mempty
  where
  f e acc = acc <> case e of
                     T_Var {} -> Any True
                     _ -> mempty

thas_fun :: TExpr -> Double
thas_fun = bool2double . getAny . tfold f mempty
  where
  f e acc = acc <> case e of
                     T_Lam {} -> Any True
                     _ -> mempty

thas_app :: TExpr -> Double
thas_app = bool2double . getAny . tfold f mempty
  where
  f e acc = acc <> case e of
                     T_App {} -> Any True
                     _ -> mempty

tsize :: Feature
tsize = ( ["Expr-Size"], size )
  where
  size _ e = [getSum $ tfold (const (+1)) (0 :: Sum Double) e]

thas_op_ctx :: Bop -> Feature -- TExpr -> TExpr -> [Double]
thas_op_ctx b = ( mkContextLabels ("Has-" ++ show b), mkContextFeatures (thas_op b) )

thas_con_ctx :: DCon -> Feature
thas_con_ctx c = ( mkContextLabels ("Has-" ++ c), mkContextFeatures (thas_con c) )

thas_con_case_ctx :: DCon -> Feature
thas_con_case_ctx c = ( mkContextLabels ("Has-" ++ c ++ "-Case"), mkContextFeatures (thas_con_case c) )

thas_var_ctx :: Feature
thas_var_ctx = ( mkContextLabels "Has-Var", mkContextFeatures thas_var )

thas_fun_ctx :: Feature
thas_fun_ctx = ( mkContextLabels "Has-Fun", mkContextFeatures thas_fun )

thas_app_ctx :: Feature
thas_app_ctx = ( mkContextLabels "Has-App", mkContextFeatures thas_app )

mkTHas :: (TExpr -> Double) -> TExpr -> Double
mkTHas mkF = bool2double . getAny . tfold f mempty
  where
  f e acc = acc <> Any (mkF e == 1)

mkTCount :: (TExpr -> Double) -> TExpr -> Double
mkTCount mkF = getSum . tfold f mempty
  where
  f e acc = acc <> Sum (mkF e)

thas_lit_int :: TExpr -> Double
thas_lit_int = mkTHas tis_lit_int
thas_lit_float :: TExpr -> Double
thas_lit_float = mkTHas tis_lit_float
thas_lit_bool :: TExpr -> Double
thas_lit_bool = mkTHas tis_lit_bool
thas_lit_char :: TExpr -> Double
thas_lit_char = mkTHas tis_lit_char
thas_lit_string :: TExpr -> Double
thas_lit_string = mkTHas tis_lit_string

thas_lit_int_ctx :: Feature
thas_lit_int_ctx = ( mkContextLabels "Has-Lit-Int", mkContextFeatures thas_lit_int )
thas_lit_float_ctx :: Feature
thas_lit_float_ctx = ( mkContextLabels "Has-Lit-Float", mkContextFeatures thas_lit_float )
thas_lit_bool_ctx :: Feature
thas_lit_bool_ctx = ( mkContextLabels "Has-Lit-Bool", mkContextFeatures thas_lit_bool )
thas_lit_char_ctx :: Feature
thas_lit_char_ctx = ( mkContextLabels "Has-Lit-Char", mkContextFeatures thas_lit_char )
thas_lit_string_ctx :: Feature
thas_lit_string_ctx = ( mkContextLabels "Has-Lit-String", mkContextFeatures thas_lit_string )

thas_con_any :: TExpr -> Double
thas_con_any = mkTHas tis_con_any
thas_anycon_ctx :: Feature
thas_anycon_ctx = ( mkContextLabels ("Has-Con"), mkContextFeatures thas_con_any )

thas_con_case_any :: TExpr -> Double
thas_con_case_any = mkTHas tis_con_case_any
thas_anycon_case_ctx :: Feature
thas_anycon_case_ctx = ( mkContextLabels ("Has-Case"), mkContextFeatures thas_con_case_any )


thas_ite :: TExpr -> Double
thas_ite = mkTHas tis_ite
thas_ite_ctx :: Feature
thas_ite_ctx = ( mkContextLabels "Has-Ite", mkContextFeatures thas_ite )

thas_let :: TExpr -> Double
thas_let = mkTHas tis_let
thas_let_ctx :: Feature
thas_let_ctx = ( mkContextLabels "Has-Let", mkContextFeatures thas_let )

thas_seq :: TExpr -> Double
thas_seq = mkTHas tis_seq
thas_seq_ctx :: Feature
thas_seq_ctx = ( mkContextLabels "Has-Seq", mkContextFeatures thas_seq )

pat_has_con :: DCon -> Pat -> Bool
pat_has_con c p' = case p' of
  ConPat _ c' mp -> c == c' || maybe False (pat_has_con c) mp
  ConsPat _ p1 p2 -> c == "::" || pat_has_con c p1 || pat_has_con c p2
  ListPat _ ps -> any (pat_has_con c) ps
  TuplePat _ ps -> c == "(,)" || any (pat_has_con c) ps
  OrPat _ p1 p2 -> pat_has_con c p1 || pat_has_con c p2
  AsPat _ p _ -> pat_has_con c p
  ConstraintPat _ p _ -> pat_has_con c p
  _ -> False


tcount_op :: Bop -> TExpr -> Double
tcount_op = mkTCount . tis_op
tcount_op_ctx :: Bop -> Feature
tcount_op_ctx c = ( mkContextLabels ("Count-"++show c), mkContextFeatures (tcount_op c) )

tcount_con :: DCon -> TExpr -> Double
tcount_con = mkTCount . tis_con
tcount_con_any :: TExpr -> Double
tcount_con_any = mkTCount tis_con_any
tcount_con_ctx :: DCon -> Feature
tcount_con_ctx c = ( mkContextLabels ("Count-"++c), mkContextFeatures (tcount_con c) )
tcount_anycon_ctx :: Feature
tcount_anycon_ctx = ( mkContextLabels ("Count-Con"), mkContextFeatures tcount_con_any )

tcount_con_case :: DCon -> TExpr -> Double
tcount_con_case = mkTCount . tis_con_case
tcount_con_case_any :: TExpr -> Double
tcount_con_case_any = mkTCount tis_con_case_any
tcount_con_case_ctx :: DCon -> Feature
tcount_con_case_ctx c = ( mkContextLabels ("Count-"++c++"-Case"), mkContextFeatures (tcount_con_case c) )
tcount_anycon_case_ctx :: Feature
tcount_anycon_case_ctx = ( mkContextLabels ("Count-Case"), mkContextFeatures tcount_con_case_any )

tcount_fun :: TExpr -> Double
tcount_fun = mkTCount tis_fun
tcount_fun_ctx :: Feature
tcount_fun_ctx = ( mkContextLabels "Count-Fun", mkContextFeatures tcount_fun )

tcount_app :: TExpr -> Double
tcount_app = mkTCount tis_app
tcount_app_ctx :: Feature
tcount_app_ctx = ( mkContextLabels "Count-App", mkContextFeatures tcount_app )

tcount_let :: TExpr -> Double
tcount_let = mkTCount tis_let
tcount_let_ctx :: Feature
tcount_let_ctx = ( mkContextLabels "Count-Let", mkContextFeatures tcount_let )

tcount_var :: TExpr -> Double
tcount_var = mkTCount tis_var
tcount_var_ctx :: Feature
tcount_var_ctx = ( mkContextLabels "Count-Var", mkContextFeatures tcount_var )

tcount_lit_int :: TExpr -> Double
tcount_lit_int = mkTCount tis_lit_int
tcount_lit_float :: TExpr -> Double
tcount_lit_float = mkTCount tis_lit_float
tcount_lit_bool :: TExpr -> Double
tcount_lit_bool = mkTCount tis_lit_bool
tcount_lit_char :: TExpr -> Double
tcount_lit_char = mkTCount tis_lit_char
tcount_lit_string :: TExpr -> Double
tcount_lit_string = mkTCount tis_lit_string

tcount_lit_int_ctx :: Feature
tcount_lit_int_ctx = ( mkContextLabels "Count-Lit-Int", mkContextFeatures tcount_lit_int )
tcount_lit_float_ctx :: Feature
tcount_lit_float_ctx = ( mkContextLabels "Count-Lit-Float", mkContextFeatures tcount_lit_float )
tcount_lit_bool_ctx :: Feature
tcount_lit_bool_ctx = ( mkContextLabels "Count-Lit-Bool", mkContextFeatures tcount_lit_bool )
tcount_lit_char_ctx :: Feature
tcount_lit_char_ctx = ( mkContextLabels "Count-Lit-Char", mkContextFeatures tcount_lit_char )
tcount_lit_string_ctx :: Feature
tcount_lit_string_ctx = ( mkContextLabels "Count-Lit-String", mkContextFeatures tcount_lit_string )

tcount_ite :: TExpr -> Double
tcount_ite = mkTCount tis_ite
tcount_ite_ctx :: Feature
tcount_ite_ctx = ( mkContextLabels "Count-Ite", mkContextFeatures tcount_ite )

tcount_seq :: TExpr -> Double
tcount_seq = mkTCount tis_seq
tcount_seq_ctx :: Feature
tcount_seq_ctx = ( mkContextLabels "Count-Seq", mkContextFeatures tcount_seq )

tis_op :: Bop -> TExpr -> Double
tis_op b e = case e of
  T_Bop _ b' _ _ -> bool2double $ b == b'
  _            -> 0

tis_con :: DCon -> TExpr -> Double
tis_con c e = case e of
  T_ConApp _ c' _ -> bool2double $ c == c'
  T_Tuple _ _ -> bool2double $ c == "(,)"
  T_List _ _ -> bool2double $ c == "::" || c == "[]"
  _ -> 0

tis_con_any :: TExpr -> Double
tis_con_any e = case e of
  T_ConApp _ _ _ -> 1
  T_Tuple _ _ -> 1
  T_List _ _ -> 1
  _ -> 0

tis_con_case :: DCon -> TExpr -> Double
tis_con_case c e = case e of
  T_Case _ _ as -> bool2double $ any (pat_has_con c) (map fst3 as)
  _ -> 0

tis_con_case_any :: TExpr -> Double
tis_con_case_any e = case e of
  T_Case _ _ _ -> 1
  _ -> 0

tis_var :: TExpr -> Double
tis_var e = case e of
  T_Var {} -> bool2double True
  _ -> 0

tis_fun :: TExpr -> Double
tis_fun e = case e of
  T_Lam {} -> bool2double True
  _ -> 0

tis_app :: TExpr -> Double
tis_app e = case e of
  T_App {} -> bool2double True
  _ -> 0

tis_lit_int :: TExpr -> Double
tis_lit_int e = case e of
  T_Lit _ (LI {}) -> 1
  _               -> 0
tis_lit_float :: TExpr -> Double
tis_lit_float e = case e of
  T_Lit _ (LD {}) -> 1
  _               -> 0
tis_lit_bool :: TExpr -> Double
tis_lit_bool e = case e of
  T_Lit _ (LB {}) -> 1
  _               -> 0
tis_lit_char :: TExpr -> Double
tis_lit_char e = case e of
  T_Lit _ (LC {}) -> 1
  _               -> 0
tis_lit_string :: TExpr -> Double
tis_lit_string e = case e of
  T_Lit _ (LS {}) -> 1
  _               -> 0

tis_ite :: TExpr -> Double
tis_ite e = case e of
  T_Ite {} -> bool2double True
  _ -> 0

tis_let :: TExpr -> Double
tis_let e = case e of
  T_Let {} -> bool2double True
  _ -> 0

tis_seq :: TExpr -> Double
tis_seq e = case e of
  T_Seq {} -> bool2double True
  _ -> 0

mkContextLabels :: String -> [String]
mkContextLabels l = [l, l++"-P", l++"-C1", l++"-C2", l++"-C3"]

mkContextFeatures :: (TExpr -> Double) -> TExpr -> TExpr -> [Double]
mkContextFeatures mkF p e =
  [mkF e, mkF p] ++ take 3 (map mkF (children e) ++ repeat 0)


tis_op_ctx :: Bop -> Feature -- TExpr -> TExpr -> [Double]
tis_op_ctx b = ( mkContextLabels ("Is-" ++ show b), mkContextFeatures (tis_op b) )
-- tis_op_ctx b p e = [tis_op b e, tis_op b p]
--                  ++ take 3 (map (tis_op b) (children e) ++ repeat 0)

tis_con_ctx :: DCon -> Feature -- ([String], TExpr -> TExpr -> [Double])
tis_con_ctx c = ( mkContextLabels lbl, mkContextFeatures (tis_con c) )
  where
  lbl = "Is-" ++ c

tis_anycon_ctx :: Feature -- ([String], TExpr -> TExpr -> [Double])
tis_anycon_ctx = ( mkContextLabels lbl, mkContextFeatures tis_con_any )
  where
  lbl = "Is-Con"

tis_con_case_ctx :: DCon -> Feature
tis_con_case_ctx c = ( mkContextLabels lbl, mkContextFeatures (tis_con_case c) )
  where
  lbl = "Is-" ++ c ++ "-Case"

tis_anycon_case_ctx :: Feature
tis_anycon_case_ctx = ( mkContextLabels lbl, mkContextFeatures tis_con_case_any )
  where
  lbl = "Is-Case"

tis_var_ctx :: Feature -- TExpr -> TExpr -> [Double]
tis_var_ctx = ( mkContextLabels "Is-Var", mkContextFeatures tis_var )

tis_fun_ctx :: Feature -- TExpr -> TExpr -> [Double]
tis_fun_ctx = ( mkContextLabels "Is-Fun", mkContextFeatures tis_fun )

tis_app_ctx :: Feature -- TExpr -> TExpr -> [Double]
tis_app_ctx = ( mkContextLabels "Is-App", mkContextFeatures tis_app )

tis_lit_int_ctx :: Feature --  TExpr -> TExpr -> [Double]
tis_lit_int_ctx = ( mkContextLabels "Is-Lit-Int", mkContextFeatures tis_lit_int )
tis_lit_float_ctx :: Feature --  TExpr -> TExpr -> [Double]
tis_lit_float_ctx = ( mkContextLabels "Is-Lit-Float", mkContextFeatures tis_lit_float )
tis_lit_bool_ctx :: Feature --  TExpr -> TExpr -> [Double]
tis_lit_bool_ctx = ( mkContextLabels "Is-Lit-Bool", mkContextFeatures tis_lit_bool )
tis_lit_char_ctx :: Feature --  TExpr -> TExpr -> [Double]
tis_lit_char_ctx = ( mkContextLabels "Is-Lit-Char", mkContextFeatures tis_lit_char )
tis_lit_string_ctx :: Feature --  TExpr -> TExpr -> [Double]
tis_lit_string_ctx = ( mkContextLabels "Is-Lit-String", mkContextFeatures tis_lit_string )

tis_ite_ctx :: Feature -- TExpr -> TExpr -> [Double]
tis_ite_ctx = ( mkContextLabels "Is-Ite", mkContextFeatures tis_ite )

tis_let_ctx :: Feature -- TExpr -> TExpr -> [Double]
tis_let_ctx = ( mkContextLabels "Is-Let", mkContextFeatures tis_let )

tis_seq_ctx :: Feature -- TExpr -> TExpr -> [Double]
tis_seq_ctx = ( mkContextLabels "Is-Seq", mkContextFeatures tis_seq )

diff :: Expr -> Expr -> Set SrcSpan
diff e1 e2 = case (e1, e2) of
  (Var lx x, Var ly y)
    | x == y
      -> mempty
  (Lam lx px x _, Lam ly py y _)
    | px == py
      -> diff x y
  (App lx fx ax, App ly fy ay)
    | length ax == length ay
      -> merge $ (diff fx fy) : (zipWith diff ax ay)
  (Bop lx bx x1 x2, Bop ly by y1 y2)
    | bx == by
      -> merge [diff x1 y1, diff x2 y2]
  (Uop lx ux x, Uop ly uy y)
    | ux == uy
      -> diff x y
  (Lit lx x, Lit ly y)
    | x == y
      -> mempty
  (Let lx rx xbs x, Let ly ry ybs y)
    | rx == ry && length xbs == length ybs && map fst xbs == map fst ybs
      -> merge $ diff x y : zipWith diff (map snd xbs) (map snd ybs)
  (Ite lx bx tx fx, Ite ly by ty fy)
      -> merge $ [diff bx by, diff tx ty, diff fx fy]
  (Seq lx x1 x2, Seq ly y1 y2)
      -> merge $ [diff x1 y1, diff x2 y2]
  (Case lx x axs, Case ly y ays)
    | length axs == length ays && map fst3 axs == map fst3 ays && map snd3 axs == map snd3 ays
      -> merge $ diff x y : zipWith diff (map thd3 axs) (map thd3 ays)
  (Tuple lx xs, Tuple ly ys)
    | length xs == length ys
      -> merge (zipWith diff xs ys)
  (List lx xs _, List ly ys _)
    | length xs == length ys
      -> merge (zipWith diff xs ys)
  (Array lx xs _, Array ly ys _)
    | length xs == length ys
      -> merge (zipWith diff xs ys)
  (ConApp lx cx mx mtx, ConApp ly cy my mty)
    | cx == cy -> if
        | Just x <- mx, Just y <- my
          -> diff x y
        | Nothing <- mx, Nothing <- my
          -> mempty
        | otherwise
          -> Set.singleton (fromJust lx)
  (Record lx fxs mtx, Record ly fys mty)
    | map fst fxs == map fst fys
      -> merge (zipWith diff (map snd fxs) (map snd fys))
  (Prim1 lx (P1 vx _ _), Prim1 ly (P1 vy _ _))
    | vx == vy
      -> mempty
  (Prim2 lx (P2 vx _ _ _), Prim2 ly (P2 vy _ _ _))
    | vx == vy
      -> mempty
  -- (Val _ x, Val _ y)
  --   | x == y
  --     -> Nothing
  -- (With lx ex x, With ly ey y)
  --   | lx == ly && envId ex == envId ey
  --     -> diff x y
  -- (Replace lx ex x, Replace ly ey y)
  --   | lx == ly && envId ex == envId ey
  --     -> diff x y
  -- (_, Replace _ _ _)
  --   -> Just (e1, e2)
  -- (Replace _ env' _, _)
  --   -> Just (e1, e2)
  _ -> Set.singleton $ fromJust $ getSrcSpanExprMaybe e1

  where
  merge = mconcat
  -- merge ls = case catMaybes ls of
  --   -- no diff in subexprs => no diff
  --   []  -> Nothing
  --   -- diff in *one* subexpr => that expr
  --   [x] -> Just x
  --   -- diff in *multiple* subexprs => parent expr
  --   _   -> getSrcSpanExprMaybe e1

-- | Diff two programs by declaration group, and return a set of
-- spans that have changed in the first program.
diffProg :: Prog -> Prog -> Set SrcSpan
-- we're really only interested in *deletions* from the bad program
-- diffProg []  _   = mempty
-- diffProg bad []  _ foldr joinSrcSpan (map getSrcSpan bad)
-- diffProg bad fix = case (bad, fix) of
--   (DFun x1 y1 ((p1, e1):pes1) : _, DFun x2 y2 ((p2,e2):pes2) : _)
--     | p1 == p2
--       -> diff e1 e2 <> diffProg (DFun x1 y1 pes1) (DFun x2 y2 pes2)
--   (DFun _ _ [] : bad', DFun _ _ [] : fix')
--     -> diffProg bad' fix'

-- diffOne :: Decl -> Prog -> Set SrcSpan
-- diffOne (DFun x1 y1 ((p1, e1):pes1)) [] = x1
-- diffOne (DFun x1 y1 ((p1, e1):pes1)) (DFun x2 y2 ((p2, e2)):pes1) = x1

diffProg p1 p2 = mconcat $ map go p1
  where
  go (DFun _ _ pes) = mconcat $ map to pes
  go _              = mempty

  to (VarPat _ v, e1)
    | Just e2 <- lookup v p2ves
    = diff e1 e2
  to _
    = mempty

  p2ves = [(v,e) | DFun _ _ pes <- p2, (VarPat _ v, e) <- pes]

  -- merge ls = case catMaybes ls of
  --   -- no diff in subexprs => no diff
  --   []  -> Nothing
  --   -- diff in *one* subexpr => that expr
  --   [x] -> Just x
  --   -- diff in *multiple* subexprs => parent expr
  --   _   -> Just $ joinSrcSpan (getSrcSpan (head p1)) (getSrcSpan (last p1))

diffDecl :: Decl -> Decl -> Set SrcSpan
diffDecl d1 d2 = case (d1, d2) of
  (DFun _ r1 pes1, DFun _ r2 pes2)
    | r1 == r2 && map fst pes1 == map fst pes2
    -> mconcat $ zipWith (\(_,e1) (_,e2) -> diff e1 e2) pes1 pes2
  (DEvl _ e1, DEvl _ e2)
    -> diff e1 e2
  _ -> mempty
  where
  -- merge ls = case catMaybes ls of
  --   -- no diff in subexprs => no diff
  --   []  -> Nothing
  --   -- diff in *one* subexpr => that expr
  --   [x] -> Just x
  --   -- diff in *multiple* subexprs => parent expr
  --   _   -> Just $ getSrcSpan d1

type TProg = [TDecl]

data TDecl
  = TDFun SrcSpan RecFlag [(Pat,TExpr)]
  | TDEvl SrcSpan TExpr
  | TDTyp SrcSpan [TypeDecl]
  | TDExn SrcSpan DataDecl
  deriving (Show, Eq, Data, Generic)
instance Hashable TDecl

typeProg :: MonadEval m => Prog -> m (TProg, [Set Constraint])
typeProg p = do
  -- env <- fmap (concat . catMaybes) $ forM primVarTypes $ \(var, val) -> do
  --   -- traceM var
  --   fmap (Just . fst) (typeRecBinds [(VarPat Nothing var, val)])
  --     `catchError` \e -> return Nothing
  -- let t_fl = fromJust $ lookup "List.fold_left" env
  -- traceShowM . pretty =<< substM t_fl
  -- let t_fr = fromJust $ lookup "List.fold_right" env
  -- traceShowM . pretty =<< substM t_fr
  withLocalBinds primVarTypes $ do
    tp <- mapM typeDecl p
    -- env <- gets stSubst
    -- traceShowM ("stSubst", pretty env)
    cts <- gets stConstraints
    -- mapM_ traceShowM cts
    solveCts True cts
    cs <- gets stUnsatCores
    tp' <- forM tp $ \ td -> case td of
      TDFun {} -> everywhereM (mkM substM) td
      TDEvl {} -> everywhereM (mkM substM) td
      -- don't look at TDTyp or TDExn, they contain bottoms
      _ -> return td
    return (tp', cs)

typeDecl :: MonadEval m => Decl -> m TDecl
typeDecl = \case
  DFun s r pes -> withCurrentExpr (VU (Just s)) $ do
    -- NOTE: don't forget to generalize
    (bnds, ptes) <- case r of
      Rec -> typeRecBinds pes
      NonRec -> first concat . unzip <$> mapM typeBind pes
    modify' $ \ s -> s { stVarTypes = foldr (uncurry Map.insert) (stVarTypes s) bnds }
    return (TDFun s r ptes)
  DEvl s e -> do
    te <- typeExpr e
    return (TDEvl s te)
  DTyp s tds -> do
    mapM_ addType tds
    return (TDTyp s tds)
  DExn s d -> error "typeDecl: impossible"


data Info = MkInfo
  { infoSpan :: SrcSpan
  , infoType :: Type
  } deriving (Show, Data, Generic, Eq)
instance Hashable Info

mkInfo :: MSrcSpan -> Type -> Info
mkInfo ml t = MkInfo (fromJust ml) t

data TExpr
  = T_Var !Info !Var
  | T_Lam !Info !Pat !TExpr
  | T_App !Info !TExpr [TExpr]
  | T_Bop !Info !Bop !TExpr !TExpr
  | T_Uop !Info !Uop !TExpr
  | T_Lit !Info !Literal
  | T_Let !Info !RecFlag [(Pat,TExpr)] !TExpr
  | T_Ite !Info !TExpr !TExpr !TExpr
  | T_Seq !Info !TExpr !TExpr
  | T_Case !Info !TExpr [TAlt]
  | T_Tuple !Info [TExpr]
  | T_ConApp !Info !DCon (Maybe TExpr)
  | T_Record !Info [(String, TExpr)]
  | T_Field !Info !TExpr !String
  | T_SetField !Info !TExpr !String !TExpr
  | T_Array !Info [TExpr]
  | T_List !Info [TExpr]
  | T_Try !Info !TExpr [TAlt]
  deriving (Show, Data, Generic, Eq)
instance Hashable TExpr

type TAlt = (Pat, Maybe TExpr, TExpr)

texprInfo :: TExpr -> Info
texprInfo = \case
  T_Var i _ -> i
  T_Lam i _ _ -> i
  T_App i _ _ -> i
  T_Bop i _ _ _ -> i
  T_Uop i _ _ -> i
  T_Lit i _ -> i
  T_Let i _ _ _ -> i
  T_Ite i _ _ _ -> i
  T_Seq i _ _ -> i
  T_Case i _ _ -> i
  T_Tuple i _ -> i
  T_ConApp i _ _ -> i
  T_Record i _ -> i
  T_Field i _ _ -> i
  T_SetField i _ _ _ -> i
  T_Array i _ -> i
  T_List i _ -> i
  T_Try i _ _ -> i


ctfold :: Monoid a => (TExpr {- parent -} -> TExpr -> a -> a) -> a -> TExpr -> a
ctfold f z r = go r r
  where
  go p e' = f p e' $ case e' of
    T_Var {} -> z
    T_Lam _ _ b -> go e' b
    T_App _ f es -> mconcat $ map (go e') (f:es)
    T_Bop _ _ e1 e2 -> mappend (go e' e1) (go e' e2)
    T_Uop _ _ e -> go e' e
    T_Lit {} -> z
    T_Let _ _ pes e -> mconcat (map (go e' . snd) pes ++ [go e' e])
    T_Ite _ x y z -> go e' x <> go e' y <> go e' z
    T_Seq _ e1 e2 -> mappend (go e' e1) (go e' e2)
    T_Case _ e as -> mconcat (go e' e : map (go e' . thd3) as)
    T_Tuple _ es -> mconcat (map (go e') es)
    T_ConApp _ _ me -> maybe mempty (go e') me
    T_Record _ fes -> mconcat (map (go e' . snd) fes)
    T_Field _ e _ -> go e' e
    T_SetField _ e1 _ e2 -> mappend (go e' e1) (go e' e2)
    T_List _ es -> mconcat (map (go e') es)
    T_Array _ es -> mconcat (map (go e') es)
    T_Try _ e as -> mconcat (go e' e : map (go e' . thd3) as)

tfold :: Monoid a => (TExpr -> a -> a) -> a -> TExpr -> a
tfold f z r = ctfold (const f) z r

count_tcon :: TCon -> TExpr -> Double
count_tcon c = getSum . tfold f mempty
  where
  f e acc = acc <> case getType e of
                     TApp c' _ -> Sum . bool2double $ c == c'
                     TTup _ -> Sum . bool2double $ c == "Tuple"
                     _ :-> _ -> Sum . bool2double $ c == "Fun"
                     _ -> mempty

has_tcon :: TCon -> TExpr -> Double
has_tcon c = bool2double . (>0) . count_tcon c

is_tcon :: TCon -> TExpr -> Double
is_tcon c e = case getType e of
                TApp c' _ -> bool2double $ c == c'
                TTup _ -> bool2double $ c == "Tuple"
                _ :-> _ -> bool2double $ c == "Fun"
                _ -> 0

is_tcon_ctx :: TCon -> Feature -- TExpr {- parent -} -> TExpr -> [Double]
is_tcon_ctx c = ( mkContextLabels ("Is-Type-"++c), mkContextFeatures (is_tcon c) )
-- is_tcon_ctx c p e = [is_tcon c e, is_tcon c p]
--                  ++ take 3 (map (is_tcon c) (children e) ++ repeat 0)

is_tvar_ctx :: Feature
is_tvar_ctx = ( mkContextLabels "Is-Type-Var", mkContextFeatures is_tvar )

is_tvar :: TExpr -> Double
is_tvar e = case getType e of
              TVar _ -> bool2double True
              _ -> 0

children :: TExpr -> [TExpr]
children = \case
  T_Var {} -> []
  T_Lam _ _ b -> [b]
  T_App _ f es -> f:es -- NOTE: we may lose some information here by truncating `es`
  T_Bop _ _ x y -> [x,y]
  T_Uop _ _ e -> [e]
  T_Lit {} -> []
  T_Let _ _ pes e -> map snd pes ++ [e]
  T_Ite _ x y z -> [x,y,z]
  T_Seq _ x y -> [x,y]
  T_Case _ e as -> e : map thd3 as
  T_Tuple _ es -> es
  T_ConApp _ _ (Just (T_Tuple _ es)) -> es
  T_ConApp _ _ (Just e) -> [e]
  T_ConApp {} -> []
  T_Record _ fes -> map snd fes
  T_Field _ e _ -> [e]
  T_SetField _ x _ y -> [x,y]
  T_List _ es -> es
  T_Array _ es -> es
  T_Try _ e as -> e : map thd3 as



getType :: TExpr -> Type
getType = infoType . texprInfo

type TypeEnv = Map Var Type

lookupVarType :: MonadEval m => Var -> m Type
lookupVarType v = do
  env <- gets stVarTypes
  case Map.lookup v env of
    Just t  -> return t
    Nothing -> do
      otherError $ "unbound variable: " ++ v
      -- TODO: should be impossible..
      -- t <- TVar <$> freshTVar
      -- modify' $ \ s -> s { stVarTypes = Map.insert v t (stVarTypes s) }
      -- return t

-- TODO: do we want to do a traditional HM-style bottom-up inference, or
-- a bidirectional thing? since the interesting expressions will be
-- ill-typed, the choice may make a difference in how we type the bad bits
typeExpr :: MonadEval m => Expr -> m TExpr
-- for now let's do a bottom-up thing
typeExpr e = do
  e' <- withCurrentExpr e (typeExpr' e)
  -- t <- substM (getType e')
  -- traceShowM ("typeExpr", pretty e, pretty t)
  -- traceM ""
  return e'

typeExpr' :: MonadEval m => Expr -> m TExpr
typeExpr' in_e = do
  to <- TVar <$> freshTVar
  case in_e of
    Var ml v -> do
      t <- lookupVarType v >>= \t -> case t of
        TAll tvs t' -> do
          su <- fmap Map.fromList $ forM tvs $ \tv ->
            (tv,) . TVar <$> freshTVar
          return (subst su t')
        _ -> return t
      -- t <- makeType t -- NOTE: should this be a "hard" constraint?
      -- tryUnify to t
      emitCt to t
      -- let to = t
      -- traceShowM . ("VAR",v,,to) . pretty =<< substM t
      return (T_Var (mkInfo ml to) v)
    Lam ml p e _ -> do
      (ti, bnds) <- typePat p
      t <- TVar <$> freshTVar
      -- tryUnify to (ti :-> t)
      te <- withLocalBinds bnds $ typeExpr e
      emitCt to (ti :-> (getType te))
      return (T_Lam (mkInfo ml to) p te)
    App ml f es -> do
      -- t1 <- TVar <$> freshTVar
      tf <- typeExpr f
      -- traceShowM tf
      tes <- mapM typeExpr es
      emitCt (getType tf) (foldr (:->) to (map getType tes))
      -- zipWithM_ emitCt ts (map getType tes)
      -- tis <- replicateM (length es) (TVar <$> freshTVar)
      -- zipWithM tryUnify tis (map getType tes)
      -- traceM "APP"
      -- traceShowM . pretty =<< substM (getType tf)
      -- traceShowM . pretty =<< substM (foldr (:->) t (map getType tes))
      -- tryUnify (getType tf) (foldr (:->) to (map getType tes))
      -- traceShowM . pretty =<< substM (getType tf)
      -- traceShowM . pretty =<< substM (foldr (:->) t (map getType tes))
      return (T_App (mkInfo ml to) tf tes)
    Bop ml b e1 e2 -> do
      (t1, t2, t) <- if
        | b `elem` [Eq .. Ge]
          -> do { t <- TVar <$> freshTVar; return (t, t, tCon tBOOL) }
        | b `elem` [And, Or]
          -> return (tCon tBOOL, tCon tBOOL, tCon tBOOL)
        | b `elem` [Plus .. Mod]
          -> return (tCon tINT, tCon tINT, tCon tINT)
        | b `elem` [FPlus .. FExp]
          -> return (tCon tFLOAT, tCon tFLOAT, tCon tFLOAT)
      te1 <- typeExpr e1
      te2 <- typeExpr e2
      -- t1 <- makeType t1
      -- tryUnify t1 (getType te1)
      -- t2 <- makeType t2
      -- tryUnify t2 (getType te2)
      -- t <- makeType t
      -- tryUnify to t
      emitCt t1 (getType te1)
      emitCt t2 (getType te2)
      emitCt to t
      return (T_Bop (mkInfo ml to) b te1 te2)
    Uop ml u e -> do
      let t = case u of
                Neg -> tCon tINT
                FNeg -> tCon tFLOAT
      te <- typeExpr e
      -- tryUnify t (getType te)
      emitCt t (getType te)
      emitCt to t
      return (T_Uop (mkInfo ml to) u te)
    Lit ml l -> do
      let t = case l of
                LI {} -> tCon tINT
                LD {} -> tCon tFLOAT
                LB {} -> tCon tBOOL
                LC {} -> tCon tCHAR
                LS {} -> tCon tSTRING
      -- tryUnify to t
      emitCt to t
      return (T_Lit (mkInfo ml to) l)
    Let ml r pes e -> do
      -- NOTE: don't forget to generalize
      (bnds, ptes) <- case r of
        Rec -> typeRecBinds pes
        NonRec -> first concat . unzip <$> mapM typeBind pes
      te <- withLocalBinds bnds $ typeExpr e
      -- tryUnify to (getType te)
      emitCt to (getType te)
      -- let to = getType te
      return (T_Let (mkInfo ml to) r ptes te)
    Ite ml b t f -> do
      tb <- typeExpr b
      tt <- typeExpr t
      tf <- typeExpr f
      -- tryUnify (getType tb) (tCon tBOOL)
      -- tryUnify to (getType tt)
      -- tryUnify to (getType tf)
      emitCt (getType tb) (tCon tBOOL)
      emitCt to (getType tt)
      emitCt to (getType tf)
      return (T_Ite (mkInfo ml to) tb tt tf)
    Seq ml e1 e2 -> do
      te1 <- typeExpr e1
      emitCt (tCon tUNIT) (getType te1)
      te2 <- typeExpr e2
      emitCt to (getType te2)
      -- let to = getType te2
      return (T_Seq (mkInfo ml to) te1 te2)
    Case ml e as -> do
      t <- TVar <$> freshTVar
      te <- typeExpr e
      (tps, tas) <- unzip <$> mapM (`typeAlt` to) as
      -- mapM_ (tryUnify (getType te)) tps
      -- mapM_ (tryUnify to) (map (getType.thd3) tas)
      -- mapM_ (emitCt (getType te)) tps
      -- mapM_ (emitCt to) (map (getType.thd3) tas)
      forM_ (zip tps tas) $ \(tp, ta) -> do
        emitCt (getType te) tp
        emitCt to (getType (thd3 ta))
      return (T_Case (mkInfo ml to) te tas)
    Tuple ml es -> do
      ts <- replicateM (length es) (TVar <$> freshTVar)
      tes <- mapM typeExpr es
      -- tryUnify to (TTup ts)
      emitCt to (TTup (map getType tes))
      -- let to = TTup (map getType tes)
      return (T_Tuple (mkInfo ml to) tes)
    ConApp ml c me _ -> do
      d <- lookupDataCon c
      let tvs = tyVars (dType d)
      su <- fmap Map.fromList $ forM tvs $ \tv ->
        (tv,) . TVar <$> freshTVar
      let tis = map (subst su) (dArgs d)
          t   = subst su (typeDeclType (dType d))
      -- tryUnify to (subst su (typeDeclType (dType d)))
      mte <- case (tis, me) of
        ([], Nothing) -> do
          return Nothing
        ([ti], Just e) -> do
          te <- typeExpr e
          -- tryUnify t (getType te)
          emitCt ti (getType te)
          return (Just te)
        (ts, Just (Tuple ml' es)) -> do
          tes <- mapM typeExpr es
          -- tryUnify (foldr (:->) to tis) (foldr (:->) to (map getType tes))
          -- zipWithM_ tryUnify ts (map getType tes)
          zipWithM_ emitCt ts (map getType tes)
          -- emitCt (foldr (:->) t ts)
          --        (foldr (:->) to (map getType tes))
          return (Just (T_Tuple (mkInfo ml' (TTup ts)) tes))
        --FIXME: ??
        x -> trace ("typeExpr: ConApp: " ++ show (c, x)) $ return Nothing
      emitCt to t
      -- t <- makeType $ subst su (typeDeclType (dType d))
      -- emitCt to (subst su (typeDeclType (dType d)))
      return (T_ConApp (mkInfo ml to) c mte)
    Array ml es _ -> do
      t <- TVar <$> freshTVar
      tes <- mapM typeExpr es
      -- mapM_ (tryUnify t . getType) tes
      -- tryUnify to (mkTApps tARRAY [t])
      mapM_ (emitCt t . getType) tes
      emitCt to (mkTApps tARRAY [t])
      -- let to = mkTApps tARRAY [t]
      return (T_Array (mkInfo ml to) tes)
    List ml es _ -> do
      t <- TVar <$> freshTVar
      tes <- mapM typeExpr es
      -- mapM_ (tryUnify t . getType) tes
      -- tryUnify to (mkTApps tLIST [t])
      mapM_ (emitCt t . getType) tes
      emitCt to (mkTApps tLIST [t])
      -- let to = mkTApps tLIST [t]
      return (T_List (mkInfo ml to) tes)
    -- these should not occur in the dataset
    Try ml e as -> do
      otherError "typeExpr: impossible: try"
    Record ml fes _ -> do
      otherError "typeExpr: impossible: record"
    Field ml e f -> do
      otherError "typeExpr: impossible: field"
      -- te <- typeExpr e
      -- td@TypeDecl {tyCon, tyRhs = TRec fs} <- lookupField f
      -- let tvs = tyVars td
      -- su <- fmap Map.fromList $ forM tvs $ \tv ->
      --   (tv,) . TVar <$> freshTVar
      -- tryUnify (getType te) (subst su (typeDeclType td))
      -- let Just t = lookup f [(x,z) | (x,y,z) <- fs]
      -- return (T_Field (mkInfo ml t) te f)
    SetField ml e f v -> do
      otherError "typeExpr: impossible: setfield"
    -- these should not occur at all in freshly parsed programs
    Prim1 {} -> do
      otherError "typeExpr: impossible"
    Prim2 {} -> do
      otherError "typeExpr: impossible"
    With {} -> do
      otherError "typeExpr: impossible"
    Replace {} -> do
      otherError "typeExpr: impossible"
    Hole {} -> do
      otherError "typeExpr: impossible"
    Ref {} -> do
      otherError "typeExpr: impossible"

typePat :: MonadEval m => Pat -> m (Type, [(Var, Type)])
-- TODO: NEED CTS!!!!
typePat = \case
  VarPat _ v -> do
    t <- TVar <$> freshTVar
    return (t, [(v,t)])
  LitPat _ l -> do
    t <- makeType $ typeOfLit l
    return (t, [])
  IntervalPat _ l1 l2 -> do
    t1 <- makeType $ typeOfLit l1
    t2 <- makeType $ typeOfLit l2
    -- tryUnify t1 t2
    emitCt t1 t2
    return (t1, [])
  ConsPat _ p1 p2 -> do
    (t1, bnds1) <- typePat p1
    (t2, bnds2) <- typePat p2
    t <- makeType $ mkTApps tLIST [t1]
    -- tryUnify t t2
    emitCt t t2
    return (t, bnds1 ++ bnds2)
  ConPat _ c mp -> do
    d <- lookupDataCon c
    let tvs = tyVars (dType d)
    su <- fmap Map.fromList $ forM tvs $ \tv ->
      (tv,) . TVar <$> freshTVar
    let tis = map (subst su) (dArgs d)
    t <- makeType $ subst su (typeDeclType (dType d))
    bnds <- case (tis, mp) of
      ([], Nothing) -> return []
      ([ti], Just p) -> do
        (tp, bnds) <- typePat p
        -- tryUnify t tp
        emitCt ti tp
        return bnds
      (_, Just (TuplePat ml' ps)) -> do
        (tps, bndss) <- unzip <$> mapM typePat ps
        -- zipWithM tryUnify ts tps
        zipWithM_ emitCt tis tps
        return (concat bndss)
      --FIXME:
      x -> trace ("typePat: ConPat: " ++ show (c, x)) $ return []
    return (t, bnds)
  ListPat _ ps -> do
    (t:ts, bndss) <- unzip <$> mapM typePat ps
    -- mapM_ (tryUnify t) ts
    mapM_ (emitCt t) ts
    t <- makeType $ mkTApps tLIST [t]
    return (t, concat bndss)
  TuplePat _ ps -> do
    (ts, bndss) <- unzip <$> mapM typePat ps
    return (TTup ts, concat bndss)
  WildPat _ -> do
    t <- TVar <$> freshTVar
    return (t, [])
  OrPat _ p1 p2 -> do
    (tp1, bnds1) <- typePat p1
    (tp2, bnds2) <- typePat p2
    -- tryUnify tp1 tp2
    emitCt tp1 tp2
    return (tp1, bnds1 ++ bnds2)
  AsPat _ p v -> do
    (tp, bnds) <- typePat p
    return (tp, (v,tp) : bnds)
  ConstraintPat _ p t -> do
    (tp, bnds) <- typePat p
    -- tryUnify tp t
    emitCt tp t
    return (tp, bnds)

typeAlt :: MonadEval m => Alt -> Type -> m (Type, TAlt)
typeAlt (p, mg, e) t = do
  (tp, bnds) <- typePat p
  withLocalBinds bnds $ do
    tg <- case mg of
      Nothing -> return Nothing
      Just g  -> do
        tg <- typeExpr g
        -- tryUnify (tCon tBOOL) (getType tg)
        emitCt (getType tg) (tCon tBOOL)
        return (Just tg)
    te <- typeExpr e
    return (tp, (p, tg, te))

typeBind :: MonadEval m => (Pat, Expr) -> m ([(Var, Type)], (Pat, TExpr))
typeBind (p, e) = do
  (tp, bnds) <- typePat p
  te <- typeExpr e
  -- t <- substM (getType te)
  -- traceShowM (pretty p, pretty t)
  -- tryUnify tp (getType te)
  emitCt tp (getType te)
  return (bnds, (p, te))

typeRecBinds :: MonadEval m => [(Pat, Expr)]
             -> m ([(Var, Type)], [(Pat, TExpr)])
typeRecBinds pes = do
  let (ps, es) = unzip pes
  (tps, bndss) <- unzip <$> mapM typePat ps
  tes <- withLocalBinds (concat bndss) $
         forM (zip tps es) $ \ (tp, e) -> do
    te <- typeExpr e
    -- traceShowM ("typerec", pretty tp, pretty (getType te))
    -- tryUnify tp (getType te)
    emitCt tp (getType te)
    return te
  return (concat bndss, zip ps tes)
  -- mfix $ \ (bnds, _tpes) -> do
  --   withLocalBinds bnds $ first concat . unzip <$> mapM typeBind pes

-- | Try to unify two types but suppress any errors.
tryUnify :: (?cs :: CallStack) => MonadEval m => Type -> Type -> m ()
tryUnify t1 t2 = do
  prv <- getCurrentProv
  -- traceShowM (prv, t1, t2)
  pushConstraints (Set.singleton (mkConstraint prv t1 t2))
  unify t1 t2 `catchError` \e -> do
    t1' <- substM t1
    t2' <- substM t2
    -- traceShowM ("tryUnify", prv, pretty t1', pretty t2')
    -- traceShowM ("tryUnify", showCallStack ?cs, t1, t2)
    getUnsatCore >>= addUnsatCore
  popConstraints

withLocalBinds :: MonadEval m => [(Var, Type)] -> m a -> m a
withLocalBinds bnds do_this = do
  tenv <- gets stVarTypes
  modify' $ \ s -> s { stVarTypes = foldr (uncurry Map.insert) (stVarTypes s) bnds }
  a <- do_this
  modify' $ \ s -> s { stVarTypes = tenv }
  return a

makeType :: MonadEval m => Type -> m Type
makeType t = do
  tv <- TVar <$> freshTVar
  -- tryUnify tv t
  emitCt tv t
  return tv


-- type Diff = Set MSrcSpan

data Diff
  = Ins Expr Diff
  | Del Expr Diff
  | Cpy Expr Diff
  | End
  deriving Show

ins :: Expr -> Diff -> Diff
ins = Ins
del :: Expr -> Diff -> Diff
del = Del
cpy :: Expr -> Diff -> Diff
cpy = Cpy
end :: Diff
end = End

meet :: Diff -> Diff -> Diff
meet dx dy = if cost dx <= cost dy then dx else dy

data N = Z | S N deriving (Eq, Ord)

cost :: Diff -> N
cost = \case
  Ins e d -> S $ cost d
  Del e d -> S $ cost d
  Cpy e d -> S $ cost d
  End     -> Z

diffSpans :: Diff -> [Expr] -> Set SrcSpan
diffSpans d' es = Set.fromList . catMaybes $ go d' (concatMap allSubExprs es)
  where
  go _ [] = []
  go d' (x:xs) = case d' of
    Ins e d -> getSrcSpanMaybe x : go d (x:xs)
    Del e (Ins _ d) -> getSrcSpanMaybe e : go d xs
    Del e d -> getSrcSpanMaybe e : go d xs
    Cpy e d -> go d xs
    End -> [] -- WEIRD

  -- to d xs = case d of
  --   Ins e d -> to d xs
  --   Del e (Ins _ d) -> getSrcSpanMaybe e : to d xs
  --   -- Del e d -> getSrcSpanMaybe e : go d xs
  --   Cpy e d -> to d xs
  --   End -> []

  -- go = \case
  --   Ins e d -> getSrcSpanMaybe e : go d
  --   Del e d -> getSrcSpanMaybe e : go d
  --   Cpy e d -> go d -- getSrcSpanMaybe e : go d
  --   End     -> []

allSubExprs e = e : case e of
  Var {} -> []
  Lam _ _ x _ -> allSubExprs x
  App _ x xs -> allSubExprs x ++ concatMap allSubExprs xs
  Bop _ _ x y -> allSubExprs x ++ allSubExprs y
  Uop _ _ x -> allSubExprs x
  Lit {} -> []
  Let _ _ pes x -> concatMap (allSubExprs.snd) pes ++ allSubExprs x
  Ite _ x y z -> allSubExprs x ++ allSubExprs y ++ allSubExprs z
  Seq _ x y -> allSubExprs x ++ allSubExprs y
  Case _ x alts -> allSubExprs x ++ concatMap (allSubExprs.thd3) alts
  Tuple _ xs -> concatMap allSubExprs xs
  ConApp _ _ me _ -> case me of
    Nothing -> []
    Just (Tuple _ xs) -> concatMap allSubExprs xs
    Just x -> allSubExprs x
  List _ xs _ -> concatMap allSubExprs xs

progExprs :: Prog -> [Expr]
progExprs [] = []
progExprs (d:ds) = case d of
  DFun _ _ pes -> map snd pes ++ progExprs ds
  DEvl _ e -> e : progExprs ds
  _ -> progExprs ds

-- diffExprs :: [Expr] -> [Expr] -> Diff
-- diffExprs [] []
--   = end
-- diffExprs [] (y:yss)
--   = ins y (diffExprs [] yss)
-- diffExprs (x:xss) []
--   = del x (diffExprs xss [])
-- diffExprs (x:xss) (y:yss)
--   | exprKind x == exprKind y
--   , length xs == length ys   -- necessary for variadic ctors like case
--   = best_3
--   | otherwise
--   = best_2
--   where
--   xs = subExprs x
--   ys = subExprs y

--   best_2 = del x (diffExprs (xs ++ xss) (y : yss))
--            `meet`
--            ins y (diffExprs (x : xss) (ys ++ yss))
--   best_3 = cpy x (diffExprs (xs ++ xss) (ys ++ yss))
--            `meet` best_2

data DiffT
  = CC Expr Expr Diff DiffT DiffT DiffT
  | CN Expr Diff DiffT
  | NC Expr Diff DiffT
  | NN Diff

getDiff :: DiffT -> Diff
getDiff = \case
  CC _ _ d _ _ _ -> d
  CN _ d _ -> d
  NC _ d _ -> d
  NN d -> d

diffExprsT :: [Expr] -> [Expr] -> DiffT
diffExprsT [] []
  = NN end
diffExprsT (x:xss) []
  = let d = diffExprsT (subExprs x ++ xss) []
    in CN x (del x (getDiff d)) d
diffExprsT [] (y:yss)
  = let d = diffExprsT [] (subExprs y ++ yss)
    in NC y (ins y (getDiff d)) d
diffExprsT (x:xss) (y:yss)
  = CC x y (bestT x y i d c) i d c
  where
  xs = subExprs x
  ys = subExprs y

  c = diffExprsT (xs ++ xss) (ys ++ yss)
  i = extendi x c
  d = extendd y c

extendi :: Expr -> DiffT -> DiffT
extendi x dt = case dt of
  NN d     -> CN x (del x d) dt
  CN _ d _ -> CN x (del x d) dt
  _        -> extracti dt $ \y dt' ->
    let i = extendi x dt'
        d = dt
        c = dt'
    in CC x y (bestT x y i d c) i d c

extracti :: DiffT -> (Expr -> DiffT -> r) -> r
extracti dt k = case dt of
  CC _ y _ i _ _ -> k y i
  NC y _ i       -> k y i
  _              -> error "extracti"

extendd :: Expr -> DiffT -> DiffT
extendd y dt = case dt of
  NN d     -> NC y (ins y d) dt
  NC _ d _ -> NC y (ins y d) dt
  _        -> extractd dt $ \x dt' ->
    let i = dt
        d = extendd y dt'
        c = dt'
    in CC x y (bestT x y i d c) i d c

extractd :: DiffT -> (Expr -> DiffT -> r) -> r
extractd dt k = case dt of
  CC x _ _ _ d _ -> k x d
  CN x _ d       -> k x d
  _              -> error "extractd"

killSpans :: Expr -> Expr
killSpans = mapExpr $ onSrcSpanExpr (const Nothing)

-- filterDiff :: (Expr -> Bool) -> Diff -> Diff
-- filterDiff p = \case
--   End -> End
--   Ins y d -> (if p y then Ins y else id) (filterDiff p d)
--   Del x d -> (if p x then Del x else id) (filterDiff p d)
--   Cpy x d -> (if p x then Cpy x else id) (filterDiff p d)

-- collapseDiff :: Diff -> Diff
-- collapseDiff = \case
--   End -> End
--   Del x (Ins _ d) -> Del x (collapseDiff d)
--   Del x d -> Del x (collapseDiff d)
--   Ins x d -> Ins x (collapseDiff d)
--   Cpy x d -> Cpy x (collapseDiff d)

bestT :: Expr -> Expr -> DiffT -> DiffT -> DiffT -> Diff
bestT x y i d c
  --- | exprKind x == exprKind y
  -- , [x1, x2] <- subExprs x
  -- , [y1, y2] <- subExprs y
  -- -- can we override the behavior for swapping subtrees?
  -- , killSpans x1 == killSpans y2 && killSpans x2 == killSpans y1
  -- -- it's not a swap if both sides were the same
  -- , not (killSpans x1 == killSpans x2)
  -- = cpy x (del x1
  --           (ins y1
  --             (del x2
  --               (ins y2
  --                 (filterDiff (\z -> z `notElem` [x1,x2,y1,y2])
  --                   (getDiff c))))))
  | exprKind x == exprKind y
  , length (subExprs x) == length (subExprs y)
  = cpy x (getDiff c) -- del x (getDiff d) `meet` ins y (getDiff i)
  | otherwise
  = del x (getDiff d) `meet` ins y (getDiff i)
    -- `meet`

data ExprKind
  = VarK Var
  | LamK Pat
  | AppK
  | BopK Bop
  | UopK Uop
  | LitK Literal
  | LetK RecFlag [Pat]
  | IteK
  | SeqK
  | CaseK [Pat]
  | TupleK
  | ConAppK DCon
  | ListK
  deriving (Eq, Show)

exprKind :: Expr -> ExprKind
exprKind = \case
  Var _ v -> VarK v
  Lam _ p _ _ -> LamK (killSpanPat p)
  App {} -> AppK
  Bop _ b _ _ -> BopK b
  Uop _ u _ -> UopK u
  Lit _ l -> LitK l
  Let _ r pes _ -> LetK r (map fst pes)
  Ite {} -> IteK
  Seq {} -> SeqK
  Case _ _ as -> CaseK (map (killSpanPat . fst3) as)
  Tuple {} -> TupleK
  ConApp _ d _ _ -> ConAppK d
  List {} -> ListK
  e -> error ("exprKind: " ++ render (pretty e))

subExprs :: Expr -> [Expr]
subExprs = \case
  Var {} -> []
  Lam _ _ e _ -> [e]
  App _ e es -> e:es
  Bop _ _ x y -> [x,y]
  Uop _ _ x -> [x]
  Lit {} -> []
  Let _ _ pes e -> map snd pes ++ [e]
  Ite _ x y z -> [x,y,z]
  Seq _ x y -> [x,y]
  Case _ e as -> e : map thd3 as -- FIXME: guards
  Tuple _ es -> es
  ConApp _ _ me _ -> case maybeToList me of
    [Tuple _ es] -> es
    es -> es
  List _ es _ -> es

exprSize = const 1
--exprSize = getSum . fold (const (+1)) (0 :: Sum Int)

mapExpr :: (Expr -> Expr) -> Expr -> Expr
mapExpr f = go
  where
  go e = f $ case e of
    Lam ms p e' me -> Lam ms p (go e') me
    App ms e' e's -> App ms (go e') (map go e's)
    Bop ms b x y -> Bop ms b (go x) (go y)
    Uop ms u x -> Uop ms u (go x)
    Let ms r pes e' -> Let ms r (map (second go) pes) (go e')
    Ite ms x y z -> Ite ms (go x) (go y) (go z)
    Seq ms x y -> Seq ms (go x) (go y)
    Case ms e' as -> Case ms (go e') [(p, fmap go g, go x) | (p, g, x) <- as]
    Tuple ms es -> Tuple ms (map go es)
    ConApp ms d me mt -> ConApp ms d (fmap go me) mt
    List ms es mt -> List ms (map go es) mt
    -- FIXME: other cons
    _ -> e

killSpanPat :: Pat -> Pat
killSpanPat = go
  where
  go = \case
    VarPat _ v -> VarPat Nothing v
    LitPat _ l -> LitPat Nothing l
    IntervalPat _ l1 l2 -> IntervalPat Nothing l1 l2
    ConsPat _ x y -> ConsPat Nothing (go x) (go y)
    ConPat _ d mp -> ConPat Nothing d (fmap go mp)
    ListPat _ ps -> ListPat Nothing (map go ps)
    TuplePat _ ps -> TuplePat Nothing (map go ps)
    WildPat _ -> WildPat Nothing
    OrPat _ x y -> OrPat Nothing (go x) (go y)
    AsPat _ p v -> AsPat Nothing (go p) v
    ConstraintPat _ p t -> ConstraintPat Nothing (go p) t

Right foo1 = parseTopForm
  "let pipe fs =\
  \  let f a x = a x in\
  \  let base x = x in\
  \  List.fold_left f base fs"

Right foo2 = parseTopForm
  "let rec sepConcat sep sl=\
  \  match sl with\
  \  | [] -> \"\"\
  \  | h :: t -> let f a x = a ^ (sep ^ x) in\
  \              let base = h in\
  \              let l = sepConcat sep t in\
  \              List.fold_left f base l"

Right foo3 = parseTopForm
  "let rec sepConcat sep sl=\
  \  match sl with\
  \  | [] -> \"\"\
  \  | h :: t -> let f a x = h in\
  \              let base = \"\" in\
  \              let l = h ^ t in\
  \              List.fold_left f base l"

Right fl = parseTopForm "let x = List.fold_left"

Right foo4 = parseTopForm foo4'
foo4' =
  "let rec sepConcat =\
  \  fun sep ->\
  \    fun sl ->\
  \      match sl with\
  \      | [] -> \"\"\
  \      | h :: t -> (let f =\
  \                     fun a ->\
  \                       fun x -> a ^ (sep ^ x) in\
  \                   let base = h in\
  \                   let l = t in\
  \                   List.fold_left f base l)\
  \let stringOfList =\
  \  fun f ->\
  \    fun l ->\
  \      List.map (sepConcat \"\" l)"

Right foo5 = parseTopForm foo5'
foo5' =
  "let rec mulByDigit i l =\n\
  \  match List.rev l with\n\
  \  | [] -> []\n\
  \  | h::t -> [mulByDigit i t; (h * i) mod 10];;"

Right foo6 = parseTopForm foo6'
foo6' =
  "let rec foo x =\n\
  \  match x with | 0.0 -> 0 | _ -> let y = foo x in foo (y /. 2.0)\n"

Right foo7 = parseTopForm foo7'
foo7' =
  "let rec listReverse l =\n\
  \  match l with\n\
  \  | [] -> []\n\
  \  | hd::tl -> (listReverse tl) :: hd\n"

Right foo8 = parseTopForm foo8'
foo8' =
  "let rec listReverse l =\n\
  \  (List.tl l) :: List.hd l\n"

Right foo9 = parseTopForm foo9'
foo9' =
  "let rec sumList l =\n\
  \  match l with\n\
  \  | [] -> []\n\
  \  | hd::tl -> hd + sumList tl\n"

Right foo10 = parseTopForm foo10'
foo10' =
  "let rec fac x =\n\
  \  if x <= 0\n\
  \  then true\n\
  \  else x * fac (x-1)\n"

Right foo11 = parseTopForm foo11'
foo11' =
  "let rec fac x =\n\
  \  if x <= 0\n\
  \  then 0\n\
  \  else x * fac (x=1)\n"

Right foo12 = parseTopForm foo12'
foo12' =
  "let stringOfList f l =\n\
  \  \"[\" ^ (List.fold_right\n\
  \          (fun x acc -> x ^ (\"; \" ^ acc))\n\
  \          \"\"\n\
  \          (List.map f l) ^ \"]\")\n"

Right foo13 = parseTopForm foo13'
foo13' =
  "let removeDuplicates l =\n\
  \  let rec helper (seen,rest) =\n\
  \    match rest with\n\
  \    | [] -> seen\n\
  \    | h::t ->\n\
  \        let seen' = if List.mem l seen then seen else h :: seen in\n\
  \        let rest' = t in helper (seen', rest') in\n\
  \  List.rev (helper ([], l))\n"
