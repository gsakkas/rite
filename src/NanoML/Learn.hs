{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
module NanoML.Learn where

import Control.Arrow (second)
import Control.Monad
import Data.Aeson
import qualified Data.ByteString.Lazy as LBS
import qualified Data.Csv as CSV
import Data.Function
import Data.List
import Data.Maybe
import qualified Data.Set as Set
import qualified Data.Vector as V
import GHC.Generics
-- import Grenade
import Numeric.LinearAlgebra hiding (rank)
import Text.Read

import NanoML.Classify
import NanoML.Monad
import NanoML.Types

rankExprs :: Net -> [Feature] -> Prog -> [(Confidence, SrcSpan)]
rankExprs net fs p = second getSpan <$!> rank net samples
  where
  samples = concatMap mkfsD tbad

  (tbad, cores, me) = case runEval stdOpts (typeProg p) of
    Left e -> ([], [], Just e)
    Right (tp, cs) -> (tp, mapMaybe constraintSpan $ Set.toList (mconcat cs), Nothing)

  mkfsD (TDFun _ _ pes) = mconcat (map (mkTypeOut . snd) pes)
  mkfsD (TDEvl _ e)     = mkTypeOut e
  mkfsD _               = mempty

  inSlice l
    | any (l ==) cores
    = [1]
    | otherwise
    = [0]

  mkTypeOut :: TExpr -> [Sample]
  mkTypeOut te = ctfold f [] te
    where
    f p e acc = (:acc) $ MkSample
                { getSpan = infoSpan (texprInfo e)
                , getSample = vector
                            $ inSlice (infoSpan (texprInfo e))
                           ++ concatMap (\(_,c) -> c p e) fs
                }

stdNet :: IO (Net, [Feature])
stdNet = loadNet "models/op+context+type-hidden-500.json" >>= \case
  Nothing -> fail "could not decode 'models/op+context+type-hidden-500.json'"
  Just net -> return (net, preds_tis ++ map only_ctx preds_tis_ctx ++ preds_tcon_ctx)

data Prediction = Change | NoChange
  deriving (Eq, Show)

predict :: Net -> Sample -> Prediction
predict = undefined

type Confidence = Double

rank :: Net -> [Sample] -> [(Confidence, Sample)]
rank net samples =
  sortBy (flip compare `on` fst)
    [ (r ! 1, s)
    | s <- samples
    , let r = runNet net (getSample s)
    ]

data Net = MkNet
  { hidden :: [Weights]
  , output :: Weights
  } deriving (Eq, Show, Generic)
instance FromJSON Net

data Weights = MkWeights
  { weights :: Matrix Double
  , biases :: Vector Double
  } deriving (Eq, Show, Generic)
instance FromJSON Weights where
  parseJSON = withObject "Weights" $ \v -> MkWeights
    <$> fmap mkmatrix (v .: "weights")
    <*> fmap vector (v .: "biases")
    where
    mkmatrix (ws :: [[Double]]) = matrix (length ws) (concat ws)

loadNet :: FilePath -> IO (Maybe Net)
loadNet file = decode <$> LBS.readFile file

runNet :: Net -> Vector Double -> Vector Double
runNet MkNet{..} features =
  softmax (runLayer (foldl' runHidden features hidden) output)
  where
  runHidden fs ws = relu $ runLayer fs ws
  runLayer fs MkWeights{..} =
    weights #> fs + biases

relu :: Vector Double -> Vector Double
relu v = cmap (\x -> max 0 x) v

softmax :: Vector Double -> Vector Double
softmax v = cmap (\x -> exp x / summed) v
  where
  summed = sumElements (cmap exp v)

data Sample = MkSample { getSpan :: SrcSpan, getSample :: Vector Double }
  deriving (Eq, Show, Generic)
instance CSV.FromRecord Sample where
  parseRecord r = MkSample
    <$> (maybe mzero return . readMaybe =<< CSV.parseField (r V.! 0))
    <*> fmap vector (CSV.parseRecord (V.drop 4 r))

loadSamples :: FilePath -> IO (Either String (V.Vector Sample))
loadSamples file = CSV.decode CSV.HasHeader <$> LBS.readFile file

-- net2network :: Net -> Network ts ds
-- net2network MkNet{..} = foldr addLayer NNil (output : reverse hidden)

-- addLayer :: Weights -> Network ts ds
--          -> Network (FullyConnected dx dy : Relu : ts) (d : d : ds)
-- addLayer ws net = mkLayer ws :~> Relu :~> net
