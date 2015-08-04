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
genValue ty env = withCurrentProvM $ \prv -> case ty of
  TVar _ -> do
    r <- fresh
    return (VH r Nothing)
  TApp t []
    | t == tINT
      -> VI prv <$> sized (\s -> getRandomR (-s, s))
    | t == tFLOAT
      -> VD prv <$> sized (\s -> getRandomR (negate (fromIntegral s), fromIntegral s))
    | t == tCHAR
      -> VC prv <$> sized (\s -> getRandomR ('a', chr (ord 'a' + s)))
    | t == tSTRING
      -> VS prv <$> listOf (sized (\s -> getRandomR ('a', chr (ord 'a' + s))))
    | t == tBOOL
      -> VB prv <$> oneof [return False, return True]
    | t == tUNIT
      -> return (VU prv)
    | otherwise
      -> sized (genADT t [] env)
  TApp "list" [t] -> genList t env
  TApp "array" [t] -> sized (fmap ((\ x -> VV prv x t) . Vector.fromList) . flip vectorOf (genValue t env))
  TApp c ts -> sized (genADT c ts env)
  TTup ts -> (\x -> VT prv (length ts) x ts) <$> mapM (flip genValue env) ts
  _ :-> to -> VF prv . flip Func mempty . Lam Nothing (WildPat Nothing) <$> (fmap (Val Nothing) . flip genValue env) to

genList :: MonadEval m => Type -> TypeEnv -> m Value
genList t env = withCurrentProvM $ \prv -> (\x -> VL prv x t) <$> listOf (genValue t env)

genADT :: MonadEval m => TCon -> [Type] -> TypeEnv -> Int -> m Value
genADT c ts e n = do
  let Just TypeDecl {..} = Map.lookup c e
  case tyRhs of
    Alias ty -> genValue ty e
    Alg dds  -> oneof (mapMaybe (genDataDecl tyVars) dds)
    TRec flds -> withCurrentProvM $ \prv -> (\x -> VR prv x t) <$> mapM genField flds

  where

  t = TApp c ts

  genDataDecl tvs DataDecl {..}
    | [] <- dArgs
    = Just $ withCurrentProv $ \prv -> VA prv dCon Nothing t
    | n <= 0 && any isRec dArgs
    = Nothing
    | otherwise
    = Just $ do
      ns <- replicateM (length dArgs) (getRandomR (0, prev n))
      vs <- zipWithM (\n d -> resize n . (`genValue` e) . subst (zip tvs ts) $ d)
                     ns dArgs
      withCurrentProvM $ \prv -> do
        let v = case dArgs of
              [_] -> head vs
              _   -> VT prv (length vs) vs ts
        return $ VA prv dCon (Just v) t

--  isRec (TCon t)    = t == c
  isRec (TApp t ts) = t == c || any isRec ts
  isRec (TTup ts)   = any isRec ts
  isRec _           = False

  genField (f, m, t) = do
    n' <- getRandomR (0, prev n)
    v <- resize n' (genValue t e)
    i <- fresh
    writeStore i (m,v)
    return (f,i)

prev n = max 0 (n-1)

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
resize s | s < 0 = error "resize: negative size"
resize s = local (\o -> o { size = s })
