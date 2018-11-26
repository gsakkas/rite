{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}
module Main where

import Control.Exception (assert)
import Control.Monad
import Data.Aeson (ToJSON(..), FromJSON(..), eitherDecode)
import qualified Data.Aeson as Aeson
import qualified Data.Algorithm.Diff as Diff
import qualified Data.ByteString.Char8 as BSC
import qualified Data.ByteString.Lazy.Char8 as LBSC
import Data.Csv
import Data.Either
import Data.Function
import Data.List
import qualified Data.Map.Strict as Map
import Data.Maybe
import qualified Data.HashMap.Strict as HashMap
import qualified Data.HashSet as HashSet
import Data.HashSet (HashSet)
import qualified Data.Set as Set
import qualified Data.Vector as Vector
import GHC.Generics
import Options.Generic hiding (All(..))
import System.Directory
import System.Environment
import System.FilePath
import System.IO
import Text.Printf

import NanoML.Classify hiding (sizeOfTree)
import NanoML.Lexer
import NanoML.Monad
import NanoML.Parser
import NanoML.Pretty
import NanoML.Types hiding (Kind)


import Debug.Trace


data Generate = Generate
  { source :: FilePath
  , features :: String
  , out :: FilePath
  }
  deriving (Generic, Show)
instance ParseRecord Generate

main :: IO ()
main = do
  Generate {source=src, features=cls, out=out} <-
    getRecord "generate-features"
  jsons <- lines <$> readFile src -- (readFile $ "features/data/ucsd/data/derived" </> src </> "pairs.json")
  case cls of
    -- "ops"
    --   -> mkBadFeatures out cls preds_thas jsons
    -- "ops+context"
    --   -> mkBadFeatures out cls preds_thas_ctx jsons
    -- "op+context"
    --   -> mkBadFeatures out cls preds_tis_ctx jsons
    -- "op+context-count"
    --   -> mkBadFeatures out cls (preds_tis ++ map only_ctx preds_tcount_ctx) jsons
    -- "op+context-count+size"
    --   -> mkBadFeatures out cls (preds_tsize ++ preds_tis ++ map only_ctx preds_tcount_ctx) jsons
    "op"
      -> mkBadFeatures out cls (preds_tis) jsons
    "op+slice"
      -> mkBadFeaturesWithSlice All out cls (preds_tis) jsons
    "op+context"
      -> mkBadFeatures out cls (preds_tis ++ map only_ctx preds_tis_ctx) jsons
    "op+context+size"
      -> mkBadFeatures out cls (preds_tsize ++ preds_tis ++ map only_ctx preds_tis_ctx) jsons
    "op+context+type"
      -> mkBadFeatures out cls (preds_tis ++ map only_ctx preds_tis_ctx ++ preds_tcon_ctx) jsons
    "op+context+type+size"
      -> mkBadFeatures out cls (preds_tsize ++ preds_tis ++ map only_ctx preds_tis_ctx ++ preds_tcon_ctx) jsons
    -- "op-cons+context+type+size"
    --   -> mkBadFeatures out cls (preds_tsize ++ preds_tis_cons ++ map only_ctx preds_tis_ctx_cons ++ preds_tcon_ctx) jsons
    -- "op+context-has+type+size"
    --   -> mkBadFeatures out cls (preds_tsize ++ preds_tis ++ map only_ctx preds_thas_ctx ++ preds_tcon_ctx) jsons
    -- "op+context-count+type+size"
    --   -> mkBadFeatures out cls (preds_tsize ++ preds_tis ++ map only_ctx preds_tcount_ctx ++ preds_tcon_ctx) jsons
    "op+size"
      -> mkBadFeatures out cls (preds_tsize ++ preds_tis) jsons
    "op+type"
      -> mkBadFeatures out cls (preds_tis ++ preds_tcon_ctx) jsons
    "op+type+size"
      -> mkBadFeatures out cls (preds_tsize ++ preds_tis ++ preds_tcon_ctx) jsons
    -- "op+type+size+slice-full"
    --   -> mkBadFeaturesWithSlice All out cls (preds_tsize ++ preds_tis ++ preds_tcon_ctx) jsons
    -- "op-cons+type+size"
    --   -> mkBadFeatures out cls (preds_tsize ++ preds_tis_cons ++ preds_tcon_ctx) jsons
    -- "type-inference"
    --   -> mkFixFeatures cls (preds_tis_novar ++ preds_tcon_novar_children) jsons
    -- "type-inference+vars"
    --   -> mkFixFeatures cls (preds_tis ++ preds_tcon_children) jsons
    "spans+exps"
      -> mkSpansWithExprs JustSlice out cls (preds_tis) jsons
    "spans+trees"
      -> mkSpansWithTrees JustSlice out cls (preds_tis) jsons


