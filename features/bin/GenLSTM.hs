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
    "clusters+some"
      -> mkBadFeats False out cls mempty (preds_tsize ++ preds_tis) jsons
    "clusters+all"
      -> mkBadFeats False out cls mempty (preds_tsize ++ preds_tis ++ map only_ctx preds_tis_ctx) jsons
    "known+clusters+some"
      -> do
        top_cls <- map readClusterFile . lines <$> readFile cfile
        mkBadFeats True out cls top_cls (preds_tsize ++ preds_tis) jsons
    "known+clusters+all"
      -> do
        top_cls <- map readClusterFile . lines <$> readFile cfile
        mkBadFeats True out cls top_cls (preds_tsize ++ preds_tis ++ map only_ctx preds_tis_ctx) jsons
    "fixes+some"
      -> mkFixFeats False out cls mempty (preds_tsize ++ preds_tis) jsons
    "fixes+all"
      -> mkFixFeats False out cls mempty (preds_tsize ++ preds_tis ++ map only_ctx preds_tis_ctx) jsons
    _ -> errorWithoutStackTrace "main failed: No such parameter for --features"


mkBadFeats :: Bool -> String -> String -> [([ExprGeneric], [ExprGeneric])] -> [Feature] -> [String] -> IO ()
mkBadFeats _ out nm _ fs jsons = do
  let uniqs = concatMap mkDiffsWithGenericTrs jsons
  let feats = [ ((h, f), (ss, bad, fix, badStr, fixStr, c, all, idx))
              | (ss, bad, fix, badStr, fixStr, idx) <- uniqs
              , (h, f, c) <- maybeToList $ runTFeaturesDiff fs (map fst3 ss, bad)
              -- , let f' = filter (\r -> r HashMap.! "F-InSlice" == "1.0") f -- Remove this for all spans
              , let all = nub $ map (fromJust.getSrcSpanExprMaybe)
                                    (concatMap allSubExprs $ progExprs bad)
              ]
  let feats' = filter (\(_, (_,_,fix,_,_,cs,_,_)) -> not (null cs) && not (null (getAllTypedExprs fix))) feats
  let sizes = concatMap (\(_, (ss, _, _, _, _, _, _, _)) -> map (fromIntegral . sizeOfTree . thd3) ss) feats'
  let mkMean f xs = sum (map f xs) / genericLength xs
  let mkFrac (_, (ss, _, _, _, _, _, all, _)) = genericLength (filter (\ss' -> any (isSubSpanOf ss') $ map fst3 ss) all) / genericLength all
  let mean = mkMean mkFrac feats' :: Double
  let mean_fixes = sum sizes / genericLength sizes :: Double
  let std = 1.4 * sqrt (mkMean (\x -> (mkFrac x - mean) ^ 2) feats')
  let std_fixes = 1.4 * sqrt (sum $ map (\x -> (x - mean_fixes) ^ 2) sizes)
  let dp = 2

  -- Make the ML dataset and print it into csv files
  forM_ feats' $ \f@((header, features), (ss, _, _, badStr, fixStr, cs, _, i)) -> do
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
        let ss_expr  = map (\(fi, se, td) -> show fi ++ "\n" ++ render (pretty se) ++ "\n" ++ show (pruneGTree dp td) ++ "\n") ss
        let fn   = printf "%04d" (i :: Int)
        let path = out </> nm </> fn <.> "csv"
        createDirectoryIfMissing True (takeDirectory path)
        LBSC.writeFile path $ encodeByName header features
        let fpath = out </> fn <.> "ml"
        writeFile fpath $ unlines $ [ badStr, "", "(* fix", fixStr, "*)" ]
                                ++ [ "", "(* changed spans" ] ++ ss_expr ++ [ "*)" ]
                                ++ [ "", "(* type error slice" ] ++ map show cs ++ [ "*)" ]
  -- Print some final messages
  printf "MEAN / STD frac: %.3f / %.3f\n" mean std


mkFixFeats :: Bool -> String -> String -> [([ExprGeneric], [ExprGeneric])] -> [Feature] -> [String] -> IO ()
mkFixFeats _ out nm _ fs jsons = do
  let uniqs = concatMap mkFixes jsons
  let feats = [ (h, f, fix, fixStr, idx)
              | (fix, fixStr, idx) <- uniqs
              , let (h, f) = runTFeaturesTypes fs fix
              ]

  -- Make the ML dataset and print it into csv files
  forM_ feats $ \f@(header, features, _, fixStr, i) -> do
    let fn   = printf "%04d" (i :: Int)
    let path = out </> nm </> fn <.> "csv"
    createDirectoryIfMissing True (takeDirectory path)
    LBSC.writeFile path $ encodeByName header features
    let fpath = out </> fn <.> "ml"
    writeFile fpath $ unlines $ [ fixStr ]
  -- Print some final messages


eleq :: ExprGeneric -> [ExprGeneric] -> Bool
eleq EmptyG [EmptyG] = True
eleq _ [EmptyG] = False
eleq a as = any (eq a) as'
  where
    as' = delete EmptyG as


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
    un_ps = map (\v -> length $ filter (==v) ps) alls


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


mkFixes :: String -> [(Prog, String, Int)]
mkFixes json = case eitherDecode (LBSC.pack json) of
  Left e -> mempty
  Right (MkInSample bad' fix' idx)
    | Right fix <- parseTopForm fix'
    -> [(fix, fix', idx)]
  Right (MkInSample bad' fix' _)
    | Left e <- parseTopForm fix'
    -> mempty
  Right (MkInSample bad' fix' _)
    | Left e <- parseTopForm bad'
    -> mempty
  v -> error (show v)


mkDiffWithGenericTrs :: Prog -> Prog -> [(SrcSpan, Expr, ExprGeneric)]
mkDiffWithGenericTrs bad fix = assert (not (null x)) x
  where
    x  = diffSpansAndGenericTrs (getDiff $ diffExprsT bs fs) bs fs
    bad' = diffProg bad fix
    fix' = diffProg fix bad
    bs = progExprs bad'
    fs = progExprs fix'


isSubTypeAny :: Type -> [Type] -> Bool
isSubTypeAny e l = any (`isSubType` e) l


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
         $ ["SourceSpan"]
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
                ["SourceSpan" .= show (infoSpan (texprInfo e))]
             ++ concatMap (\(ls,c) -> zipWith (.=) (map mkFeature ls) (c p e)) fs


mkLabel :: String -> BSC.ByteString
mkLabel s = BSC.pack ("L-" ++ s)

mkFeature :: String -> BSC.ByteString
mkFeature s = BSC.pack ("F-" ++ s)


data InSample = MkInSample { bad :: String, fix :: String, index :: Int }
  deriving (Show, Generic)
instance FromJSON InSample
