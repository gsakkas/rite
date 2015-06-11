module NanoML.Gen where

import Test.QuickCheck

import NanoML.Types


genExpr :: Type -> Gen Expr
genExpr ty = case ty of
  -- NOTE: instantiate all tyvars indescriminately with `int`
  TVar _ -> Lit . LI <$> arbitrary
  TCon t
    | t == tINT
      -> Lit . LI <$> arbitrary
    | t == tFLOAT
      -> Lit . LD <$> arbitrary
    | t == tCHAR
      -> Lit . LC <$> arbitrary
    | t == tSTRING
      -> Lit . LS <$> arbitrary
    | t == tUNIT
      -> return (Var "()")
    | otherwise
      -> error "non-primitive type"
  TApp (TCon "list") t -> sized (genList t)
  TTup ts -> Tuple <$> mapM genExpr ts
  _ :-> to -> Lam WildPat <$> genExpr to

genList :: Type -> Int -> Gen Expr
genList _ 0 = return Nil
genList t n = do x  <- genExpr t
                 xs <- genList t (n-1)
                 return (Cons x xs)