data WithSlice = JustSlice | All deriving Eq

mkBadFeatures :: String -> String -> [Feature] -> [String] -> IO ()
mkBadFeatures = mkBadFeaturesWithSlice JustSlice

mkBadFeaturesWithSlice :: WithSlice -> String -> String -> [Feature] -> [String] -> IO ()
mkBadFeaturesWithSlice withSlice out nm fs jsons = do
  let uniqs = concatMap mkDiffs jsons
  let feats = [ ((h, f'), (ss, bad, fix, c, all, idx))
              | (ss, p, bad, fix, idx) <- uniqs
              , (h, f, c) <- maybeToList $ runTFeaturesDiff fs (ss,p)
              , let f' = filter (\r -> withSlice == All || r HashMap.! "F-InSlice" == "1.0") f
                -- a one-constraint core is bogus, this should be impossible
              -- , length f' > 1
              , let all = nub $ map (fromJust.getSrcSpanExprMaybe)
                                    (concatMap allSubExprs $ progExprs p)
              ]
  let feats' = filter (\(_, (_,_,_,cs,_,_)) -> not (null cs)) feats
  let mkMean f xs = sum (map f xs) / genericLength xs
  let mkFrac (_, (ss, _, _, _, all, _)) = genericLength ss / genericLength all
  -- For discarding outliers by fraction of type error slice that changed rather than
  -- whole program. Doesn't seem to make a huge difference overall.
  -- let mkFrac (_, (ss, _, _, cs, _all, _)) = genericLength (ss `intersect` cs) / genericLength cs
  let mean = mkMean mkFrac feats' :: Double
  let std  = sqrt $ mkMean (\x -> (mkFrac x - mean) ^ 2) feats'
  forM_ feats $ \ f@((header, features), (ss, bad, fix, cs, allspans, i)) -> do
    if
      | mkFrac f > mean+std -> do
          printf "OUTLIER: %.2f > %.2f\n" (mkFrac f :: Double) (mean+std)
      | null cs -> do
        putStrLn "NO CORE"
        putStrLn bad
      | length (nub cs) == 1 -> do
        putStrLn "SINGLE CONSTRAINT CORE"
        putStrLn bad
        print (head cs)
      | null ss -> do
        putStrLn "NO DIFF"
        putStrLn bad
        putStrLn "---------------------------"
        putStrLn fix
      | null (intersect ss cs) -> do
        putStrLn "NO OVERLAP CORE/DIFF"
        putStrLn bad
        print cs
        putStrLn fix
      | otherwise -> do
        let fn = printf "%04d" (i :: Int)
        let path = out </> nm </> fn <.> "csv"
        createDirectoryIfMissing True (takeDirectory path)
        LBSC.writeFile path $ encodeByName header features
        let path = out </> fn <.> "ml"
        writeFile path $ unlines $ [ bad, "", "(* fix", fix, "*)", ""
                                   , "(* changed spans" ] ++ map show ss ++ [ "*)" ]
                                ++ [ "", "(* type error slice" ] ++ map show cs ++ [ "*)" ]
                                ++ [ "", "(* all spans" ] ++ map show allspans ++ [ "*)" ]

    -- let (header, features) = unzip $ map (runTFeaturesDiff fs) uniqs
    -- let path = "data/" ++ nm ++ ".csv"
    -- LBSC.writeFile path $ encodeByName (head header) (concat features)
  printf "MEAN / STD frac: %.3f / %.3f\n" mean std


-- George
mkSpansWithExprs :: WithSlice -> String -> String -> [Feature] -> [String] -> IO ()
mkSpansWithExprs withSlice out nm fs jsons = do
  let uniqs = concatMap mkDiffsWithExprs jsons
  let feats = [ ((h, f'), (ss', bad, fix, c, all, idx))
              | (ss', p, bad, fix, idx) <- uniqs
              , let ss = fst $ unzip ss'
              , (h, f, c) <- maybeToList $ runTFeaturesDiff fs (ss,p)
              , let f' = filter (\r -> withSlice == All || r HashMap.! "F-InSlice" == "1.0") f
              , let all = nub $ map (fromJust.getSrcSpanExprMaybe)
                                    (concatMap allSubExprs $ progExprs p)
              ]
  let feats' = filter (\(_, (_,_,_,cs,_,_)) -> not (null cs)) feats
  let mkMean f xs = sum (map f xs) / genericLength xs
  let mkFrac (_, (ss, _, _, _, all, _)) = genericLength ss / genericLength all
  let mean = mkMean mkFrac feats' :: Double
  let std  = sqrt $ mkMean (\x -> (mkFrac x - mean) ^ 2) feats'
  forM_ feats $ \ f@((header, features), (ss, bad, fix, cs, allspans, i)) -> do
    let ss' = fst $ unzip ss
    let ss_expr = map (\(fi, se) -> (show fi) ++ "\n" ++ (render $ pretty se) ++ "\n") ss
    if
      | mkFrac f > mean+std -> do
          printf "OUTLIER: %.2f > %.2f\n" (mkFrac f :: Double) (mean+std)
      | null cs -> do
        putStrLn "NO CORE"
        putStrLn bad
      | length (nub cs) == 1 -> do
        putStrLn "SINGLE CONSTRAINT CORE"
        putStrLn bad
        print (head cs)
      | null ss' -> do
        putStrLn "NO DIFF"
        putStrLn bad
        putStrLn "---------------------------"
        putStrLn fix
      | null (intersect ss' cs) -> do
        putStrLn "NO OVERLAP CORE/DIFF"
        putStrLn bad
        print cs
        putStrLn fix
      | otherwise -> do
        let fn = printf "%04d" (i :: Int)
        let path = out </> nm </> fn <.> "csv"
        createDirectoryIfMissing True (takeDirectory path)
        LBSC.writeFile path $ encodeByName header features
        let path = out </> fn <.> "ml"
        writeFile path $ unlines $ [ bad, "", "(* fix", fix, "*)", ""
                                    , "(* changed spans" ] ++ ss_expr ++ [ "*)" ]
  printf "MEAN / STD frac: %.3f / %.3f\n" mean std


-- George
mkSpansWithTrees :: WithSlice -> String -> String -> [Feature] -> [String] -> IO ()
mkSpansWithTrees withSlice out nm fs jsons = do
  let uniqs = concatMap mkDiffsWithGenericTrs jsons
  let feats = [ ((h, f'), (ss', bad, fix, c, all, idx))
              | (ss', p, bad, fix, idx) <- uniqs
              , let ss = fst3 $ unzip3 ss'
              , (h, f, c) <- maybeToList $ runTFeaturesDiff fs (ss,p)
              , let f' = filter (\r -> withSlice == All || r HashMap.! "F-InSlice" == "1.0") f
              , let all = nub $ map (fromJust.getSrcSpanExprMaybe)
                                    (concatMap allSubExprs $ progExprs p)
              ]
  let feats' = filter (\(_, (_,_,_,cs,_,_)) -> not (null cs)) feats
  let mkMean f xs = sum (map f xs) / genericLength xs
  let mkFrac (_, (ss, _, _, _, all, _)) = genericLength ss / genericLength all
  let mean = mkMean mkFrac feats' :: Double
  let std  = sqrt $ mkMean (\x -> (mkFrac x - mean) ^ 2) feats'
  forM_ feats $ \ f@((header, features), (ss, bad, fix, cs, allspans, i)) -> do
    let ss' = fst3 $ unzip3 ss
    let ss_expr = map (\(fi, se, td) -> (show fi) ++ "\n" ++ (render $ pretty se) ++ "\n" ++ (show td) ++ "\n") ss
    if
      | mkFrac f > mean+std -> do
        printf "OUTLIER: %.2f > %.2f\n" (mkFrac f :: Double) (mean+std)
      | null cs -> do
        putStrLn "NO CORE"
        putStrLn bad
      | length (nub cs) == 1 -> do
        putStrLn "SINGLE CONSTRAINT CORE"
        putStrLn bad
        print (head cs)
      | null ss' -> do
        putStrLn "NO DIFF"
        putStrLn bad
        putStrLn "---------------------------"
        putStrLn fix
      | null (intersect ss' cs) -> do
        putStrLn "NO OVERLAP CORE/DIFF"
        putStrLn bad
        print cs
        putStrLn fix
      | otherwise -> do
        let fn = printf "%04d" (i :: Int)
        let path = out </> nm </> fn <.> "csv"
        createDirectoryIfMissing True (takeDirectory path)
        LBSC.writeFile path $ encodeByName header features
        let path = out </> fn <.> "ml"
        writeFile path $ unlines $ [ bad, "", "(* fix", fix, "*)", ""
                                    , "(* changed spans" ] ++ ss_expr ++ [ "*)" ]
  let ss_fixes
        = (forM feats $ \ f@((header, features), (ss, bad, fix, cs, allspans, i)) -> do
          let ss' = fst3 $ unzip3 ss
          if
            | mkFrac f > mean+std -> do
              return []
            | null cs -> do
              return []
            | length (nub cs) == 1 -> do
              return []
            | null ss' -> do
              return []
            | null (intersect ss' cs) -> do
              return []
            | otherwise -> do
              return $ thd3 $ unzip3 ss) >>= concat
  let clusters = makeClusters ss_fixes
  let elems
        = (forM feats $ \ f@((header, features), (ss, bad, fix, cs, allspans, i)) -> do
          let ss' = fst3 $ unzip3 ss
          if
            | mkFrac f > mean+std -> do
              return []
            | null cs -> do
              return []
            | length (nub cs) == 1 -> do
              return []
            | null ss' -> do
              return []
            | null (intersect ss' cs) -> do
              return []
            | otherwise -> do
              return $ map (\(_, x, y) -> (y, (render $ pretty x))) ss) >>= concat
  let cls = map (\c -> ((show c) : map (\(_, y) -> y) (filter (\(x, _) -> x == c) elems))) clusters
  let cluster_lens = map (\li -> (head li, length li)) $ reverse $ groupBy (==) $ sort $ map (\c -> (length c) - 1) cls
  forM_ (zip [1..] cls) $ \(i, c) -> do
    let fn = printf "%04d" (i :: Int)
    let path = out </> "clusters" </> fn <.> "ml"
    createDirectoryIfMissing True (takeDirectory path)
    writeFile path $ unlines c
  printf "MEAN / STD frac: %.3f / %.3f\n" mean std
  print $ length ss_fixes
  print $ length clusters
  print $ cluster_lens


makeClusters :: [ExprGeneric] -> [ExprGeneric]
makeClusters = Set.toList . Set.fromList


mkFixFeatures :: String -> [Feature] -> [String] -> IO ()
mkFixFeatures nm fs jsons = do
  let fixes = concatMap mkFixes jsons
  let (header, features) = unzip $ map (runTFeaturesTypes fs) fixes
  let path = "data/" ++ nm ++ ".csv"
  LBSC.writeFile path $ encodeByName (head header) (concat features)


traceStats :: [[NamedRecord]] -> IO ()
traceStats outss = do
  let fracs = [ fromIntegral (length (filter (\out -> out HashMap.! "L-DidChange" == "1.0") outs)) / fromIntegral (length outs)
              | outs <- outss
              , length outs > 0
              ] :: [Double]
  hPrintf stderr "%s\n" (show fracs)
  hPrintf stderr "Min: %f\n" (minimum fracs)
  hPrintf stderr "Max: %f\n" (maximum fracs)
  let avg = sum fracs / fromIntegral (length fracs)
  hPrintf stderr "Avg: %f\n" avg
  let std = sqrt (sum [(f - avg) ^ 2 | f <- fracs] / fromIntegral (length fracs))
  hPrintf stderr "Std: %f\n" std
  return ()

-- uniqDiffs :: [String] -> HashSet ([SrcSpan], Prog, String, String, Int)
-- uniqDiffs = foldl' (\seen json -> seen `mappend` HashSet.fromList (mkDiffs json)) mempty

mkDiffs :: String -> [([SrcSpan], Prog, String, String, Int)]
mkDiffs json = case eitherDecode (LBSC.pack json) of
  Left e -> {-trace e-} mempty
    -- -> HashSet.fromList . maybeToList $ mkDiff fix bad
  Right (MkInSample bad' fix' _)
  --Right (MkInSample bads' (fix':_))
    | Left e <- parseTopForm fix'
    -> {-trace e-} mempty
  Right (MkInSample bad' fix' _)
  --Right (MkInSample bads' (fix':_))
    | Left e <- parseTopForm bad'
    -> {-trace e-} mempty
  Right (MkInSample bad' fix' _)
  --Right (MkInSample bads' (fix':_))
    | Right fix <- parseTopForm fix'
    , Right bad <- parseTopForm bad'
    , concatMap getDecld bad /= nub (concatMap getDecld bad)
    -> -- traceShow (concatMap getDecld bad)
       mempty
  Right (MkInSample bad' fix' idx)
  --Right (MkInSample bads' (fix':_))
    | Right fix <- parseTopForm fix'
    , Right bad <- parseTopForm bad'
    , let ss = mkDiff'' bad fix
    -- , not (null ss)
    -- -> maybeToList . fmap (,bad, bad', fix') $ mkDiff' bad' fix'
    -> [(ss, bad, bad', fix', idx)]

  -- _ -> mempty
  v -> error (show v)

-- George
mkDiffsWithExprs :: String -> [([(SrcSpan, Expr)], Prog, String, String, Int)]
mkDiffsWithExprs json = case eitherDecode (LBSC.pack json) of
  Left e -> mempty
  Right (MkInSample bad' fix' _)
    | Left e <- parseTopForm fix'
    -> mempty
  Right (MkInSample bad' fix' _)
    | Left e <- parseTopForm bad'
    -> mempty
  Right (MkInSample bad' fix' _)
    | Right fix <- parseTopForm fix'
    , Right bad <- parseTopForm bad'
    , concatMap getDecld bad /= nub (concatMap getDecld bad)
    -> mempty
  Right (MkInSample bad' fix' idx)
    | Right fix <- parseTopForm fix'
    , Right bad <- parseTopForm bad'
    , let ss = mkDiffWithExprs bad fix
    -> [(ss, bad, bad', fix', idx)]
  v -> error (show v)


-- George
mkDiffsWithGenericTrs :: String -> [([(SrcSpan, Expr, ExprGeneric)], Prog, String, String, Int)]
mkDiffsWithGenericTrs json = case eitherDecode (LBSC.pack json) of
  Left e -> mempty
  Right (MkInSample bad' fix' _)
    | Left e <- parseTopForm fix'
    -> mempty
  Right (MkInSample bad' fix' _)
    | Left e <- parseTopForm bad'
    -> mempty
  Right (MkInSample bad' fix' _)
    | Right fix <- parseTopForm fix'
    , Right bad <- parseTopForm bad'
    , concatMap getDecld bad /= nub (concatMap getDecld bad)
    -> mempty
  Right (MkInSample bad' fix' idx)
    | Right fix <- parseTopForm fix'
    , Right bad <- parseTopForm bad'
    , let ss = mkDiffWithGenericTrs bad fix
    -> [(ss, bad, bad', fix', idx)]
  v -> error (show v)


mkFixes :: String -> [Prog]
mkFixes json = case eitherDecode (LBSC.pack json) of
  Left e -> {-trace e-} mempty
  Right (MkInSample bad' fix' _)
  --Right (MkInSample bads' (fix':_))
    | Right fix <- parseTopForm fix'
    -> [fix]
    -- -> HashSet.fromList . maybeToList $ mkDiff fix bad
  Right (MkInSample bad' fix' _)
  --Right (MkInSample bads' (fix':_))
    | Left e <- parseTopForm fix'
    -> {-trace e-} mempty
  Right (MkInSample bad' fix' _)
  --Right (MkInSample bads' (fix':_))
    | Left e <- parseTopForm bad'
    -> {-trace e-} mempty
  v -> error (show v)

mkDiff'' :: Prog -> Prog -> [SrcSpan]
mkDiff'' bad fix
  -- | null x
  -- = trace (render $ prettyProg bad) $ trace (render $ prettyProg fix) $ trace "" $ undefined
  -- | otherwise
  = assert (not (null x)) $ x
  where
  -- x = Set.toList (diffSpans (collapseDiff (getDiff $ diffExprsT bs fs)))
  x = Set.toList (diffSpans (getDiff $ diffExprsT bs fs) bs)
  bs = progExprs bad
  fs = progExprs fix

-- George
mkDiffWithExprs :: Prog -> Prog -> [(SrcSpan, Expr)]
mkDiffWithExprs bad fix = assert (not (null x)) $ x
  where
    x = Set.toList (diffSpansAndExprs (getDiff $ diffExprsT bs fs) bs)
    bs = progExprs bad
    fs = progExprs fix

-- George
mkDiffWithGenericTrs :: Prog -> Prog -> [(SrcSpan, Expr, ExprGeneric)]
mkDiffWithGenericTrs bad fix = assert (not (null x)) $ pruneTrs 2 x
  where
    x = Set.toList (diffSpansAndGenericTrs (getDiff $ diffExprsT bs fs) bs)
    bs = progExprs bad
    fs = progExprs fix

-- George
keepBigTrs :: [(SrcSpan, Expr, ExprGeneric)] -> [(SrcSpan, Expr, ExprGeneric)]
keepBigTrs = filter bigTrs
  where
    bigTrs (_, _, expr) = sizeOfTree expr 0 >= 2

-- George
sizeOfTree :: ExprGeneric -> Int -> Int
sizeOfTree e depth = case e of
  EmptyG -> depth + 1
  VarG -> depth + 1
  LamG e' -> sizeOfTree e' (depth + 1)
  AppG es -> safeMaximum es depth
  BopG e1 e2 -> max (sizeOfTree e1 (depth + 1)) (sizeOfTree e2 (depth + 1))
  UopG e' -> (sizeOfTree e' (depth + 1))
  LitG -> depth + 1
  LetG _ pes e' -> max (sizeOfTree e' (depth + 1)) (safeMaximum pes depth)
  IteG e1 e2 e3 -> maximum [(sizeOfTree e1 (depth + 1)), (sizeOfTree e2 (depth + 1)), (sizeOfTree e3 (depth + 1))]
  SeqG e1 e2 -> max (sizeOfTree e1 (depth + 1)) (sizeOfTree e2 (depth + 1))
  CaseG e' as -> max (sizeOfTree e' (depth + 1)) (safeMaximum (Set.map snd as) depth) -- TODO: check 1st arg of as
  TupleG es -> safeMaximum es depth
  ConAppG _ _ -> depth + 1 -- TODO: do something better
  ListG e' _ -> sizeOfTree e' (depth + 1)
  _ -> error ("sizeOfTree failed: no such expression " ++ show e)
  where safeMaximum li d = if null li then d else maximum $ Set.map (\e' -> sizeOfTree e' (d + 1)) li

