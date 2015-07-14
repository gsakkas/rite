{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RecordWildCards  #-}
{-# LANGUAGE TupleSections    #-}
module NanoML.Gen where

import           Control.Monad.Random
import           Control.Monad.Reader
import           Data.Char
import           Data.Map        (Map)
import qualified Data.Map        as Map
import           Data.Maybe
import qualified Data.Vector     as Vector
-- import qualified Test.QuickCheck as QC
-- import           Test.QuickCheck.GenT

import           NanoML.Types

import Debug.Trace

type TypeEnv = Map TCon TypeDecl

genArgs :: MonadEval m => Type -> TypeEnv -> m [Value]
genArgs ty env = mapM (flip genValue env) (argTys ty)

genValue :: MonadEval m => Type -> TypeEnv -> m Value
genValue ty env = case ty of
  -- NOTE: instantiate all tyvars indescriminately with `int`
  TVar _ -> VI <$> sized (\s -> getRandomR (-s, s))
  TApp t []
    | t == tINT
      -> VI <$> sized (\s -> getRandomR (-s, s))
    | t == tFLOAT
      -> VD <$> sized (\s -> getRandomR (negate (fromIntegral s), fromIntegral s))
    | t == tCHAR
      -> VC <$> sized (\s -> getRandomR ('a', chr (ord 'a' + s)))
    | t == tSTRING
      -> VS <$> listOf (sized (\s -> getRandomR ('a', chr (ord 'a' + s))))
    | t == tBOOL
      -> VB <$> oneof [return False, return True]
    | t == tUNIT
      -> return VU
    | otherwise
      -> sized (genADT t [] env)
  TApp "list" [t] -> sized (genList t env)
  TApp "array" [t] -> sized (fmap (flip VV t . Vector.fromList) . flip vectorOf (genValue t env))
  TApp c ts -> sized (genADT c ts env)
  TTup ts -> (\x -> VT (length ts) x ts) <$> mapM (flip genValue env) ts
  _ :-> to -> VF . flip Func mempty . Lam WildPat <$> (fmap Val . flip genValue env) to

genList :: MonadEval m => Type -> TypeEnv -> Int -> m Value
genList t env 0 = return (VL [] t)
genList t env n = do
  x <- resize (n-1) $ genValue t env
  VL xs _ <- genList t env (n-1)
  return (VL (x:xs) t)

genADT :: MonadEval m => TCon -> [Type] -> TypeEnv -> Int -> m Value
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

--  isRec (TCon t)    = t == c
  isRec (TApp t ts) = t == c || any isRec ts
  isRec (TTup ts)   = any isRec ts
  isRec _           = False

  genField (f, m, t) = do
    v <- resize (n-1) (genValue t e)
    i <- fresh
    writeStore i (m,v)
    return (f,i)

listOf :: MonadEval m => m a -> m [a]
listOf g = sized $ \s -> do
  n <- getRandomR (0, s)
  vectorOf n g

vectorOf :: MonadEval m => Int -> m a -> m [a]
vectorOf n g = replicateM n g

oneof :: MonadRandom m => [m a] -> m a
oneof [] = error "oneof []"
oneof xs = getRandomR (0, length xs - 1) >>= (xs !!)

sized :: MonadEval m => (Int -> m a) -> m a
sized f = asks size >>= f

resize :: MonadEval m => Int -> m a -> m a
resize s = local (\o -> o { size = s })
