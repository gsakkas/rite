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
    Lam _ _ b _ -> go b
    App _ f es -> mconcat $ map go (f:es)
    Bop _ _ e1 e2 -> mappend (go e1) (go e2)
    Uop _ _ e -> go e
    Let _ _ pes e -> mconcat (map (go.snd) pes ++ [go e])
    Seq _ e1 e2 -> mappend (go e1) (go e2)
    Case _ e as -> mconcat (go e : map (go.thd3) as)
    Tuple _ es -> mconcat (map go es)
    ConApp _ _ me _ -> maybe mempty go me
    Record _ fes _ -> mconcat (map (go.snd) fes)
    Field _ e _ -> go e
    SetField _ e1 _ e2 -> mappend (go e1) (go e2)
    List _ es _ -> mconcat (map go es)
    Array _ es _ -> mconcat (map go es)
    _ -> z

-- TODO: rejigger to
-- classify :: [Expr -> Bool] -> Expr -> Map SrcLoc [Bool]
-- so we can iterate fast on different feature vectors
-- produce simple output for ML folks to consume,
-- ideally something like
-- type Check = Bool
-- type Feature = Bool (Float?)
-- [(Check, [Feature])]

classify :: [Expr -> Bool] -> Expr -> [(SrcSpan, [Bool])]
classify ps e' = (getLoc e', map ($e') ps) : case e' of
  Lam _ _ e _ -> classify ps e
  App _ f es  -> mconcat (classify ps f : map (classify ps) es)
  Bop _ _ e1 e2 -> mappend (classify ps e1) (classify ps e2)
  Uop _ _ e -> classify ps e
  Let _ _ pes e -> mconcat (classify ps e : map (classify ps . snd) pes)
  Seq _ e1 e2 -> mappend (classify ps e1) (classify ps e2)
  Case _ e as -> mconcat (classify ps e : map (classify ps . thd3) as)
  Tuple _ es -> mconcat (map (classify ps) es)
  ConApp _ _ me _ -> maybe mempty (classify ps) me
  Record _ fes _ -> mconcat (map (classify ps . snd) fes)
  Field _ e _ -> classify ps e
  SetField _ e1 _ e2 -> mappend (classify ps e1) (classify ps e2)
  List _ es _ -> mconcat (map (classify ps) es)
  Array _ es _ -> mconcat (map (classify ps) es)
  _ -> mempty

getLoc e = fromJust (getSrcSpanExprMaybe e)

-- classify :: Monoid a => (Expr -> a -> a) -> Expr -> Map String a
-- --classify f = fold do_one base
-- classify do_one = snd . go
--   where
--   base = Map.empty

--   --do_one e a = (fromJust (getSrcSpanExprMaybe e), f e a)

--   --go e = (do_one e, to e)

--   loc e = show (fromJust (getSrcSpanExprMaybe e))

--   go e = case e of
--     Var {}      -> merge e []
--     Lam _ _ b _ -> merge e (map go [b])
--     App _ f es  -> merge e (map go (f:es))
--     Bop _ _ x y -> merge e (map go [x,y])
--     Uop _ _ x   -> merge e (map go [x])
--     Lit {}      -> merge e [(mempty, Map.empty)]
--     Let _ _ pes b -> merge e (go b : map (go.snd) pes)
--     Seq _ x y   -> merge e (map go [x,y])
--     Case _ s as -> merge e (go s : map (go.thd3) as)
--     Tuple _ es  -> merge e (map go es)
--     ConApp _ _ b _ -> merge e (map go (maybeToList b))
--     Record _ fes _ -> merge e (map (go.snd) fes)
--     Field _ x _ -> merge e (map go [e])
--     SetField _ x _ y -> merge e (map go [x,y])
--     List _ es _ -> merge e (map go es)
--     -- FIXME: fill in a few more cases...
--     _           -> merge e []


--   merge e ars = case mconcat ars of
--     (a', r) -> let a = do_one e a' in (a, Map.insert (loc e) a r)

-- type OpVector = Map String Int

-- -- | Classify an 'Expr' by the operators in each subexpression.
-- --
-- -- Treats literals, constructors, and functions as pseudo-operators.
-- by_ops :: Expr -> Map String OpVector
-- by_ops = classify count_ops
--   where
--   count_ops e child = case e of
--     Lam {} -> Map.insertWith (+) "Fun" 1 child
--     App {} -> Map.insertWith (+) "Fun" 1 child
--     Bop _ b _ _ -> Map.insertWith (+) (show b) 1 child
--     Uop _ u _ -> Map.insertWith (+) (show u) 1 child
--     Lit _ l -> Map.insertWith (+) (literalType l) 1 child
--     Let _ _ pes _ -> Map.unionsWith (+) (child : map (patCons.fst) pes)
--     Ite {} -> Map.insertWith (+) "Ite" 1 child
--     Case _ _ as -> Map.unionsWith (+) (child : map (patCons.fst3) as)
--     Tuple _ es -> Map.insertWith (+) ("Tuple"++(show (length es))) 1 child
--     ConApp _ d _ _ -> Map.insertWith (+) d 1 child
--     Array _ _ _ -> Map.insertWith (+) "Array" 1 child
--     List _ _ _ -> Map.insertWith (+) "List" 1 child
--     -- FIXME: fill in a few more cases...
--     _ -> child

-- patCons :: Pat -> Map String Int
-- patCons p = case p of
--   LitPat _ l -> Map.insertWith (+) (literalType l) 1 mempty
--   IntervalPat _ l _ -> Map.insertWith (+) (literalType l) 1 mempty
--   ConsPat _ x y -> Map.insertWith (+) ("List") 1 (Map.union (patCons x) (patCons y))
--   ConPat _ d mp -> Map.insertWith (+) d 1 (maybe mempty patCons mp)
--   TuplePat _ ps -> Map.insertWith (+) ("Tuple"++(show (length ps))) 1
--                      (Map.unions (map patCons ps))
--   OrPat _ x y -> Map.union (patCons x) (patCons y)
--   AsPat _ p _ -> patCons p
--   -- FIXME
--   _ -> mempty

has_op :: Bop -> Expr -> Bool
has_op b = getAny . fold f mempty
  where
  f e acc = acc <> case e of
                     Bop _ b' _ _ -> Any $ b == b'
                     _ -> mempty

has_con :: DCon -> Expr -> Bool
has_con c = getAny . fold f mempty
  where
  f e acc = acc <> case e of
                     ConApp _ c' _ _ -> Any $ c == c'
                     Case _ _ as -> Any $ any (pat_has_con c) (map fst3 as)

pat_has_con :: DCon -> Pat -> Bool
pat_has_con c p' = case p' of
  ConPat _ c' mp -> c == c' || maybe False (pat_has_con c) mp
  ConsPat _ p1 p2 -> c == "::" || pat_has_con c p1 || pat_has_con c p2
  ListPat _ ps -> any (pat_has_con c) ps
  TuplePat _ ps -> any (pat_has_con c) ps
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

diff :: Expr -> Expr -> Maybe SrcSpan
diff e1 e2 = case (e1, e2) of
  (Var lx x, Var ly y)
    | x == y
      -> Nothing
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
      -> Nothing
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
          -> Nothing
        | otherwise
          -> lx
  (Record lx fxs mtx, Record ly fys mty)
    | map fst fxs == map fst fys
      -> merge (zipWith diff (map snd fxs) (map snd fys))
  (Prim1 lx (P1 vx _ _), Prim1 ly (P1 vy _ _))
    | vx == vy
      -> Nothing
  (Prim2 lx (P2 vx _ _ _), Prim2 ly (P2 vy _ _ _))
    | vx == vy
      -> Nothing
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
  _ -> getSrcSpanExprMaybe e1

  where
  merge ls = case catMaybes ls of
    -- no diff in subexprs => no diff
    []  -> Nothing
    -- diff in *one* subexpr => that expr
    [x] -> Just x
    -- diff in *multiple* subexprs => parent expr
    _   -> getSrcSpanExprMaybe e1

diffProg :: Prog -> Prog -> Maybe SrcSpan
diffProg p1 p2 = merge $ zipWith diffDecl p1 p2
  where
  merge ls = case catMaybes ls of
    -- no diff in subexprs => no diff
    []  -> Nothing
    -- diff in *one* subexpr => that expr
    [x] -> Just x
    -- diff in *multiple* subexprs => parent expr
    _   -> Just $ joinSrcSpan (getSrcSpan (head p1)) (getSrcSpan (last p1))

diffDecl :: Decl -> Decl -> Maybe SrcSpan
diffDecl d1 d2 = case (d1, d2) of
  (DFun _ r1 pes1, DFun _ r2 pes2)
    | r1 == r2 && map fst pes1 == map fst pes2
    -> merge $ zipWith (\(_,e1) (_,e2) -> diff e1 e2) pes1 pes2
  (DEvl _ e1, DEvl _ e2)
    -> diff e1 e2
  _ -> Just $ getSrcSpan d1
  where
  merge ls = case catMaybes ls of
    -- no diff in subexprs => no diff
    []  -> Nothing
    -- diff in *one* subexpr => that expr
    [x] -> Just x
    -- diff in *multiple* subexprs => parent expr
    _   -> Just $ getSrcSpan d1
