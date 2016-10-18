{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE MultiWayIf #-}
module NanoML.Classify where

import Control.Applicative
import Control.Monad
import qualified Data.Map.Strict as Map
import Data.Map.Strict (Map)
import Data.Maybe
import Data.Monoid
import qualified Data.Set as Set
import Data.Set (Set)

import NanoML.Parser
import NanoML.Types

import Debug.Trace

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

literalType :: Literal -> String
literalType l = case l of
  LI {} -> "Int"
  LD {} -> "Double"
  LB {} -> "Bool"
  LC {} -> "Char"
  LS {} -> "String"

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
