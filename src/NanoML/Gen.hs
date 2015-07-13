{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RecordWildCards  #-}
{-# LANGUAGE TupleSections    #-}
module NanoML.Gen where

import           Data.Map        (Map)
import qualified Data.Map        as Map
import           Data.Maybe
import qualified Data.Vector     as Vector
import           Test.QuickCheck

import           NanoML.Types

import Debug.Trace

type TypeEnv = Map TCon TypeDecl

genArgs :: Type -> TypeEnv -> Gen [Expr]
genArgs ty env = mapM (fmap Val . flip genValue env) (argTys ty)

genValue :: Type -> TypeEnv -> Gen Value
genValue ty env = case ty of
  -- NOTE: instantiate all tyvars indescriminately with `int`
  TVar _ -> VI <$> arbitrary
  TCon t
    | t == tINT
      -> VI <$> arbitrary
    | t == tFLOAT
      -> VD <$> arbitrary
    | t == tCHAR
      -> VC <$> arbitrary
    | t == tSTRING
      -> VS <$> arbitrary
    | t == tBOOL
      -> VB <$> arbitrary
    | t == tUNIT
      -> return VU
    | otherwise
      -> sized (genADT t [] env)
--  TApp "list" [t] -> sized (genList t e)
  TApp "array" [t] -> sized (fmap (flip VV t . Vector.fromList) . flip vectorOf (genValue t env))
  TApp c ts -> sized (genADT c ts env)
  TTup ts -> (\x -> VT (length ts) x ts) <$> mapM (flip genValue env) ts
  _ :-> to -> VF . flip Func mempty . Lam WildPat <$> (fmap Val . flip genValue env) to

genADT :: TCon -> [Type] -> TypeEnv -> Int -> Gen Value
genADT c ts e n = do
  let Just TypeDecl {..} = Map.lookup c e
  case tyRhs of
    Alias ty -> genValue ty e
    Alg dds  -> oneof (mapMaybe (genDataDecl tyVars) dds)
    TRec flds -> flip VR t <$> mapM genField flds

  where

  t = TApp c ts

  genDataDecl tvs DataDecl {..}
    | [] <- dArgs
    = Just $ return $ VA dCon Nothing t
    | n <= 0 && any isRec dArgs
    = Nothing
    | otherwise
    = Just $ do
      vs <- mapM (resize (n-1) . (`genValue` e) . subst (zip tvs ts)) dArgs
      let v = case dArgs of
            [_] -> head vs
            _   -> VT (length vs) vs ts
      return $ VA dCon (Just v) t

  isRec (TCon t)    = t == c
  isRec (TApp t ts) = t == c || any isRec ts
  isRec (TTup ts)   = any isRec ts
  isRec _           = False

  genField (f, m, t) = do
    v <- resize (n-1) (genValue t e)
    i <- fresh
    writeStore i (m,v)
    return (f,i)

-- genList :: Type -> TypeEnv -> Int -> Gen Expr
-- genList _ e 0 = return (mkConApp "[]" [])
-- genList t e n = do x  <- genExpr t e
--                    xs <- genList t e (n-1)
--                    return (mkConApp "::" [x,xs])
