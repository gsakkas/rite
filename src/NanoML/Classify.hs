{-# LANGUAGE MultiWayIf #-}
module NanoML.Classify where

import Control.Applicative
import Control.Monad
import qualified Data.Map.Strict as Map
import Data.Map.Strict (Map)
import Data.Maybe
import qualified Data.Set as Set
import Data.Set (Set)

import NanoML.Parser
import NanoML.Types


fold :: Monoid a => (Expr -> a -> a) -> a -> Expr -> a
fold f z = go
  where
  go e = case e of
    Var {} -> f e z
    Lam _ _ b _ -> f e (go b)
    App _ f es -> mconcat $ map go (f:es)

classify :: Monoid a => (Expr -> a -> a) -> Expr -> Map String a
--classify f = fold do_one base
classify do_one = snd . go
  where
  base = Map.empty

  --do_one e a = (fromJust (getSrcSpanExprMaybe e), f e a)

  --go e = (do_one e, to e)

  loc e = show (fromJust (getSrcSpanExprMaybe e))

  go e = case e of
    Var {}      -> merge e []
    Lam _ _ b _ -> merge e (map go [b])
    App _ f es  -> merge e (map go (f:es))
    Bop _ _ x y -> merge e (map go [x,y])
    Uop _ _ x   -> merge e (map go [x])
    Lit {}      -> merge e [(mempty, Map.empty)]
    Let _ _ pes b -> merge e (go b : map (go.snd) pes)
    Seq _ x y   -> merge e (map go [x,y])
    Case _ s as -> merge e (go s : map (go.thd3) as)
    Tuple _ es  -> merge e (map go es)
    ConApp _ _ b _ -> merge e (map go (maybeToList b))
    Record _ fes _ -> merge e (map (go.snd) fes)
    Field _ x _ -> merge e (map go [e])
    SetField _ x _ y -> merge e (map go [x,y])
    List _ es _ -> merge e (map go es)
    -- FIXME: fill in a few more cases...
    _           -> merge e []


  merge e ars = case mconcat ars of
    (a', r) -> let a = do_one e a' in (a, Map.insert (loc e) a r)

type OpVector = Map String Int

-- | Classify an 'Expr' by the operators in each subexpression.
--
-- Treats literals, constructors, and functions as pseudo-operators.
by_ops :: Expr -> Map String OpVector
by_ops = classify count_ops
  where
  count_ops e child = case e of
    Lam {} -> Map.insertWith (+) "Fun" 1 child
    App {} -> Map.insertWith (+) "Fun" 1 child
    Bop _ b _ _ -> Map.insertWith (+) (show b) 1 child
    Uop _ u _ -> Map.insertWith (+) (show u) 1 child
    Lit _ l -> Map.insertWith (+) (literalType l) 1 child
    Let _ _ pes _ -> Map.unionsWith (+) (child : map (patCons.fst) pes)
    Ite {} -> Map.insertWith (+) "Ite" 1 child
    Case _ _ as -> Map.unionsWith (+) (child : map (patCons.fst3) as)
    Tuple _ es -> Map.insertWith (+) ("Tuple"++(show (length es))) 1 child
    ConApp _ d _ _ -> Map.insertWith (+) d 1 child
    Array _ _ _ -> Map.insertWith (+) "Array" 1 child
    List _ _ _ -> Map.insertWith (+) "List" 1 child
    -- FIXME: fill in a few more cases...
    _ -> child

patCons :: Pat -> Map String Int
patCons p = case p of
  LitPat _ l -> Map.insertWith (+) (literalType l) 1 mempty
  IntervalPat _ l _ -> Map.insertWith (+) (literalType l) 1 mempty
  ConsPat _ x y -> Map.insertWith (+) ("List") 1 (Map.union (patCons x) (patCons y))
  ConPat _ d mp -> Map.insertWith (+) d 1 (maybe mempty patCons mp)
  TuplePat _ ps -> Map.insertWith (+) ("Tuple"++(show (length ps))) 1
                     (Map.unions (map patCons ps))
  OrPat _ x y -> Map.union (patCons x) (patCons y)
  AsPat _ p _ -> patCons p
  -- FIXME
  _ -> mempty

literalType :: Literal -> String
literalType l = case l of
  LI {} -> "Int"
  LD {} -> "Double"
  LB {} -> "Bool"
  LC {} -> "Char"
  LS {} -> "String"

-- diff :: Expr -> Expr -> Maybe Context
-- diff e1 e2 = case (e1, e2) of
--   (Var lx x, Var ly y)
--     | lx == ly && x == y
--       -> Nothing
--   (Lam lx px x _, Lam ly py y _)
--     | lx == ly && px == py
--       -> InLam <$> diff x y
--   (App lx fx ax, App ly fy ay)
--     | lx == ly && length ax == length ay
--       -> merge $ (InAppF <$> diff fx fy)
--                : (zipWith3 (\x y i -> InAppXs i <$> diff x y)
--                    ax ay [0..])
--   (Bop lx bx x1 x2, Bop ly by y1 y2)
--     | lx == ly && bx == by
--       -> merge [InBopL <$> diff x1 y1, InBopR <$> diff x2 y2]
--   (Uop lx ux x, Uop ly uy y)
--     | lx == ly && ux == uy
--       -> InUop <$> diff x y
--   (Lit lx x, Lit ly y)
--     | lx == ly && x == y
--       -> Nothing
--   (Let lx rx xbs x, Let ly ry ybs y)
--     | lx == ly && rx == ry && length xbs == length ybs && map fst xbs == map fst ybs
--       -> merge $ (zipWith (\x y i -> InLet i <$> diff x y)
--                    (map snd xbs) (map snd ybs) [1..])
--                  ++ InLet 0 <$> diff x y
--   -- HEREHERE
--   (Ite lx bx tx fx, Ite ly by ty fy)
--     | lx == ly
--       -> merge $ [diff bx by <|> diff tx ty, Indiff fx fy]
--   (Seq lx x1 x2, Seq ly y1 y2)
--     | lx == ly
--       -> diff x1 y1 <|> diff x2 y2
--   (Case lx x axs, Case ly y ays)
--     | lx == ly && length axs == length ays && map fst3 axs == map fst3 ays && map snd3 axs == map snd3 ays
--       -> diff x y <|> msum (zipWith diff (map thd3 axs) (map thd3 ays))
--   (Tuple lx xs, Tuple ly ys)
--     | lx == ly && length xs == length ys
--       -> msum (zipWith diff xs ys)
--   (ConApp lx cx mx mtx, ConApp ly cy my mty)
--     | lx == ly && cx == cy -> if
--         | Just x <- mx, Just y <- my
--           -> diff x y
--         | Nothing <- mx, Nothing <- my
--           -> Nothing
--         | otherwise
--           -> Just Here
--   (Record lx fxs mtx, Record ly fys mty)
--     | lx == ly && map fst fxs == map fst fys
--       -> msum (zipWith diff (map snd fxs) (map snd fys))
--   (Prim1 lx (P1 vx _ _), Prim1 ly (P1 vy _ _))
--     | lx == ly && vx == vy
--       -> Nothing
--   (Prim2 lx (P2 vx _ _ _), Prim2 ly (P2 vy _ _ _))
--     | lx == ly && vx == vy
--       -> Nothing
--   -- (Val _ x, Val _ y)
--   --   | x == y
--   --     -> Nothing
--   -- (With lx ex x, With ly ey y)
--   --   | lx == ly && envId ex == envId ey
--   --     -> diff x y
--   -- (Replace lx ex x, Replace ly ey y)
--   --   | lx == ly && envId ex == envId ey
--   --     -> diff x y
--   -- (_, Replace _ _ _)
--   --   -> Just (e1, e2)
--   -- (Replace _ env' _, _)
--   --   -> Just (e1, e2)
--   _ -> Just Here