-- George
pruneTrs :: Int -> [(SrcSpan, Expr, ExprGeneric)] -> [(SrcSpan, Expr, ExprGeneric)]
pruneTrs maxd li = map pruneOneTr li
  where
    pruneOneTr (ss, e1, e2) =
      if depth <= maxd then (ss, e1, e2) else (ss, e1, ne2)
      where
        depth = sizeOfTree e2 0
        ne2 = cutSubTrs e2 maxd
        cutSubTrs :: ExprGeneric -> Int -> ExprGeneric
        cutSubTrs e 0 = EmptyG
        cutSubTrs e d = case e of
          EmptyG -> EmptyG
          VarG -> VarG
          LamG e' -> LamG (cutSubTrs e' (d - 1))
          AppG es -> AppG (Set.map (\e'' -> cutSubTrs e'' (d - 1)) es)
          BopG e1 e2 -> BopG (cutSubTrs e1 (d - 1)) (cutSubTrs e2 (d - 1))
          UopG e' -> UopG (cutSubTrs e' (d - 1))
          LitG -> LitG
          LetG r pes e' -> LetG r (Set.map (\e'' -> cutSubTrs e'' (d - 1)) pes) (cutSubTrs e' (d - 1))
          IteG e1 e2 e3 -> IteG (cutSubTrs e1 (d - 1)) (cutSubTrs e2 (d - 1)) (cutSubTrs e3  (d - 1))
          SeqG e1 e2 -> SeqG (cutSubTrs e1 (d - 1)) (cutSubTrs e2 (d - 1))
          CaseG e' as -> CaseG (cutSubTrs e' (d - 1)) (Set.map (\(me, e'') -> (me >>= (\e'' -> Just (cutSubTrs e'' (d - 1))), (cutSubTrs e'' (d - 1)))) as)
          TupleG es -> TupleG (Set.map (\e' -> cutSubTrs e' (d - 1)) es)
          ConAppG me mt -> ConAppG (me >>= (\e' -> Just (cutSubTrs e' (d - 1)))) mt
          ListG e' mt -> ListG (cutSubTrs e' (d - 1)) mt
          _ -> error ("pruneTrs failed: no such expression " ++ show e)

