{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}
module NanoML.Monad where

import Control.Monad.Except
import Control.Monad.Random (RandT, evalRandT, liftRandT, runRandT, MonadRandom)
import Control.Monad.Reader.Class
import Control.Monad.State
import Control.Monad.Writer.Class
import qualified Data.IntMap as IntMap
import Data.Foldable
import Data.Sequence
import System.Random

import NanoML.Pretty
import NanoML.Prim
import NanoML.Types

data NanoState = NanoState
  { nanoReader :: !NanoOpts
  , nanoState  :: !EvalState
  , nanoWriter :: !(Seq Doc)
  }

newtype Eval a = EvalM (RandT StdGen (ExceptT NanoError (State NanoState)) a)
  deriving (Functor, Applicative, Monad, MonadFix
           ,MonadError NanoError, MonadRandom)

instance MonadError e m => MonadError e (RandT g m) where
  throwError = lift . throwError
  catchError m f = liftRandT (\g -> runRandT m g `catchError` \e ->
                                    runRandT (f e) g)

instance MonadReader NanoOpts Eval where
  ask = EvalM $ gets nanoReader
  local f x = do
    r <- EvalM $ gets nanoReader
    EvalM $ modify' $ \s -> s { nanoReader = f (nanoReader s) }
    a <- x
    EvalM $ modify' $ \s -> s { nanoReader = r }
    return a

instance MonadState EvalState Eval where
  get = EvalM $ gets nanoState
  put st = EvalM $ modify' $ \s -> s { nanoState = st }

instance MonadWriter [Doc] Eval where
  tell w = EvalM $ modify' $ \s -> s { nanoWriter = nanoWriter s `mappend` (fromList w) }
  listen (EvalM x) = EvalM $ do
    w <- gets nanoWriter
    modify' $ \s -> s { nanoWriter = mempty }
    a <- x
    w' <- gets nanoWriter
    modify' $ \s -> s { nanoWriter = w `mappend` w' }
    return (a, toList w')
  pass (EvalM x) = EvalM $ do
    w <- gets nanoWriter
    modify' $ \s -> s { nanoWriter = mempty }
    (a, f) <- x
    w' <- gets nanoWriter
    modify' $ \s -> s { nanoWriter = w `mappend` fromList (f (toList w')) }
    return a

runEval :: NanoOpts -> Eval a -> Either (NanoError, [Doc]) a
runEval opts (EvalM x) =
  let init = NanoState opts initState mempty
      stdGen = mkStdGen (seed opts)
  in case runState (runExceptT (evalRandT x stdGen)) init of
      (Left e, st) -> Left (e, toList (nanoWriter st))
      (Right v, _) -> Right v

runEvalFull :: NanoOpts -> Eval a -> (Either NanoError a, EvalState, [Doc])
runEvalFull opts (EvalM x) =
  let init = NanoState opts initState mempty
      stdGen = mkStdGen (seed opts) 
  in case runState (runExceptT (evalRandT x stdGen)) init of
      (Left e, st) -> (Left e, nanoState st, toList (nanoWriter st))
      (Right v, st) -> (Right v, nanoState st, toList (nanoWriter st))

initState :: EvalState
initState = EvalState
  { stVarEnv = baseEnv
  , stTypeEnv = baseTypeEnv
  , stDataEnv = baseDataEnv
  , stFieldEnv = baseFieldEnv
  , stFresh = succ (envId baseEnv)
  , stStore = mempty
  , stArgs = []
  , stTrace = mempty
  , stEnvMap = IntMap.fromList [(envId baseEnv, baseEnv)]
  , stEdges = []
  , stCurrentExpr = error "initState.stCurrentExpr"
  , stSteps = 0
  , stStepKind = BoringStep
  }
