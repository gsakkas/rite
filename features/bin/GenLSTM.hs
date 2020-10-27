{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE MultiWayIf        #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BangPatterns      #-}
-- {-# LANGUAGE LambdaCase        #-}
-- {-# LANGUAGE TupleSections     #-}

module Main where

import           Control.Exception          ( assert )
import           Control.Monad              ( forM_ )
import           Data.Aeson                 ( FromJSON(..),
                                              eitherDecode )
import qualified Data.ByteString.Char8      as BSC
import qualified Data.ByteString.Lazy.Char8 as LBSC
import           Data.Csv                   ( (.=),
                                              namedRecord,
                                              encodeByName,
                                              Header,
                                              NamedRecord )
import           Data.List                  ( genericLength,
                                              intersect,
                                              nub )
import           Data.Maybe                 ( fromJust,
                                              mapMaybe,
                                              maybeToList )
import qualified Data.Set                   as Set
import qualified Data.Vector                as Vec
import qualified Data.Map                   as Map
import           GHC.Generics               ( Generic )
import           Options.Generic            ( getRecord,
                                              ParseRecord )
import           System.Directory           ( createDirectoryIfMissing )
import           System.FilePath            ( (<.>),
                                              (</>),
                                              takeDirectory )
import           Text.Printf                ( printf )

import           NanoML.Classify
import           NanoML.Monad               ( runEval )
import           NanoML.Parser              ( parseTopForm )
import           NanoML.Pretty              ( render, pretty )
import           NanoML.Types               hiding (Kind)

import           Debug.Trace


data Generate = Generate
  { source   :: FilePath
  , features :: String
  , out      :: FilePath
  }
  deriving (Generic, Show)
instance ParseRecord Generate

main :: IO ()
main = do
  Generate {source=src, features=cls, out=out} <-
    getRecord "generate-features"
  jsons <- lines <$> readFile src
  case cls of
    "buggy+some"
      -> mkBadFeats out cls (preds_tsize ++ preds_tis) jsons
    "buggy+all"
      -> mkBadFeats out cls (preds_tsize ++ preds_tis ++ map only_ctx preds_tis_ctx) jsons
    "fixes+some"
      -> mkFixFeats out cls (preds_tsize ++ preds_tis) jsons
    "fixes+all"
      -> mkFixFeats out cls (preds_tsize ++ preds_tis ++ map only_ctx preds_tis_ctx) jsons
    "some-feats"
      -> mkFeats out (preds_tsize ++ preds_tis) jsons
    "all-feats"
      -> mkFeats out (preds_tsize ++ preds_tis ++ map only_ctx preds_tis_ctx) jsons
    _ -> errorWithoutStackTrace "main failed: No such parameter for --features"


mkFeats :: String -> [Feature] -> [String] -> IO ()
mkFeats out fs jsons = do
  let uniqs     = concatMap mkDiffsWithGenericTrs jsons
  let feats = [ ((hb, fb), (hf, ff), (ss, bad, fix, badStr, fixStr, cs, all, idx))
              | (ss, bad, fix, badStr, fixStr, idx) <- uniqs
              , (hb, fb, cs) <- maybeToList $ runFeatsDiff fs (map fst3 ss, bad)
              , (hf, ff, _ ) <- maybeToList $ runFeatsDiff fs (mempty, fix)
              , let all = nub $ map (fromJust.getSrcSpanExprMaybe)
                                    (concatMap allSubExprs $ progExprs bad)
              ]
  let feats' = filter (\(_, _, (_,_,fix,_,_,cs,_,_)) -> not (null cs) && not (null (getAllTypedExprs fix))) feats
  let sizes  = concatMap (\(_, _, (ss, _, _, _, _, _, _, _)) -> map (fromIntegral . sizeOfTree . thd3) ss) feats'
  let mkMean f xs = sum (map f xs) / genericLength xs
  let mkFrac (_, _, (ss, _, _, _, _, _, all, _)) = genericLength (filter (\ss' -> any (isSubSpanOf ss') $ map fst3 ss) all) / genericLength all
  let mean       = mkMean mkFrac feats' :: Double
  let mean_fixes = sum sizes / genericLength sizes :: Double
  let std        = 1.4 * sqrt (mkMean (\x -> (mkFrac x - mean) ^ 2) feats')
  let std_fixes  = 1.4 * sqrt (sum $ map (\x -> (x - mean_fixes) ^ 2) sizes)

  -- Make the ML dataset and print it into csv files
  forM_ feats' $ \f@((hdrBad, featBad), (hdrFix, featFix), (ss, _, _, badStr, fixStr, cs, _, i)) -> do
    let ss'    = map fst3 ss
    let lsizes = map (fromIntegral . sizeOfTree . thd3) ss
    let lmean  = sum lsizes / genericLength lsizes :: Double
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
        let ss_expr = map (\(fi, se, td) -> show fi ++ "\n" ++ render (pretty se) ++ "\n" ++ show (pruneGTree 2 td) ++ "\n") ss
        let prog_id = printf "%04d" (i :: Int)
        let pathBad = out </> "bad_feats"
        let pathFix = out </> "fix_feats"
        let fixMap  = Map.fromList featFix
        createDirectoryIfMissing True pathBad
        createDirectoryIfMissing True pathFix
        forM_ (zip [0..] featBad) $ \(idx, (pat, feat)) -> do
          let fn    = printf "%04d" (idx :: Int)
          let pathB = pathBad </> (prog_id ++ "_" ++ fn) <.> "csv"
          let pathF = pathFix </> (prog_id ++ "_" ++ fn) <.> "csv"
          LBSC.writeFile pathB $ encodeByName hdrBad feat
          LBSC.writeFile pathF $ encodeByName hdrFix $ fromJust $ Map.lookup pat fixMap -- FIXME: fromJust is not correct
        let fpath = out </> prog_id <.> "ml"
        writeFile fpath $ unlines $ [ badStr, "", "(* fix", fixStr, "*)" ]
                                 ++ [ "", "(* changed spans" ] ++ ss_expr ++ [ "*)" ]
                                 ++ [ "", "(* type error slice" ] ++ map show cs ++ [ "*)" ]
  -- Print some final messages
  printf "MEAN / STD frac: %.3f / %.3f\n" mean std


mkBadFeats :: String -> String -> [Feature] -> [String] -> IO ()
mkBadFeats out nm fs jsons = do
  let uniqs = concatMap mkDiffsWithGenericTrs jsons
  let feats = [ ((h, f), (ss, bad, fix, badStr, fixStr, c, all, idx))
              | (ss, bad, fix, badStr, fixStr, idx) <- uniqs
              , (h, f, c) <- maybeToList $ runTFeaturesDiff fs (map fst3 ss, bad)
              -- , let f' = filter (\r -> r HashMap.! "F-InSlice" == "1.0") f -- Remove this for all spans
              , let all = nub $ map (fromJust.getSrcSpanExprMaybe)
                                    (concatMap allSubExprs $ progExprs bad)
              ]
  let feats' = filter (\(_, (_,_,fix,_,_,cs,_,_)) -> not (null cs) && not (null (getAllTypedExprs fix))) feats
  let sizes  = concatMap (\(_, (ss, _, _, _, _, _, _, _)) -> map (fromIntegral . sizeOfTree . thd3) ss) feats'
  let mkMean f xs = sum (map f xs) / genericLength xs
  let mkFrac (_, (ss, _, _, _, _, _, all, _)) = genericLength (filter (\ss' -> any (isSubSpanOf ss') $ map fst3 ss) all) / genericLength all
  let mean       = mkMean mkFrac feats' :: Double
  let mean_fixes = sum sizes / genericLength sizes :: Double
  let std        = 1.4 * sqrt (mkMean (\x -> (mkFrac x - mean) ^ 2) feats')
  let std_fixes  = 1.4 * sqrt (sum $ map (\x -> (x - mean_fixes) ^ 2) sizes)

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
        let ss_expr  = map (\(fi, se, td) -> show fi ++ "\n" ++ render (pretty se) ++ "\n" ++ show (pruneGTree 2 td) ++ "\n") ss
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


mkFixFeats :: String -> String -> [Feature] -> [String] -> IO ()
mkFixFeats out nm fs jsons = do
  let uniqs = concatMap mkFixes jsons
  let feats = [ (h, f, fix, fixStr, idx)
              | (fix, fixStr, idx) <- uniqs
              , let (h, f) = runTFeaturesTypes fs fix
              ]

  forM_ feats $ \(header, features, _, fixStr, i) -> do
    let fn   = printf "%04d" (i :: Int)
    let path = out </> nm </> fn <.> "csv"
    createDirectoryIfMissing True (takeDirectory path)
    LBSC.writeFile path $ encodeByName header features
    let fpath = out </> fn <.> "ml"
    writeFile fpath $ unlines $ [ fixStr ]


mkDiffsWithGenericTrs :: String -> [([(SrcSpan, Expr, ExprGeneric)], Prog, Prog, String, String, Int)]
mkDiffsWithGenericTrs json = case eitherDecode (LBSC.pack json) of
  Left _ -> mempty
  Right (MkInSample _ fix' _)
    | Left _ <- parseTopForm fix'
    -> mempty
  Right (MkInSample bad' _ _)
    | Left _ <- parseTopForm bad'
    -> mempty
  Right (MkInSample bad' fix' _)
    | Right _ <- parseTopForm fix'
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
  Left _ -> mempty
  Right (MkInSample _ fix' idx)
    | Right fix <- parseTopForm fix'
    -> [(fix, fix', idx)]
  Right (MkInSample _ fix' _)
    | Left _ <- parseTopForm fix'
    -> mempty
  Right (MkInSample bad' _ _)
    | Left _ <- parseTopForm bad'
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


getAllTypedExprs :: Prog -> [TExpr]
getAllTypedExprs fix = concatMap allSubTExprs samples
  where
    samples = progTExprs tfix

    tfix = case runEval stdOpts (typeProg fix) of
      Left _       -> []
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
  header = Vec.fromList
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
  header = Vec.fromList
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


runFeatsDiff :: [Feature] -> ([SrcSpan], Prog) -> Maybe (Header, [(Pat, [NamedRecord])], [SrcSpan])
runFeatsDiff fs (ls, prog)
  | null samples = Nothing
  | otherwise    = Just (header, samples, nub cores)
  where
  header = Vec.fromList
         $ if null ls then ["SourceSpan"] else ["SourceSpan", "L-NoChange", "L-DidChange", "F-InSlice"]
        ++ concatMap (\(ls,_) -> map mkFeature ls) fs

  samples
    | (not . null) ls
    , null cores
    -- something went wrong other than typechecking success
    , Just e <- me = trace ("WARNING: " ++ show e) []
    | otherwise = filter (not . null . snd) $ map mkfsD tprog

  (tprog, cores, me) = case runEval stdOpts (typeProg prog) of
    Left e        -> ([], [], Just e) -- traceShow e
    Right (p, cs) -> (p, mapMaybe constraintSpan (Set.toList (mconcat cs)), Nothing)

  mkfsD (TDFun _ _ pes) = (fst $ head pes, mconcat (map (mkTypeOut . snd) pes))
  -- mkfsD (TDEvl _ e)     = [mkTypeOut e]
  mkfsD _               = (LitPat Nothing (LI 42), mempty)

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
             ++ if null ls then didChange (infoSpan (texprInfo e)) else mempty
             ++ if null ls then inSlice (infoSpan (texprInfo e)) else mempty
             ++ concatMap (\(ls, c) -> zipWith (.=) (map mkFeature ls) (c p e)) fs


mkLabel :: String -> BSC.ByteString
mkLabel s = BSC.pack ("L-" ++ s)

mkFeature :: String -> BSC.ByteString
mkFeature s = BSC.pack ("F-" ++ s)


data InSample = MkInSample { bad :: String, fix :: String, index :: Int }
  deriving (Show, Generic)
instance FromJSON InSample