runTFeaturesDiff
  :: [Feature] -> ([SrcSpan], Prog)
  -> Maybe (Header, [NamedRecord], [SrcSpan])
runTFeaturesDiff fs (ls, bad)
  | null samples
  = Nothing
  | otherwise
  = Just (header, samples, nub cores)
  where
  header = Vector.fromList
         $ ["SourceSpan", "L-NoChange", "L-DidChange", "F-InSlice"]
        ++ concatMap (\(ls,_) -> map mkFeature ls) fs

  samples
    | null cores
    -- something went wrong other than typechecking success
    , Just e <- me = trace ("WARNING: "++show e) []
    --- | null cores || length cores == 1
    -- = trace (show (prettyProg bad) ++ "\n------------------------------------------\n") [] -- undefined -- FIXME: shouldn't happen!!
    --- | otherwise
    -- = assert (not (null (intersect cores ls))) $
    --   concatMap mkfsD tbad
    --- | null (intersect cores ls)
    -- = trace (show (prettyProg bad) ++ "\n------------------------------------------\n") [] -- FIXME: sigh..
    | otherwise = concatMap mkfsD tbad

  (tbad, cores, me) = case runEval stdOpts (typeProg bad) of
    Left e -> -- traceShow e
              ([], [], Just e)
    Right (p, cs) -> (p, mapMaybe (constraintSpan) $ (Set.toList (mconcat cs)), Nothing)

  mkfsD (TDFun _ _ pes) = mconcat (map (mkTypeOut . snd) pes)
  mkfsD (TDEvl _ e) = mkTypeOut e
  mkfsD _ = mempty

  didChange l
    --- | any (l `isSubSpanOf`) ls
    | any (l ==) ls
    = ["L-DidChange" .= (1::Double), "L-NoChange" .= (0::Double)]
    | otherwise
    = ["L-DidChange" .= (0::Double), "L-NoChange" .= (1::Double)]

  inSlice l
    --- | any (l `isSubSpanOf`) cores
    | any (l ==) cores
    = ["F-InSlice" .= (1::Double)]
    | otherwise
    = ["F-InSlice" .= (0::Double)]

  mkTypeOut :: TExpr -> [NamedRecord]
  mkTypeOut te = ctfold f [] te
    where
    f p e acc = (:acc) . namedRecord $
                ["SourceSpan" .= show (infoSpan (texprInfo e))]
             ++ didChange (infoSpan (texprInfo e))
             ++ inSlice (infoSpan (texprInfo e))
             ++ concatMap (\(ls,c) -> zipWith (.=) (map mkFeature ls) (c p e)) fs


