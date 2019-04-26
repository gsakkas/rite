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
import qualified Data.Vector                as V
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
        ff <- lines <$> readFile cfile
        let top_cls = map readJSONLFile ff
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


-- George
-- mkClusters :: Bool -> String -> String -> [(ExprGeneric, [Type])] -> [Feature] -> [String] -> IO ()
-- mkClusters forTestSet out nm known_cls fs jsons = do
--   let uniqs = concatMap mkDiffsWithGenericTrs jsons
--   let feats = [ ((h, f, f'), (ss', bad, fix, badStr, fixStr, c, all, idx))
--               | (ss', bad, fix, badStr, fixStr, idx) <- uniqs
--               , let ss = map fst3 ss'
--               , (h, f, c) <- maybeToList $ runTFeaturesDiff fs (ss, bad)
--               , let f' = filter (\r -> r HashMap.! "F-InSlice" == "1.0") f -- Remove this for all spans
--               , let all = nub $ map (fromJust.getSrcSpanExprMaybe)
--                                     (concatMap allSubExprs $ progExprs bad)
--               ]
--   let feats'      = filter (\(_, (ss,_,fix,_,_,cs,_,_)) -> not (null (getAllTypedExprs fix)) && not (null (map fst3 ss `intersect` cs))) feats
--   let mkMean f xs = sum (map f xs) / genericLength xs
--   let mkFrac (_, (ss, _, _, _, _, _, all, _)) = genericLength ss / genericLength all
--   let mean = mkMean mkFrac feats' :: Double
--   let std  = sqrt $ mkMean (\x -> (mkFrac x - mean) ^ 2) feats'
--   usefulls <- forM feats $ \ f@((_, _, _), (ss, _, fix, badStr, fixStr, cs, _, i)) -> do
--     let ss' = map fst3 ss
--     if
--       | mkFrac f > mean + 2 * std -> do
--         printf (show i ++ ". OUTLIER: %.2f > %.2f\n") (mkFrac f :: Double) (mean + 2 * std)
--         return mempty
--       | null ss' -> do
--         putStrLn (show i ++ ". NO DIFF")
--         -- putStrLn badStr
--         -- putStrLn "---------------------------"
--         -- putStrLn fixStr
--         return mempty
--       | null (getAllTypedExprs fix) -> do
--         putStrLn (show i ++ ". CAN'T TYPE-CHECK THE FIXED PROGRAM")
--         -- putStrLn fixStr
--         return mempty
--       | null (map fst3 ss `intersect` cs) -> do
--         putStrLn (show i ++ ". NO OVERLAP CORE/DIFF")
--         -- putStrLn bad
--         -- print cs
--         -- putStrLn fix
--         return mempty
--       | otherwise -> do
--         return [f]
--   let fts = concat usefulls
--   -- Find clusters of fixes to be used as templates
--   let ss_fixes = concatMap (\ f@((_, _, _), (ss, _, _, _, _, _, _, _)) -> map thd3 ss) fts
--   let clusters = makeClusters ss_fixes
--   let elems
--         = forM fts (\ f@((_, _, _), (ss, _, fix, _, _, cs, allspans, _)) -> do
--           let typed_es = nub $ getAllTypedExprs fix
--           let typed_ss = mapMaybe (\(ss', e, eg) -> getEgMtype (ss', e, eg) allspans typed_es >>= \tt -> return (e, eg, tt)) ss
--           return $ map (\(x, y, tt) -> (y, render $ pretty x, tt)) typed_ss)
--             >>= concat
--   let cls = map (\c -> (show c, map (\tup -> (snd3 tup, thd3 tup)) (filter (\(x, _, _) -> x == c) elems))) clusters
--   -- Keep only top N clusters as templates for ML labels or read them from the training set
--   let !actual_cls = take 41 $ map (\tup -> (snd tup, nub $ map snd $ snd (fst tup))) $ sortOn (DO.Down . \(x, _) -> length (snd x)) (zip cls clusters)
--   let top_cls =
--         if forTestSet then known_cls
--         else actual_cls
--   let cls_names = zipWith (\x y -> BSC.pack $ x ++ show y) (replicate 41 "L-Cluster") [1..41]

--   correct <- forM fts $ \ f@((header, all_fs, features), (ss, bad, fix, badStr, fixStr, cs, allspans, i)) -> do
--     let ss_expr  = map (\(fi, se, td) -> show fi ++ "\n" ++ render (pretty se) ++ "\n" ++ show td ++ "\n") ss
--     let typed_es = nub $ getAllTypedExprs fix
--     let fixed_ss = mapMaybe (\(ss', e, eg) -> if eg == EmptyG || ss' `notElem` allspans then Nothing else getSrcSpanExprMaybe e) ss
--     let typed_ss = mapMaybe (\ss' -> find (\te -> getTSrcSpan te == ss') typed_es) fixed_ss

--     let fixed_ss_bad = mapMaybe (\(ss', e, eg) -> if eg == EmptyG || ss' `notElem` allspans then Nothing else Just ss') ss
--     let bad_with_holes = replaceAll bad fixed_ss_bad
--     let typed_es_bad = nub $ getAllTypedExprs bad_with_holes
--     let typed_ss_bad = mapMaybe (\ss' -> find (\te -> getTSrcSpan te == ss') typed_es_bad) fixed_ss_bad
--     -- let typed_ss_bad = mapMaybe (\ss' -> find (\te -> getTSrcSpan te == ss') (nub $ getAllTypedExprs $ replaceSSWithExpr bad (mkTHole ss' 1))) fixed_ss_bad

--     -- let (header', all_fs', _) = fromJust $ runTFeaturesDiff preds_tcon_ctx (map fst3 ss, bad_with_holes)

--     let fn   = printf "%04d" (i :: Int)
--     let path = out </> nm </> fn <.> "csv"
--     createDirectoryIfMissing True (takeDirectory path)
--     let new_header = V.take 1 header V.++ V.fromList cls_names V.++ V.tail header -- V.++ V.drop 4 header'
--     let type_cls = map (\(l1, l2) -> (l1, map generaliseTreverse l2)) top_cls
--     let give_labels xx cl lbl
--           | thd3 xx == fst cl                                                                       = lbl .= (1::Double)
--           | fromMaybe (TVar "tNothing") (getEgMtype xx allspans typed_es_bad) `isSubTypeAny` snd cl = lbl .= (0::Double)
--           | otherwise                                                                               = lbl .= (-1::Double)
--     let in_cluster xx = namedRecord $ zipWith (give_labels xx) type_cls cls_names
--     let the_ss xx     = namedRecord ["SourceSpan" .= show xx]
--     let labels        = zipWith HashMap.union (map in_cluster ss) (map (the_ss . fst3) ss)

--     -- let fs' = map (\nr -> HashMap.union (fromJust $ find (\nr' -> nr' HashMap.! "SourceSpan" == nr HashMap.! "SourceSpan") all_fs) nr) all_fs'
--     -- let only_good_ss = map (\nr -> BSC.unpack (nr HashMap.! "SourceSpan")) fs'
--     let only_good_ss = map (\nr -> BSC.unpack (nr HashMap.! "SourceSpan")) fs'
--     let only_good_ls = filter (\nr -> BSC.unpack (nr HashMap.! "SourceSpan") `elem` only_good_ss) labels
--     -- let new_features = map (\nr -> HashMap.union nr $ fromJust $ find (\nr' -> nr' HashMap.! "SourceSpan" == nr HashMap.! "SourceSpan") fs') only_good_ls
--     let new_features = map (\nr -> HashMap.union nr $ fromJust $ find (\nr' -> nr' HashMap.! "SourceSpan" == nr HashMap.! "SourceSpan") fs') only_good_ls
--     -- print $ length new_features
--     LBSC.writeFile path $ encodeByName new_header new_features
--     let path = out </> fn <.> "ml"
--     writeFile path $ unlines $ [ badStr, "", "(* fix", fixStr, "*)"]
--                             -- ++ [ "", "(* bad with holes" ] ++ lines (render (prettyProg bad_with_holes)) ++ [ "*)" ]
--                             ++ [ "", "(* changed spans" ] ++ ss_expr ++ [ "*)" ]
--                             ++ [ "", "(* type error slice" ] ++ map show cs ++ [ "*)" ]
--                             ++ [ "", "(* typed spans" ] ++ map show fixed_ss ++ [ "*)" ]
--                             ++ [ "", "(* typed bad spans" ] ++ map show fixed_ss_bad ++ [ "*)" ]
--                             ++ [ "", "(* correct types" ] ++ map (render . pretty . generaliseT . getType) typed_ss ++ [ "*)" ]
--                             ++ [ "", "(* bad types" ] ++ map (render . pretty . generaliseT . getType) typed_ss_bad ++ [ "*)" ]
--                             ++ [ "", "(* isSubType" ] ++ map show (zipWith isSubType (map (generaliseT . getType) typed_ss) (map (generaliseTreverse . getType) typed_ss_bad)) ++ [ "*)" ]
--     -- unless (length typed_ss == length typed_ss_bad) (putStrLn $ "i = " ++ show i)
--     -- unless (length typed_ss == length (filter id $ zipWith isSubType (map (generaliseT . getType) typed_ss) (map (generaliseTreverse . getType) typed_ss_bad))) (putStrLn $ "i = " ++ show i)
--     unless (((map fst3 ss) `intersect` cs) == (map fst3 ss)) (putStrLn $ "i = " ++ show i)
--     if length typed_ss == length typed_ss_bad
--       then return (genericLength $ filter id $ zipWith isSubType (map (generaliseT . getType) typed_ss) (map (generaliseTreverse . getType) typed_ss_bad), genericLength typed_ss, (length typed_ss, length typed_ss_bad))
--       else return (0.0, 0.0, (0, 0))

--   let sorted_cls = sortOn (DO.Down . length . snd) cls
--   forM_ (zip [1..] sorted_cls) $ \(i, c) -> do
--     let fn   = printf "%04d" (i :: Int)
--     let path = out </> "clusters" </> fn <.> "ml"
--     createDirectoryIfMissing True (takeDirectory path)
--     let string_cls = fst c : map fst (snd c)
--     writeFile path $ unlines $ nub string_cls -- TODO: Maybe count as well instead of nub
--     let path = out </> "type_clusters" </> fn <.> "ml"
--     createDirectoryIfMissing True (takeDirectory path)
--     let string_tcls = map (render . pretty) $ nub $ map snd (snd c)
--     writeFile path $ unlines $ nub string_tcls
--   let clu_path = out </> "clusters" </> "top_clusters" <.> "json"
--   LBSC.writeFile clu_path $ LBSC.unlines $ map (Aeson.encode . mkClsWithTs) top_cls
--   printf "MEAN / STD frac: %.3f / %.3f\n" mean std
--   print $ length ss_fixes
--   print $ length clusters
--   let cluster_lens = map (\li -> (head li, length li)) $ reverse $ group $ sort $ map (length . snd) cls
--   print cluster_lens
--   let (a, b, c) = unzip3 correct
--   print $ sum a * 100 / sum b
--   let (d, e) = unzip c
--   print (d == e)

mkClusters :: Bool -> String -> String -> [(ExprGeneric, [Type])] -> [Feature] -> [String] -> IO ()
mkClusters forTestSet out nm known_cls fs jsons = do
  let uniqs = concatMap mkDiffsWithGenericTrs jsons
  let feats = [ ((h, f'), (ss, bad, fix, badStr, fixStr, c, all, idx))
              | (ss, bad, fix, badStr, fixStr, idx) <- uniqs
              , (h, f, c) <- maybeToList $ runTFeaturesDiff fs (map fst3 ss, bad)
              , let f' = filter (\r -> r HashMap.! "F-InSlice" == "1.0") f -- Remove this for all spans
              , let all = nub $ map (fromJust.getSrcSpanExprMaybe)
                                    (concatMap allSubExprs $ progExprs bad)
              ]
  let feats'      = filter (\(_, (ss,_,fix,_,_,cs,_,_)) -> not (null (getAllTypedExprs fix)) && not (null (map fst3 ss `intersect` cs))) feats
  let mkMean f xs = sum (map f xs) / genericLength xs
  let mkFrac (_, (ss, _, _, _, _, _, all, _)) = genericLength ss / genericLength all
  let mean = mkMean mkFrac feats' :: Double
  let std  = sqrt $ mkMean (\x -> (mkFrac x - mean) ^ 2) feats'
  usefulls <- forM feats $ \ f@((_, _), (ss, _, fix, badStr, fixStr, cs, _, i)) -> do
    let ss' = map fst3 ss
    if
      | mkFrac f > mean + 2 * std -> do
        printf (show i ++ ". OUTLIER: %.2f > %.2f\n") (mkFrac f :: Double) (mean + 2 * std)
        return mempty
      | null ss' -> do
        putStrLn (show i ++ ". NO DIFF")
        -- putStrLn badStr
        -- putStrLn "---------------------------"
        -- putStrLn fixStr
        return mempty
      | null (getAllTypedExprs fix) -> do
        putStrLn (show i ++ ". CAN'T TYPE-CHECK THE FIXED PROGRAM")
        -- putStrLn fixStr
        return mempty
      | null (map fst3 ss `intersect` cs) -> do
        putStrLn (show i ++ ". NO OVERLAP CORE/DIFF")
        -- putStrLn bad
        -- print cs
        -- putStrLn fix
        return mempty
      | otherwise -> do
        return [f]
  let fts = concat usefulls
  -- Find clusters of fixes to be used as templates
  let ss_fixes = concatMap (\ f@((_, _), (ss, _, _, _, _, _, _, _)) -> map thd3 ss) fts
  let clusters = makeClusters ss_fixes
  let elems
        = forM fts (\ f@((_, _), (ss, _, fix, _, _, cs, allspans, _)) -> do
          let typed_es = nub $ getAllTypedExprs fix
          let typed_ss = mapMaybe (\(ss', e, eg) -> getEgMtype (ss', e, eg) allspans typed_es >>= \tt -> return (e, eg, tt)) ss
          return $ map (\(x, y, tt) -> (y, render $ pretty x, tt)) typed_ss)
            >>= concat
  let cls = map (\c -> (show c, map (\tup -> (snd3 tup, thd3 tup)) (filter (\(x, _, _) -> x == c) elems))) clusters
  -- Keep only top N clusters as templates for ML labels or read them from the training set
  let !actual_cls = take 50 $ map (\tup -> (snd tup, nub $ map snd $ snd (fst tup))) $ sortOn (DO.Down . \(x, _) -> length (snd x)) (zip cls clusters)
  let top_cls =
        if forTestSet then known_cls
        else actual_cls
  let mn = min (length top_cls) 50
  let cls_names = zipWith (\x y -> BSC.pack $ x ++ show y) (replicate mn "L-Cluster") [1..mn]

  forM_ fts $ \ f@((header, features), (ss, bad, fix, badStr, fixStr, cs, allspans, i)) -> do
    let ss_expr  = map (\(fi, se, td) -> show fi ++ "\n" ++ render (pretty se) ++ "\n" ++ show td ++ "\n") ss

    let fn   = printf "%04d" (i :: Int)
    let path = out </> nm </> fn <.> "csv"
    createDirectoryIfMissing True (takeDirectory path)
    let type_cls = map (\(l1, l2) -> (l1, map generaliseT l2)) top_cls
    let give_labels xx cl lbl
          | thd3 xx == fst cl = lbl .= (1::Double)
          | otherwise         = lbl .= (0::Double)
    let in_cluster xx = namedRecord $ zipWith (give_labels xx) type_cls cls_names
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
    LBSC.writeFile path $ encodeByName new_header new_features
    let path = out </> fn <.> "ml"
    writeFile path $ unlines $ [ badStr, "", "(* fix", fixStr, "*)" ]
                            ++ [ "", "(* changed spans" ] ++ ss_expr ++ [ "*)" ]
                            ++ [ "", "(* type error slice" ] ++ map show cs ++ [ "*)" ]

  let sorted_cls = sortOn (DO.Down . length . snd) cls
  forM_ (zip [1..] sorted_cls) $ \(i, c) -> do
    let fn   = printf "%04d" (i :: Int)
    let path = out </> "clusters" </> fn <.> "ml"
    createDirectoryIfMissing True (takeDirectory path)
    let string_cls = fst c : map fst (snd c)
    writeFile path $ unlines $ nub string_cls -- TODO: Maybe count as well instead of nub
    let path = out </> "type_clusters" </> fn <.> "ml"
    createDirectoryIfMissing True (takeDirectory path)
    let string_tcls = map (render . pretty) $ nub $ map snd (snd c)
    writeFile path $ unlines $ nub string_tcls
  let clu_path = out </> "clusters" </> "top_clusters" <.> "json"
  LBSC.writeFile clu_path $ LBSC.unlines $ map (Aeson.encode . mkClsWithTs) top_cls
  printf "MEAN / STD frac: %.3f / %.3f\n" mean std
  print $ length ss_fixes
  print $ length clusters
  let cluster_lens = map (\li -> (head li, length li)) $ reverse $ group $ sort $ map (length . snd) cls
  print cluster_lens


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
readJSONLFile :: String -> (ExprGeneric, [Type])
readJSONLFile f = case eitherDecode (LBSC.pack f) of
  Left err                  -> error ("readClusterFile failed: " ++ err)
  Right (MkClsWithTs eg ts) -> (eg, ts)

data ClsWithTs = MkClsWithTs { cl :: ExprGeneric, ts :: [Type] }
  deriving (Show, Generic)
instance ToJSON ClsWithTs
instance FromJSON ClsWithTs

mkClsWithTs :: (ExprGeneric, [Type]) -> ClsWithTs
mkClsWithTs (eg, ts) = MkClsWithTs eg ts


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
    , let ss = {- trace (show idx) $ -} mkDiffWithGenericTrs bad fix
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
mkDiffWithGenericTrs bad fix = assert (not (null x)) $ pruneTrs 2 x
  where
    x  = diffSpansAndGenericTrs (getDiff $ diffExprsT bs fs) bs fs
    bad' = diffProg bad fix
    fix' = diffProg fix bad
    bs = progExprs bad'
    fs = progExprs fix'


-- George
pruneTrs :: Int -> [(SrcSpan, Expr, ExprGeneric)] -> [(SrcSpan, Expr, ExprGeneric)]
pruneTrs maxd = map pruneOneTr
  where
    pruneOneTr (ss, e1, e2) =
      if depth <= maxd then (ss, e1, e2) else (ss, e1, ne2)
      where
        depth = sizeOfTree e2 0
        ne2   = cutSubTrs e2 maxd
        cutSubTrs :: ExprGeneric -> Int -> ExprGeneric
        cutSubTrs e 0 = EmptyG
        cutSubTrs e d = case e of
          EmptyG        -> EmptyG
          VarG          -> VarG
          LamG p e'     -> LamG (cutSubPs p (max 1 d)) (cutSubTrs e' (d - 1))
          AppG es       -> AppG (Set.map (\e'' -> cutSubTrs e'' (d - 1)) es)
          BopG e1 e2    -> BopG (cutSubTrs e1 (d - 1)) (cutSubTrs e2 (d - 1))
          UopG e'       -> UopG (cutSubTrs e' (d - 1))
          LitG          -> LitG
          LetG r pes e' -> LetG r (Set.map (\(p, e'') -> (cutSubPs p (max 1 d), cutSubTrs e'' (d - 1))) pes) (cutSubTrs e' (d - 1))
          IteG e1 e2 e3 -> IteG (cutSubTrs e1 (d - 1)) (cutSubTrs e2 (d - 1)) (cutSubTrs e3  (d - 1))
          SeqG e1 e2    -> SeqG (cutSubTrs e1 (d - 1)) (cutSubTrs e2 (d - 1))
          CaseG as      -> CaseG (Set.map (\(p, me, e'')
                            -> (cutSubPs p (max 1 d), me >>= (\ e'' -> Just (cutSubTrs e'' (d - 1))), cutSubTrs e'' (d - 1))) as)
          TupleG es     -> TupleG (Set.map (\e' -> cutSubTrs e' (d - 1)) es)
          ConAppG me    -> ConAppG (me >>= (\e' -> Just (cutSubTrs e' (d - 1))))
          ListG es      -> ListG (Set.map (\e' -> cutSubTrs e' (d - 1)) es)
          -- _             -> error ("pruneTrs failed: no such expression " ++ show e)

        cutSubPs :: PatGeneric -> Int -> PatGeneric
        cutSubPs e 0 = EmptyPatG
        cutSubPs e d = case e of
          EmptyPatG        -> EmptyPatG
          VarPatG          -> VarPatG
          LitPatG          -> LitPatG
          IntervalPatG     -> IntervalPatG
          ConsPatG p1 p2   -> ConsPatG (cutSubPs p1 (d - 1)) (cutSubPs p2 (d - 1))
          ConPatG Nothing  -> ConPatG Nothing
          ConPatG (Just p) -> ConPatG (Just $ cutSubPs p (d - 1))
          ListPatG ps      -> ListPatG (Set.map (\p' -> cutSubPs p' (d - 1)) ps)
          TuplePatG ps     -> TuplePatG (Set.map (\p' -> cutSubPs p' (d - 1)) ps)
          WildPatG         -> WildPatG
          OrPatG p1 p2     -> OrPatG (cutSubPs p1 (d - 1)) (cutSubPs p2 (d - 1))
          AsPatG p         -> AsPatG (cutSubPs p (d - 1))
          ConstrPatG p t   -> ConstrPatG (cutSubPs p (d - 1)) t

-- George
replaceSSWithExpr :: Prog -> Expr -> Prog
replaceSSWithExpr prog expr = map (go expr) prog
  where
    go e p = case p of
      DFun ss' rc pes -> DFun ss' rc (map (\(pt, ex) -> (pt, replaceExpr e ex)) pes)
      DEvl ss' ee     -> DEvl ss' (replaceExpr ee e)
      _               -> p

    replaceExpr e' ex =
      if getSrcSpanExprMaybe ex == getSrcSpanExprMaybe e'
        then e'
        else case ex of
            Lam ms x y e      -> Lam ms x (replaceExpr e' y) e
            App ms x y        -> App ms (replaceExpr e' x) (map (replaceExpr e') y)
            Bop ms x y z      -> Bop ms x (replaceExpr e' y) (replaceExpr e' z)
            Uop ms x y        -> Uop ms x (replaceExpr e' y)
            Let ms x y z      -> Let ms x (map (second (replaceExpr e')) y) (replaceExpr e' z)
            Ite ms x y z      -> Ite ms (replaceExpr e' x) (replaceExpr e' y) (replaceExpr e' z)
            Seq ms x y        -> Seq ms (replaceExpr e' x) (replaceExpr e' y)
            Case ms x y       -> Case ms (replaceExpr e' x) (map (\(p,g,e) -> (p, fmap (replaceExpr e') g, replaceExpr e' e)) y)
            Tuple ms x        -> Tuple ms (map (replaceExpr e') x)
            ConApp ms x y mt  -> ConApp ms x (fmap (replaceExpr e') y) mt
            Record ms x mt    -> Record ms (map (second (replaceExpr e')) x) mt
            Field ms x y      -> Field ms (replaceExpr e' x) y
            SetField ms x y z -> SetField ms (replaceExpr e' x) y (replaceExpr e' z)
            Array ms x mt     -> Array ms (map (replaceExpr e') x) mt
            List ms x mt      -> List ms (map (replaceExpr e') x) mt
            Try ms x y        -> Try ms (replaceExpr e' x) (map (\(p,g,e) -> (p, fmap (replaceExpr e') g, replaceExpr e' e)) y)
            TypedHole ms x    -> TypedHole ms x
            _                 -> ex

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
    --- | null cores || length cores == 1
    -- = trace (show (prettyProg bad) ++ "\n------------------------------------------\n") [] -- undefined -- FIXME: shouldn't happen!!
    --- | otherwise
    -- = assert (not (null (intersect cores ls))) $
    --   concatMap mkfsD tbad
    --- | null (intersect cores ls)
    -- = trace (show (prettyProg bad) ++ "\n------------------------------------------\n") [] -- FIXME: sigh..
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
  mkTypeOut = ctfold f []
    where
    f p e acc = (:acc) . namedRecord $
                ["SourceSpan" .= show (infoSpan (texprInfo e))]
             ++ didChange (infoSpan (texprInfo e))
             ++ inSlice (infoSpan (texprInfo e))
             ++ concatMap (\(ls,c) -> zipWith (.=) (map mkFeature ls) (c p e)) fs


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
  mkTypeOut = ctfold f []
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
