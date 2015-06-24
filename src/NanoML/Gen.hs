module NanoML.Gen where

import           Test.QuickCheck

import           NanoML.Types


genArgs :: Type -> Gen [Expr]
genArgs ty = mapM genExpr (argTys ty)

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
    | t == tBOOL
      -> Lit . LB <$> arbitrary
    | t == tUNIT
      -> return (Var "()")
    | otherwise
      -> error $ "non-primitive type: " ++ show ty
  TApp c ts -> sized (genADT c ts)
  TTup ts -> Tuple <$> mapM genExpr ts
  _ :-> to -> Lam WildPat <$> genExpr to

genADT :: TCon -> [Type] -> Int -> Gen Expr
genADT = undefined

genList :: Type -> Int -> Gen Expr
genList _ 0 = return (mkConApp "[]" [])
genList t n = do x  <- genExpr t
                 xs <- genList t (n-1)
                 return (mkConApp "::" [x,xs])