runTFeaturesTypes
  :: [Feature] -> Prog
  -> (Header, [NamedRecord])
runTFeaturesTypes fs fix = (header, samples)
  where
  header = Vector.fromList
         $ map (\(l,_) -> mkLabel l) preds_tcon
        ++ concatMap (\(ls,_) -> map mkFeature ls) fs

  samples = concatMap mkfsD tfix

  tfix = case runEval stdOpts (typeProg fix) of
    Left e -> traceShow e []
    Right (p, _) -> p

  mkfsD (TDFun _ _ pes) = mconcat (map (mkTypeOut . snd) pes)
  mkfsD (TDEvl _ e) = mkTypeOut e
  mkfsD _ = mempty

  mkTypeOut :: TExpr -> [NamedRecord]
  mkTypeOut te = ctfold f [] te
    where
    f p e acc = (:acc) . namedRecord $
                map (\(l,c) -> mkLabel l .= c e) preds_tcon
             ++ concatMap (\(ls,c) -> zipWith (.=) (map mkFeature ls) (c p e)) fs

mkLabel :: String -> BSC.ByteString
mkLabel s = BSC.pack ("L-" ++ s)

mkFeature :: String -> BSC.ByteString
mkFeature s = BSC.pack ("F-" ++ s)


data InSample = MkInSample { bad :: String, fix :: String, index :: Int }
  deriving (Show, Generic)
instance FromJSON InSample
