{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE MultiWayIf        #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BangPatterns      #-}
-- {-# LANGUAGE LambdaCase        #-}
-- {-# LANGUAGE TupleSections     #-}

module Main where

import           Control.Exception          (assert, evaluate)
import           Control.Monad
import           Control.DeepSeq
import           Control.Arrow              (second)
import           Data.Aeson                 (ToJSON(..), FromJSON(..), eitherDecode)
import qualified Data.Aeson                 as Aeson
import qualified Data.Algorithm.Diff        as Diff
import qualified Data.ByteString.Char8      as BSC
import qualified Data.ByteString.Lazy.Char8 as LBSC
import           Data.Ord                   as DO
import           Data.Csv
import           Data.Either
import           Data.Function
import           Data.List
import qualified Data.Map.Strict            as Map
import           Data.Maybe
import qualified Data.HashMap.Strict        as HashMap
import qualified Data.HashSet               as HashSet
import           Data.HashSet               (HashSet)
import qualified Data.Set                   as Set
import           Data.Set                   (Set)
import qualified Data.Vector                as V
import           Data.Containers.ListUtils  (nubOrd, nubOrdOn)
import           GHC.Generics
import           Options.Generic            hiding (All(..))
import           System.Directory
import           System.Environment
import           System.FilePath
import           System.IO
import           Text.Printf

import           NanoML.Classify
import           NanoML.Lexer
import           NanoML.Monad
import           NanoML.Parser
import           NanoML.Pretty
import           NanoML.Types               hiding (Kind)
import           NanoML.Instantiate

import           Debug.Trace


data Generate = Generate
  { source   :: FilePath
  , features :: String
  , out      :: FilePath
  , clusters :: Maybe String
  }
  deriving (Generic, Show)
instance ParseRecord Generate

main :: IO ()
main = do
  Generate {source=src, features=cls, out=out, clusters=clusters_file} <-
    getRecord "generate-features"
  jsons <- lines <$> readFile src -- (readFile $ "features/data/ucsd/data/derived" </> src </> "pairs.json")
  let cfile = fromMaybe "data/sp14_all/clusters/top_clusters.json" clusters_file
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
      -> mkBadFeatures out cls preds_tis jsons
    "op+slice"
      -> mkBadFeaturesWithSlice All out cls preds_tis jsons
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
    "tiny+clusters"
      -> do
        bd <- readFile "data/bad.ml"
        fx <- readFile "data/fix.ml"
        mkClusters' False preds_tis bd fx
    "clusters+some"
      -> mkClusters False out cls mempty preds_tis jsons
    "clusters+all"
      -> mkClusters False out cls mempty (preds_tsize ++ preds_tis ++ map only_ctx preds_tis_ctx) jsons
    "known+clusters+all"
      -> do
        top_cls <- map readClusterFile . lines <$> readFile cfile
        mkClusters True out cls top_cls (preds_tsize ++ preds_tis ++ map only_ctx preds_tis_ctx) jsons
    _ -> errorWithoutStackTrace "main failed: No such parameter for --features"


data WithSlice = JustSlice | All deriving Eq

mkBadFeatures :: String -> String -> [Feature] -> [String] -> IO ()
mkBadFeatures = mkBadFeaturesWithSlice JustSlice

mkBadFeaturesWithSlice :: WithSlice -> String -> String -> [Feature] -> [String] -> IO ()
mkBadFeaturesWithSlice withSlice out nm fs jsons = do
  let uniqs = concatMap mkDiffs jsons
  let feats = [ ((h, f'), (ss, bad, fix, c, all, idx))
              | (ss, p, bad, fix, idx) <- uniqs
              , (h, f, c) <- maybeToList $ runTFeaturesDiff fs (ss, p)
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
      | null (ss `intersect` cs) -> do
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


mkClusters :: Bool -> String -> String -> [([ExprGeneric], [ExprGeneric])] -> [Feature] -> [String] -> IO ()
mkClusters forTestSet out nm known_cls fs jsons = do
  let uniqs = concatMap mkDiffsWithGenericTrs jsons
  let feats = [ ((h, f'), (ss, bad, fix, badStr, fixStr, c, all, idx))
              | (ss, bad, fix, badStr, fixStr, idx) <- uniqs
              , (h, f, c) <- maybeToList $ runTFeaturesDiff fs (map fst3 ss, bad)
              , let f' = filter (\r -> r HashMap.! "F-InSlice" == "1.0") f -- Remove this for all spans
              , let all = nub $ map (fromJust.getSrcSpanExprMaybe)
                                    (concatMap allSubExprs $ progExprs bad)
              ]
  let feats' = filter (\(_, (ss,_,fix,_,_,cs,_,_)) -> not (null cs) && not (null (getAllTypedExprs fix))) feats
  let sizes = concatMap (\f@(_, (ss, _, _, _, _, _, _, _)) -> map (fromIntegral . sizeOfTree . thd3) ss) feats'
  let mkMean f xs = sum (map f xs) / genericLength xs
  let mkFrac (_, (ss, _, _, _, _, _, all, _)) = genericLength (filter (\ss' -> any (isSubSpanOf ss') $ map fst3 ss) all) / genericLength all
  let mean = mkMean mkFrac feats' :: Double
  let mean_fixes = sum sizes / genericLength sizes :: Double
  let std = 1.4 * sqrt (mkMean (\x -> (mkFrac x - mean) ^ 2) feats')
  let std_fixes = 1.4 * sqrt (sum $ map (\x -> (x - mean_fixes) ^ 2) sizes)
  usefulls <- forM feats' $ \f@((_, _), (ss, _, fix, badStr, fixStr, cs, _, i)) -> do
    let ss' = map fst3 ss
    let lsizes = map (fromIntegral . sizeOfTree . thd3) ss
    let lmean = sum lsizes / genericLength lsizes :: Double
    if
      | mkFrac f > mean + std -> do
        printf (show i ++ ". OUTLIER: %.2f > %.2f\n") (mkFrac f :: Double) (mean + std)
        return mempty
      | null ss' -> do
        putStrLn (show i ++ ". NO DIFF")
        return mempty
      | null (map fst3 ss `intersect` cs) -> do
        putStrLn (show i ++ ". NO OVERLAP CORE/DIFF")
        return mempty
      | length ss' > 4 -> do
        putStrLn (show i ++ ". TOO MANY CHANGES")
        return mempty
      | lmean > mean_fixes + std_fixes -> do
        printf (show i ++ ". VERY BIG CHANGES: %.2f > %.2f\n") lmean (mean_fixes + std_fixes)
        return mempty
      | otherwise -> do
        return [f]
  let fts = concat usefulls
  let ss_fixes = concatMap (\f@(_, (ss, _, _, _, _, _, _, _)) -> map thd3 ss) fts
  -- Returns clusters [(set1, set2)], where set1 has unpruned egs and set2 the pruned egs at given depth dp
  let dp = 2
  let clusters = makeClusters ss_fixes dp
  let elems
        = forM fts (\f@(_, (ss, _, fix, _, _, cs, allspans, _)) ->
          return $ map (\(ss', e, eg) -> (e, progExprs fix, eg, render $ pretty e)) ss)
            >>= concat
  let els = map (\(_, _, y, z) -> (y, z)) elems
  let cls = map (\(_, prc) -> map snd (filter (\(x, _) -> pruneGTree dp x `eleq` prc) els)) clusters

  -- Keep only top N clusters as templates for ML labels or read them from the training set
  let !actual_cls = take 50 $ map snd $ sortOn (DO.Down . \(x, _) -> length x) (zip cls clusters)
  let top_cls =
        if forTestSet then known_cls
        else actual_cls
  let mn = min (length top_cls) 50
  let cls_names = zipWith (\x y -> BSC.pack $ x ++ show y) (replicate mn "L-Cluster") [1..mn]

  -- Print the clusters
  putStrLn ("Number of clusters = " ++ show (length clusters))
  let sorted_cls = sortOn (DO.Down . \(x, _) -> length x) (zip cls (map snd clusters))
  forM_ (zip [1..] sorted_cls) $ \(i, (vals, c)) -> do
    let fn   = printf "%04d" (i :: Int)
    let path = out </> "clusters" </> fn <.> "ml"
    createDirectoryIfMissing True (takeDirectory path)
    let string_cls = show (minimumBy (comparing sizeOfTree) c) : nubOrd vals
    writeFile path $ unlines string_cls
  let clu_path = out </> "clusters" </> "top_clusters" <.> "json"
  LBSC.writeFile clu_path $ LBSC.unlines $ map (Aeson.encode . mkClsWithTs) actual_cls

  -- Find all functions and print them ranked based on # of appearances
  let el_es = map (\(x, _, _, _) -> x) elems
  let el_ps = concatMap (\(_, x, _, _) -> x) elems
  let f_vars = filter (`elem` rankedPrimVars) $ concatMap getFuns el_es
  let p_vars = filter (`elem` rankedPrimVars) $ concatMap getFuns el_ps
  let vars = rankEs f_vars p_vars
  let vpaths = out </> "clusters" </> "ranked_funs" <.> "json"
  LBSC.writeFile vpaths $ Aeson.encode vars

  -- Find all DCons and print them ranked based on # of appearances
  let f_dcons = concatMap getDCons $ concatMap allSubExprs el_es
  let p_dcons = concatMap getDCons $ concatMap allSubExprs el_ps
  let dcons = rankEs f_dcons p_dcons
  let dpaths = out </> "clusters" </> "ranked_dcons" <.> "json"
  LBSC.writeFile dpaths $ Aeson.encode dcons

  -- Make the ML dataset and print it into csv files
  forM_ fts $ \f@((header, features), (ss, bad, fix, badStr, fixStr, cs, allspans, i)) -> do
    let ss_expr  = map (\(fi, se, td) -> show fi ++ "\n" ++ render (pretty se) ++ "\n" ++ show (pruneGTree dp td) ++ "\n") ss
    let give_labels xx (_, cl) lbl
          | pruneGTree dp (thd3 xx) `eleq` cl = lbl .= (1::Double)
          | otherwise                         = lbl .= (0::Double)
    let in_cluster xx = namedRecord $ zipWith (give_labels xx) top_cls cls_names
    let the_ss xx     = namedRecord ["SourceSpan" .= show xx]
    let labels        = zipWith HashMap.union (map in_cluster ss) (map (the_ss . fst3) ss)

    let getTypeFs ss' = runTFeaturesDiff preds_tcon_ctx (map fst3 ss, replaceSSWithExpr bad (mkTHole ss' 1))
    let rtfd = mapMaybe (\ss' -> getTypeFs ss' >>= \(h, nr, _) -> Just (h, filter (\r -> BSC.unpack (r HashMap.! "SourceSpan") == show ss') nr)) cs
    let all_fs' = concatMap snd rtfd
    let header' = fst $ head rtfd
    let features' = map (\ff -> HashMap.union ff (namedRecord $ map (\lbl -> lbl .= (0::Double)) cls_names)) features

    let fs' = map (\nr -> HashMap.union (fromJust $ find (\nr' -> nr' HashMap.! "SourceSpan" == nr HashMap.! "SourceSpan") features') nr) all_fs'
    let new_features = map (\nr -> HashMap.union (fromMaybe nr $ find (\nr' -> nr' HashMap.! "SourceSpan" == nr HashMap.! "SourceSpan") labels) nr) fs'
    -- print $ length new_features
    let new_header = V.take 1 header V.++ V.fromList cls_names V.++ V.tail header V.++ V.drop 4 header'
    let fn   = printf "%04d" (i :: Int)
    let path = out </> nm </> fn <.> "csv"
    createDirectoryIfMissing True (takeDirectory path)
    LBSC.writeFile path $ encodeByName new_header new_features
    let fpath = out </> fn <.> "ml"
    writeFile fpath $ unlines $ [ badStr, "", "(* fix", fixStr, "*)" ]
                            ++ [ "", "(* changed spans" ] ++ ss_expr ++ [ "*)" ]
                            ++ [ "", "(* type error slice" ] ++ map show cs ++ [ "*)" ]
  -- Print some final messages
  printf "MEAN / STD frac: %.3f / %.3f\n" mean std
  print $ length ss_fixes
  print $ length clusters
  let cluster_lens = map (\li -> (head li, length li)) $ reverse $ group $ sort $ map length cls
  print cluster_lens

eleq :: ExprGeneric -> [ExprGeneric] -> Bool
eleq EmptyG [EmptyG] = True
eleq a [EmptyG] = False
eleq a as = any (eq a) as'
  where
    as' = delete EmptyG as

-- George
getEgMtype :: (SrcSpan, Expr, ExprGeneric) -> [SrcSpan] -> [TExpr] -> Maybe Type
getEgMtype (ss, e, eg) alls tes
  | eg == EmptyG      = return (TVar "tEMPTY")
  | ss `notElem` alls = return (TVar "tNewPart")
  | otherwise         = generaliseT . getType <$> find (\te -> return (getTSrcSpan te) == getSrcSpanExprMaybe e) tes

-- George
mkClusters' :: Bool -> [Feature] -> String -> String -> IO ()
mkClusters' forTestSet fs badStr' fixStr' = do
  let uniqs = mkDiffsString badStr' fixStr'
  let feats = [ ((h, f, f'), (ss', bad, fix, badStr, fixStr, c, all, idx))
              | (ss', bad, fix, badStr, fixStr, idx) <- uniqs
              , let ss = map fst3 ss'
              , (h, f, c) <- maybeToList $ runTFeaturesDiff fs (ss, bad)
              , let f' = filter (\r -> r HashMap.! "F-InSlice" == "1.0") f -- Remove this for all spans
              , let all = nub $ map (fromJust.getSrcSpanExprMaybe)
                                    (concatMap allSubExprs $ progExprs bad)
              ]

  forM_ feats $ \ f@((header, all_fs, features), (ss, bad, fix, badStr, fixStr, cs, allspans, i)) -> do
    let ss' = map fst3 ss
    if
      | null ss' -> do
        putStrLn "NO DIFF"
        -- putStrLn badStr
        -- putStrLn "---------------------------"
        -- putStrLn fixStr
      | null (getAllTypedExprs fix) -> do
        putStrLn $ "CAN'T TYPE-CHECK THE FIXED PROGRAM " ++ show i
        -- putStrLn fixStr
      | otherwise -> do
        let ss_expr  = map (\(fi, se, td) -> show fi ++ "\n" ++ render (pretty se) ++ "\n" ++ show td ++ "\n") ss
        let typed_es = nub $ getAllTypedExprs fix
        let fixed_ss = mapMaybe (\(ss', e, eg) -> if eg == EmptyG then Nothing else getSrcSpanExprMaybe e) ss
        let typed_ss = mapMaybe (\ss' -> find (\te -> getTSrcSpan te == ss') typed_es) fixed_ss
        let fn       = printf "%04d" (i :: Int)
        let fixed_ss_bad = mapMaybe (\(ss', e, eg) -> if eg == EmptyG then Nothing else Just ss') ss
        let typed_es_bad = nub $ getAllTypedExprs $ replaceAll bad fixed_ss_bad
        let typed_ss_bad = mapMaybe (\ss' -> find (\te -> getTSrcSpan te == ss') typed_es_bad) fixed_ss_bad
        -- let typed_ss_bad = mapMaybe (\ss' -> find (\te -> getTSrcSpan te == ss') (nub $ getAllTypedExprs $ replaceSSWithExpr bad (mkTHole ss' 1))) fixed_ss_bad
        let path = "data" </> fn <.> "ml"
        writeFile path $ unlines $ [ badStr, "", "(* fix", fixStr, "*)"]
                                ++ [ "", "(* changed spans" ] ++ ss_expr ++ [ "*)" ]
                                -- ++ [ "", "(* changed spans" ] ++ map show (concatMap allSubExprs $ progExprs fix) ++ [ "*)" ]
                                ++ [ "", "(* typed spans" ] ++ map show fixed_ss ++ [ "*)" ]
                                ++ [ "", "(* correct types" ] ++ map (render . pretty . generaliseT . getType) typed_ss ++ [ "*)" ]
                                ++ [ "", "(* correct types" ] ++ map (show . generaliseT . getType) typed_ss ++ [ "*)" ]
                                ++ [ "", "(* bad types" ] ++ map (render . pretty . generaliseT . getType) typed_ss_bad ++ [ "*)" ]
                                ++ [ "", "(* bad types" ] ++ map (show . generaliseT . getType) typed_ss_bad ++ [ "*)" ]
                                ++ [ "", "(* isSubType" ] ++ map show (zipWith isSubType (map (generaliseT . getType) typed_ss) (map (generaliseTreverse . getType) typed_ss_bad)) ++ [ "*)" ]
                                -- ++ [ "", "(* Diff" ] ++ map show (filter (\case
                                --                                             Diff.Both _ _ -> False
                                --                                             _ -> True) (Diff.getDiffBy (\e1 e2 -> exprKind e1 == exprKind e2) (concatMap allSubExprs $ progExprs bad) (concatMap allSubExprs $ progExprs fix))) ++ [ "*)" ]
        unless (length typed_ss == length typed_ss_bad) (putStrLn $ "i = " ++ show i)
        putStrLn "Finished!"


-- George
readFile' :: FilePath -> IO String
readFile' fn = do
    h <- openFile fn ReadMode
    s <- hGetContents h
    evaluate (rnf s)
    hClose h
    return s

-- George
readClusterFile :: String -> ([ExprGeneric], [ExprGeneric])
readClusterFile f = case eitherDecode (LBSC.pack f) of
  Left err                       -> error ("readClusterFile failed: " ++ err)
  Right (MkClsWithTs egs pruned) -> (egs, pruned)

data ClsWithTs = MkClsWithTs { egs :: [ExprGeneric], pruned :: [ExprGeneric] }
  deriving (Show, Generic)
instance ToJSON ClsWithTs
instance FromJSON ClsWithTs

mkClsWithTs :: ([ExprGeneric], [ExprGeneric]) -> ClsWithTs
mkClsWithTs (egs, pruned) = MkClsWithTs egs pruned

rankEs :: Ord a => [a] -> [a] -> [a]
rankEs es ps = map fst $ sortOn (DO.Down . snd) $ zip alls $ zip un_es un_ps
  where
    alls  = nubOrd (es ++ ps)
    un_es = map (\v -> length $ filter (==v) es) alls
    un_ps = map (\v -> length $ filter (==v) es) alls

makeClusters :: [ExprGeneric] -> Int -> [([ExprGeneric], [ExprGeneric])]
makeClusters es depth = assert (Set.fromList (concatMap fst cls) == Set.fromList (delete EmptyG es)) ret
  where
    init_cls = map (\e -> (e, pruneGTree depth e)) $ delete EmptyG $ nubOrd $ sortOn (\e -> (depthOfTree e 0, sizeOfTree e)) es
    go es' = map (\(e, pre) -> filter (eq pre . snd) es') es'
    to [] = []
    to (xs:xss) = ys : to no
      where
        eqSnd x y = snd x `eq` snd y
        yes = filter (not.null.intersectBy eqSnd xs) xss
        ys = nubOrdOn fst (xs ++ concat yes)
        no = filter (null.intersectBy eqSnd ys) xss
    cls = map ((\(x, y) -> (nubOrd x, nubOrd y)) . unzip) $ to $ go init_cls
    final_cls = map (\(x, y) -> (x, sortOn (DO.Down . \y' -> length $ filter (eq y' . pruneGTree depth) es) y)) cls
    ret = if EmptyG `elem` es then ([EmptyG], [EmptyG]) : cls else cls


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
              , not (null outs)
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
mkDiffsWithGenericTrs :: String -> [([(SrcSpan, Expr, ExprGeneric)], Prog, Prog, String, String, Int)]
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
    -> [(ss, bad, fix, bad', fix', idx)]
  v -> error (show v)


-- George
mkDiffsString :: String -> String -> [([(SrcSpan, Expr, ExprGeneric)], Prog, Prog, String, String, Int)]
mkDiffsString bad' fix' = case (parseTopForm fix' ,parseTopForm bad') of
  (Right fix, Right bad)
    | let ss = mkDiffWithGenericTrs bad fix ->
    if concatMap getDecld bad /= nub (concatMap getDecld bad)
      then mempty
      else [(ss, bad, fix, bad', fix', 0)]
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
  = assert (not (null x)) x
  where
  -- x = Set.toList (diffSpans (collapseDiff (getDiff $ diffExprsT bs fs)))
  x  = Set.toList (diffSpans (getDiff $ diffExprsT bs fs) bs)
  -- x  = mconcat $ map Set.toList $ zipWith diff bs fs
  bs = progExprs bad
  fs = progExprs fix


-- George
mkDiffWithGenericTrs :: Prog -> Prog -> [(SrcSpan, Expr, ExprGeneric)]
mkDiffWithGenericTrs bad fix = assert (not (null x)) x
  where
    x  = diffSpansAndGenericTrs (getDiff $ diffExprsT bs fs) bs fs
    bad' = diffProg bad fix
    fix' = diffProg fix bad
    bs = progExprs bad'
    fs = progExprs fix'


-- George
replaceAll :: Prog -> [SrcSpan] -> Prog
replaceAll p sss
  = foldl (\ p' (i, ss) -> replaceSSWithExpr p' (mkTHole ss i)) p (zip [0..] sss)

-- George
isSubTypeAny :: Type -> [Type] -> Bool
isSubTypeAny e l = any (`isSubType` e) l

-- George
isSubType :: Type -> Type -> Bool
isSubType ti to | ti == to = True
isSubType (xi :-> xo) (yi :-> yo) = xi `isSubType` yi && xo `isSubType` yo
isSubType (TTup xs) (TTup ys)
  | length xs == length ys
    = and (zipWith isSubType xs ys)
  | otherwise
    = False
isSubType to@(TApp xc xts) ti@(TApp yc yts)
  | xc == yc
    = and (zipWith isSubType xts yts)
  | otherwise = False
isSubType to@(TVar a) ti =
  case runEval stdOpts (unifySubType to ti) of
    Left e  -> False
    Right b -> b
isSubType to@TApp {} ti@(TVar a) =
  case runEval stdOpts (unifySubType to ti) of
    Left e  -> False
    Right b -> b
isSubType to@TTup {} ti@(TVar a) =
  case runEval stdOpts (unifySubType to ti) of
    Left e  -> False
    Right b -> b
isSubType t (TVar a) = False
isSubType ti to = False
-- replace all
-- 96.4543524416136 : subType
-- 54.62845010615711 : exactly the same

-- replace one at a time
-- 80.16985138004246 : subType
-- 51.76220806794055 : exactly the same

-- isSubType to t =
--   case runEval stdOpts (unifySubType to t) of
--     Left e  -> False
--     Right b -> b
-- 99.97875955819882

-- George
getAllTypedExprs :: Prog -> [TExpr]
getAllTypedExprs fix = concatMap allSubTExprs samples
  where
    samples = progTExprs tfix

    tfix = case runEval stdOpts (typeProg fix) of
      Left e       -> []
      Right (p, _) -> p

    progTExprs []     = []
    progTExprs (d:ds) = case d of
      TDFun _ _ pes -> map snd pes ++ progTExprs ds
      TDEvl _ e     -> e : progTExprs ds
      _             -> progTExprs ds


-- George
allSubTExprs :: TExpr -> [TExpr]
allSubTExprs e = e : case e of
  T_Var {}        -> []
  T_Lam _ _ x     -> allSubTExprs x
  T_App _ x xs    -> allSubTExprs x ++ concatMap allSubTExprs xs
  T_Bop _ _ x y   -> allSubTExprs x ++ allSubTExprs y
  T_Uop _ _ x     -> allSubTExprs x
  T_Lit {}        -> []
  T_Let _ _ pes x -> concatMap (allSubTExprs.snd) pes ++ allSubTExprs x
  T_Ite _ x y z   -> allSubTExprs x ++ allSubTExprs y ++ allSubTExprs z
  T_Seq _ x y     -> allSubTExprs x ++ allSubTExprs y
  T_Case _ x alts -> allSubTExprs x
                     ++ concatMap (maybe [] allSubTExprs . snd3) alts
                     ++ concatMap (allSubTExprs.thd3) alts
  T_Tuple _ xs    -> concatMap allSubTExprs xs
  T_List _ xs     -> concatMap allSubTExprs xs
  T_ConApp _ _ me -> case me of
    Nothing             -> []
    Just (T_Tuple _ xs) -> concatMap allSubTExprs xs
    Just x              -> allSubTExprs x


runTFeaturesDiff :: [Feature] -> ([SrcSpan], Prog) -> Maybe (Header, [NamedRecord], [SrcSpan])
runTFeaturesDiff fs (ls, bad)
  | null samples = Nothing
  | otherwise    = Just (header, samples, nub cores)
  where
  header = V.fromList
         $ ["SourceSpan", "L-NoChange", "L-DidChange", "F-InSlice"]
        ++ concatMap (\(ls,_) -> map mkFeature ls) fs

  samples
    | null cores
    -- something went wrong other than typechecking success
    , Just e <- me = trace ("WARNING: " ++ show e) []
    | otherwise = concatMap mkfsD tbad

  (tbad, cores, me) = case runEval stdOpts (typeProg bad) of
    Left e        -> ([], [], Just e) -- traceShow e
    Right (p, cs) -> (p, mapMaybe constraintSpan (Set.toList (mconcat cs)), Nothing)

  mkfsD (TDFun _ _ pes) = mconcat (map (mkTypeOut . snd) pes)
  mkfsD (TDEvl _ e)     = mkTypeOut e
  mkfsD _               = mempty

  didChange l
    --- | any (l `isSubSpanOf`) ls
    | l `elem` ls
    = ["L-DidChange" .= (1::Double), "L-NoChange" .= (0::Double)]
    | otherwise
    = ["L-DidChange" .= (0::Double), "L-NoChange" .= (1::Double)]

  inSlice l
    --- | any (l `isSubSpanOf`) cores
    | l `elem` cores
    = ["F-InSlice" .= (1::Double)]
    | otherwise
    = ["F-InSlice" .= (0::Double)]

  mkTypeOut :: TExpr -> [NamedRecord]
  mkTypeOut = actfold f []
    where
    f p e acc = (:acc) . namedRecord $
                ["SourceSpan" .= show (infoSpan (texprInfo e))]
             ++ didChange (infoSpan (texprInfo e))
             ++ inSlice (infoSpan (texprInfo e))
             ++ concatMap (\(ls, c) -> zipWith (.=) (map mkFeature ls) (c p e)) fs


runTFeaturesTypes :: [Feature] -> Prog -> (Header, [NamedRecord])
runTFeaturesTypes fs fix = (header, samples)
  where
  header = V.fromList
         $ map (\(l,_) -> mkLabel l) preds_tcon
        ++ concatMap (\(ls,_) -> map mkFeature ls) fs

  samples = concatMap mkfsD tfix

  tfix = case runEval stdOpts (typeProg fix) of
    Left e       -> traceShow e []
    Right (p, _) -> p

  mkfsD (TDFun _ _ pes) = mconcat (map (mkTypeOut . snd) pes)
  mkfsD (TDEvl _ e)     = mkTypeOut e
  mkfsD _               = mempty

  mkTypeOut :: TExpr -> [NamedRecord]
  mkTypeOut = actfold f []
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
