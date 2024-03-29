{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE MultiWayIf        #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BangPatterns      #-}
{-# LANGUAGE LambdaCase        #-}

module Main where

import           Control.Exception          (assert)
import           Control.Monad
import           Data.Aeson                 (ToJSON(..), FromJSON(..), eitherDecode)
import qualified Data.Aeson                 as Aeson
import qualified Data.Algorithm.Diff        as Diff
import qualified Data.ByteString.Char8      as BSC
import qualified Data.ByteString.Lazy.Char8 as LBSC
import           Data.Ord                   as DO
import           Data.Csv
import           Data.List
import           Data.Maybe
import qualified Data.Set                   as Set
import qualified Data.Vector                as V
import           Data.Containers.ListUtils  (nubOrd, nubOrdOn)
import           Data.Map                   (Map)
import qualified Data.Map.Strict            as Map
import           GHC.Generics
import           Options.Generic            hiding (All(..))
import           System.Directory
import           System.Environment
import           System.FilePath
import           System.IO
import qualified System.Timeout             as Timeout
import           Text.Printf
import           Text.EditDistance

import           NanoML.Instantiate
import           NanoML.Classify
import           NanoML.Lexer
import           NanoML.Monad
import           NanoML.Parser
import           NanoML.Pretty
import           NanoML.Types               hiding (Kind)

import           Debug.Trace


data Fixes = Fixes
  { source      :: FilePath
  , mode        :: FilePath
  , predictions :: FilePath
  , out         :: FilePath
  , clusters    :: Maybe String
  , file        :: Maybe Int
  }
  deriving (Generic, Show)
instance ParseRecord Fixes

main :: IO ()
main = do
  Fixes {source=src, mode=md, predictions=preds, out=out, clusters=cls, file=fl} <-
    getRecord "make-fixes"
  jsons <- lines <$> readFile src
  let cfile = fromMaybe "data/sp14_all/clusters" cls </> "top_clusters.json"
  let ffile = fromMaybe "data/sp14_all/clusters" cls </> "ranked_funs.json"
  let dfile = fromMaybe "data/sp14_all/clusters" cls </> "ranked_dcons.json"
  pred_files <- sort <$> listDirectory preds
  raw_preds_strict <- mapM (\ff -> BSC.readFile (preds </> ff)) pred_files
  let raw_preds = map LBSC.fromStrict raw_preds_strict
  let predf_ids = map takeBaseName pred_files
  let all_preds = zipWith readPreds predf_ids raw_preds
  top_cls <- map readClusterFile . lines <$> readFile cfile
  funs <- readFunsFile <$> readFile ffile
  dcons <- delete "::" . readDConsFile <$> readFile dfile
  case md of
    "tiny"
      -> do
        let input = if isNothing fl then Just 42 else fl
        let all_preds' = filter (\(i, _) -> fromJust input == i) all_preds
        res <- timeout 90 $ mkAllFixes False out top_cls funs dcons all_preds' jsons
        print res
    "tiny-naive"
      -> do
        let top_cls_empty = [([EmptyG], [EmptyG])]
        let all_preds_empty = zipWith readPredsEmpty predf_ids raw_preds
        let input = if isNothing fl then Just 42 else fl
        let all_preds' = filter (\(i, _) -> fromJust input == i) all_preds_empty
        res <- timeout 90 $ mkAllFixes True out top_cls_empty funs dcons all_preds' jsons
        print res
    "synthesis"
      -> do
        res <- mkFixesTest out top_cls funs dcons all_preds jsons
        print res
    "progs"
      -> do
        res <- getProgrms all_preds jsons
        print res
    "timed-synth"
      -> do
        res <- forM all_preds $ \pr -> timeout 30 $ mkFixesTest out top_cls funs dcons [pr] jsons
        let pur = catMaybes res
        let tmpls = map getTemplate all_preds
        let unfinished = concat $ zipWith (\t r -> if isNothing r then t else []) tmpls res
        print $ genericLength pur * 100 / genericLength res
        print $ sum (map fst pur) / genericLength pur
        print $ sum (map snd pur) / genericLength pur
        print $ map (\us -> (head us, length us)) $ group $ sort unfinished
    "timed-synth-total"
      -> do
        res <- forM all_preds $ \pr -> timeout 90 $ mkAllFixes False out top_cls funs dcons [pr] jsons
        let pur = catMaybes res
        let tmpls = map getTemplate all_preds
        let unfinished = concat $ zipWith (\t r -> if isNothing r then t else []) tmpls res
        print $ genericLength pur * 100 / genericLength res
        print $ sum (map (fst . fst) pur) / genericLength pur
        print $ sum (map (snd . fst) pur) / genericLength pur
        print $ map (\us -> (head us, length us)) $ group $ sort unfinished
        let found_sol = filter (isJust . fst) $ concatMap snd pur
        print $ genericLength found_sol * 100.0 / genericLength pur
        print $ avg (map (fromJust . fst) found_sol)
        print $ avg (map snd found_sol)
      where
        avg :: (Real a, Fractional b) => [a] -> b
        avg xs = realToFrac (sum xs) / genericLength xs
    "timed-synth-naive"
      -> do
        let top_cls_empty = [([EmptyG], [EmptyG])]
        let all_preds_empty = zipWith readPredsEmpty predf_ids raw_preds
        res <- forM all_preds_empty $ \pr -> timeout 90 $ mkAllFixes True out top_cls_empty funs dcons [pr] jsons
        let pur = catMaybes res
        let tmpls = map getTemplate all_preds
        let unfinished = concat $ zipWith (\t r -> if isNothing r then t else []) tmpls res
        print $ genericLength pur * 100 / genericLength res
        print $ sum (map (fst . fst) pur) / genericLength pur
        print $ sum (map (snd . fst) pur) / genericLength pur
        print $ map (\us -> (head us, length us)) $ group $ sort unfinished
    _ -> errorWithoutStackTrace "main failed: No such parameter for --mode"


mkFixesTest :: String -> [([ExprGeneric], [ExprGeneric])] -> [Var] -> [DCon] -> [(Int, [Preds])] -> [String] -> IO (Double, Double)
mkFixesTest out top_cls funs dcons all_preds jsons = do
  let inp = if length all_preds == 1 then fst (head all_preds) else -1
  let uniqs = concatMap (mkDiffsWithGenericTrs inp) jsons
  let feats = [ (ss, bad, fix, badStr, fixStr, pds, idx)
              | (ss, bad, fix, badStr, fixStr, idx) <- uniqs
              , (idx', pds) <- all_preds
              , idx == idx'
              ]
  xx <- forM feats $ \ f@(ss, bad, fix, badStr, fixStr, pds, i) -> do
    print i
    -- print $ typeCheck bad
    -- print $ typeCheck fix
    let ss_expr   = map (\(fi, se, td) -> show fi ++ "\n" ++ render (pretty se) ++ "\n" ++ show td ++ "\n") ss
    let all_exprs = concatMap allSubExprs $ progExprs bad
    let alls      = mapMaybe (\e -> getSrcSpanExprMaybe e >>= \ss' -> Just (ss', e)) all_exprs

    let goods      = filter (\pd -> getCorrectTmpl pd > 0) pds
    let old_parts  = map (\pd -> snd $ fromJust $ find (\(ss'', e) -> getPredSrcSpan pd == show ss'') alls) goods
    let templates  = map (\pd -> snd (top_cls !! (getCorrectTmpl pd - 1))) goods
    -- let templates  = map (\gs -> map (\r -> if r > 0 && getCorrectTmpl gs `elem` getRankedPreds gs then Just $ snd $ top_cls !! (r-1) else Nothing) $ getRankedPreds gs) goods
    let results    = nubOrdOn (map killSpans) $ allCombos $ map (\(tmpls, bd) -> synthesize bad bd False tmpls funs dcons) $ zip templates old_parts
    -- let results    = map (\(tmpls, bd) -> map (>>= (\t -> Just $ synthesize bad bd naive t funs dcons)) tmpls) $ zip templates old_parts
    let pretty_bad = render (prettyProg bad)
    let edit_dist  = levenshteinDistance defaultEditCosts pretty_bad . render . prettyProg
    let candidates = filter (\p -> checkP (errorSlice p) $ map (fromJust.getSrcSpanExprMaybe) old_parts) $ map (foldl replaceSSWithExpr bad) results
    let checked    = filter typeCheck candidates
    let replaced   = take 3 $ sortOn edit_dist $ if null checked then candidates else checked
    -- let replaced   = map (map (\es -> isJust es && any (\e -> fromMaybe (SrcSpan 0 0 0 0) (getSrcSpanExprMaybe e) `notElem` errorSlice (replaceSSWithExpr bad e)) (fromJust es))) results

    let vscopes = map (\(s, _, _) -> show $ getVarsInScope bad s) ss
    -- let ree = map show $ take 3 $ filter (typeCheck . foldl replaceSSWithExpr bad) results
    -- forM_ results $ \r -> do
    --   print $ typeCheck r
    print $ null goods || not (null replaced)
    -- let ts  = map (\pd -> getCorrectTmpl pd `elemIndex` getRankedPreds pd) goods
    -- print $ null goods || and (zipWith (\bs t -> isNothing t || bs !! fromJust t) replaced ts)

    let brk  = "\n\n(* -------------------------------------- *)\n"
    -- let templ = map (\pd -> snd (top_cls !! (getCorrectTmpl pd - 1))) goods
    -- let resul = nubOrd $ allCombos $ map (\(tmpls, bd) -> synthesize bad bd naive tmpls funs dcons) $ zip templ old_parts
    -- let repla = any ((\p -> all (`notElem` errorSlice p) $ map (fromJust.getSrcSpanExprMaybe) old_parts) . foldl replaceSSWithExpr bad) resul
    -- print $ null goods || repla
    let printable = map (\p -> render (prettyProg p) ++ brk) replaced
    -- let printable = map (\p -> render (prettyProg p) ++ brk) results
    let fn   = printf "%04d" (i :: Int)
    let path = out </> fn <.> "ml"
    createDirectoryIfMissing True (takeDirectory path)
    writeFile path $ unlines $ printable
                            ++ [ "", "(* bad", badStr, "*)" ]
                            ++ [ "", "(* student fix", fixStr, "*)" ]
                            ++ [ "", "(* changed spans", "" ] ++ ss_expr ++ [ "*)" ]
                            -- ++ [ "", "(* checks?", "" ] ++ map (show.typeCheck.foldl replaceSSWithExpr bad) resul ++ [ "*)" ]
                            -- ++ [ "", "(* changed exprs", "" ] ++ ree ++ [ "*)" ]
                            -- ++ [ "", "(* variables in scope for changed spans", "" ] ++ vscopes ++ [ "*)" ]
                            -- ++ [ "", "(* type error slice" ] ++ map show cs ++ [ "*)" ]
    return (null goods || not (null replaced), elem (map exprKind $ concatMap allSubExprs $ progExprs fix) $ map (map exprKind . concatMap allSubExprs . progExprs) replaced)
    -- return (null goods || and (zipWith (\bs t -> isNothing t || bs !! fromJust t) replaced ts), (genericLength (filter id (zipWith (\bs t -> isNothing t || bs !! fromJust t) replaced ts)), genericLength ts), null goods || repla)
  return (genericLength (filter fst xx) * 100.0 / genericLength xx, genericLength (filter snd xx) * 100.0 / genericLength xx)
  -- return (genericLength (filter fst3 xx) * 100.0 / genericLength xx, sum (map (fst.snd3) xx) * 100.0 / sum (map (snd.snd3) xx), genericLength (filter thd3 xx) * 100.0 / genericLength xx)


mkAllFixes :: Bool -> String -> [([ExprGeneric], [ExprGeneric])] -> [Var] -> [DCon] -> [(Int, [Preds])] -> [String] -> IO ((Double, Double), [(Maybe Int, Integer)])
mkAllFixes naive out top_cls funs dcons all_preds jsons = do
  let inp = if length all_preds == 1 then fst (head all_preds) else -1
  let uniqs = concatMap (mkDiffsWithGenericTrs inp) jsons
  let feats = [ (ss, bad, fix, badStr, fixStr, pds, idx)
              | (ss, bad, fix, badStr, fixStr, idx) <- uniqs
              , (idx', pds) <- all_preds
              , idx == idx'
              ]
  xx <- forM feats $ \ f@(ss, bad, fix, badStr, fixStr, pds, i) -> do
    print i
    let ss_expr   = map (\(fi, se, td) -> show fi ++ "\n" ++ render (pretty se) ++ "\n" ++ show td ++ "\n") ss
    let all_exprs = concatMap allSubExprs $ progExprs bad
    let alls      = mapMaybe (\e -> getSrcSpanExprMaybe e >>= \ss' -> Just (ss', e)) all_exprs

    let ranked_pds = sortOn (DO.Down . getConf) $ removeLessThan pds 0.01
    let sols_map   = Map.empty
    let results    = mapAccumL (getSolutions bad alls (map snd top_cls)) sols_map $ take 10 $ getAllPredCombs ranked_pds
    let pretty_bad = render (prettyProg bad)
    let edit_dist  = levenshteinDistance defaultEditCosts pretty_bad . render . prettyProg
    let dist pp = length $ filter (\case
                                    Diff.Both _ _ -> False
                                    _ -> True) $ Diff.getDiffBy (\e1 e2 -> exprKind e1 == exprKind e2) all_exprs (concatMap allSubExprs $ progExprs pp)
    let tffuns = getTypedFuns fix
    let tfvars = map fst tffuns
    let good_type pp = sum $ map (\(v, typ) -> if v `elem` tfvars
                                               then (if typ == snd (fromJust (find ((== v).fst) tffuns)) then 0 else 1)
                                               else 2) $ getTypedFuns pp
    -- Use this for less type-correct programs
    -- let checked    = take 120 $ concatMap (take 40 . filter typeCheck . take 400 . map (foldl replaceSSWithExpr bad)) $ snd results
    -- Use this for more type-correct programs
    let checked = concatMap (take 40 . filter typeCheck . take 400 . map (foldl replaceSSWithExpr bad)) $ snd results
    -- Use this for ranking per template
    -- let checked = map (take 40 . filter typeCheck . take 400 . map (foldl replaceSSWithExpr bad)) $ snd results
    -- Use this for programs that match the fixed version type
    -- let checked    = concatMap (take 40 . filter (\p -> good_type p < 1) . filter typeCheck . take 400 . map (foldl replaceSSWithExpr bad)) $ snd results

    -- Use this mertic to print programs that match the fixed version type and the predicted template first
    -- let sorted_ch = sortOn (\p -> (good_type p, dist p, edit_dist p)) checked
    -- Use this mertic to print programs that match the fixed version type and the predicted template first
    -- let sorted_ch = concatMap (sortOn (\p -> (good_type p, dist p, edit_dist p))) checked
    -- Use this mertic to print programs that match the fixed version type first
    -- let replaced   = take 3 $ sortOn (\p -> (good_type p, dist p, edit_dist p)) checked
    -- Use this mertic to disable that
    let sorted_ch = sortOn (\p -> (dist p, edit_dist p)) checked
    let replaced  = take 3 sorted_ch

    let vscopes = map (\(s, _, _) -> show $ getVarsInScope bad s) ss
    print $ not (null replaced)

    let brk  = "\n\n(* -------------------------------------- *)\n"
    let printable = map (\p -> render (prettyProg p) ++ brk) replaced
    let fn   = printf "%04d" (i :: Int)
    let path = out </> fn <.> "ml"
    createDirectoryIfMissing True (takeDirectory path)
    writeFile path $ unlines $ printable
                            ++ [ "", "(* bad", badStr, "*)" ]
                            ++ [ "", "(* student fix", fixStr, "*)" ]
                            ++ [ "", "(* changed spans", "" ] ++ ss_expr ++ [ "*)" ]
    let fixed = map exprKind $ concatMap allSubExprs $ progExprs fix
    return ((not (null replaced), elem fixed $ map (map exprKind . concatMap allSubExprs . progExprs) replaced),
            (elemIndex fixed $ map (map exprKind . concatMap allSubExprs . progExprs) sorted_ch, genericLength sorted_ch))
  return ((genericLength (filter (fst . fst) xx) * 100.0 / genericLength xx, genericLength (filter (snd . fst) xx) * 100.0 / genericLength xx),
          map snd xx)
  where
    getSolutions :: Prog -> [(SrcSpan, Expr)] -> [[ExprGeneric]] -> Map String [Expr] -> [Preds] -> (Map String [Expr], [[Expr]])
    getSolutions bad alls top_cls mp pds = (fst results, nubOrdOn (map killSpans) $ allCombos $ snd results)
      where
        old_parts  = map (\pd -> snd $ fromJust $ find (\(ss'', e) -> getPredSrcSpan pd == show ss'') alls) pds
        templates  = map (map (top_cls !!) . getRankedPreds) pds
        sss        = map getPredSrcSpan pds
        results    = mapAccumL (\mp' (ss, tmpls, bd) -> insertIfNot mp ss (concatMap (\tmpl -> synthesize bad bd naive tmpl funs dcons) tmpls)) mp $ zip3 sss templates old_parts
    insertIfNot :: Map String [Expr] -> String -> [Expr] -> (Map String [Expr], [Expr])
    insertIfNot mp ss def = if Map.member ss mp then (mp, fromJust $ Map.lookup ss mp) else (new_mp, def)
      where
        new_mp = Map.insert ss def mp


getProgrms :: [(Int, [Preds])] -> [String] -> IO [(Int, [Int])]
getProgrms all_preds jsons = do
  let uniqs = concatMap (mkDiffsWithGenericTrs (-1)) jsons
  let feats = [ (ss, bad, fix, badStr, fixStr, pds, idx)
              | (ss, bad, fix, badStr, fixStr, idx) <- uniqs
              , (idx', pds) <- all_preds
              , idx == idx'
              ]
  prog_ids <- forM feats $ \ f@(ss, bad, fix, badStr, fixStr, pds, i) -> do
    let ss_exprs = map thd3 ss
    let templates = sort $ nub $ map getCorrectTmpl pds
    if
      | length ss_exprs > 2 -> do
        putStrLn (show i ++ ". MORE THAN 2 CHANGES")
        return []
      | any (\e -> sizeOfTree e > 16) ss_exprs -> do
        putStrLn (show i ++ ". BIGGER THAN 16 NODES")
        return []
      | any (\e -> depthOfTree e 0 > 3) ss_exprs -> do
        putStrLn (show i ++ ". DEEPER THAN 3 LEVELS")
        return []
      | otherwise -> do
        return [(i, templates)]
  let ids = concat prog_ids
  let for_eval = map (\i -> (i, map fst $ take 10 $ filter (elem i . snd) ids)) [1..30]
  return for_eval


getAllPredCombs :: [Preds] -> [[Preds]]
getAllPredCombs prds = sortOn (DO.Down . mutualConf) all_combos
  where
    getSS = read . getPredSrcSpan
    cs `excludes` ss = not (cs `isSubSpanOf` ss || ss `isSubSpanOf` cs)
    mutualConf = product . map getConf
    subseqs = tail $ subsequences prds
    all_combos = nubOrdOn Set.fromList $ filter (\ps -> all (\p -> all (excludes (getSS p) . getSS) (delete p ps)) ps) subseqs

removeLessThan :: [Preds] -> Double -> [Preds]
removeLessThan ps thres = filter ((> thres) . getConf) ps

checkP :: Maybe [SrcSpan] -> [SrcSpan] -> Bool
checkP !slice ss = isJust slice && all (`notElem` jslice) ss && all non_neg jslice
  where
    non_neg (SrcSpan sl _ el _)
      | sl < 0 || el < 0 = False
    non_neg _ = True
    jslice = fromJust slice

getTemplate :: (Int, [Preds]) -> [Int]
getTemplate ps = map getCorrectTmpl $ snd ps

-- | Like 'Timeout.timeout', but in seconds.
timeout :: Int -> IO a -> IO (Maybe a)
timeout sec = Timeout.timeout (sec * 10^6)


readFunsFile :: String -> [Var]
readFunsFile f = case eitherDecode (LBSC.pack f) of
  Left err   -> error ("readFunsFile failed: " ++ err)
  Right vars -> vars


readDConsFile :: String -> [DCon]
readDConsFile f = case eitherDecode (LBSC.pack f) of
  Left err    -> error ("readDConsFile failed: " ++ err)
  Right dcons -> dcons


data ClsWithTs = MkClsWithTs { egs :: [ExprGeneric], pruned :: [ExprGeneric] }
  deriving (Show, Generic)
instance ToJSON ClsWithTs
instance FromJSON ClsWithTs

mkClsWithTs :: ([ExprGeneric], [ExprGeneric]) -> ClsWithTs
mkClsWithTs (egs, pruned) = MkClsWithTs egs pruned

readClusterFile :: String -> ([ExprGeneric], [ExprGeneric])
readClusterFile f = case eitherDecode (LBSC.pack f) of
  Left err                       -> error ("readClusterFile failed: " ++ err)
  Right (MkClsWithTs egs pruned) -> (egs, pruned)


type Preds = (String, Double, Int, Int, Int, Int, Int, Int, Int)

getPredSrcSpan :: Preds -> String
getPredSrcSpan (ss, _, _, _, _, _, _, _, _) = ss

getRankedPreds :: Preds -> [Int]
getRankedPreds (_, _, p1, p2, p3, p4, p5, p6, _) = [p1 - 1, p2 - 1, p3 - 1, p4 - 1, p5 - 1, p6 - 1]

setPredsEmpty :: Preds -> Preds
setPredsEmpty (x, y, _, _, _, _, _, _, z) = (x, y, 1, 1, 1, 1, 1, 1, z)

getCorrectTmpl :: Preds -> Int
getCorrectTmpl (_, _, _, _, _, _, _, _, i) = i

getConf :: Preds -> Double
getConf (_, cf, _, _, _, _, _, _, _) = cf

readPreds :: String -> LBSC.ByteString -> (Int, [Preds])
readPreds idx predf =
  case decode HasHeader predf :: Either String (V.Vector Preds) of
    Left e -> errorWithoutStackTrace ("readPreds: " ++ e)
    Right v -> (read idx :: Int, V.toList v)

readPredsEmpty :: String -> LBSC.ByteString -> (Int, [Preds])
readPredsEmpty idx predf =
  case decode HasHeader predf :: Either String (V.Vector Preds) of
    Left e -> errorWithoutStackTrace ("readPredsEmpty: " ++ e)
    Right v -> (read idx :: Int, map setPredsEmpty (V.toList v))

getTypedFuns :: Prog -> [(Var, Type)]
getTypedFuns fix = progTFuns tfix
  where
    tfix = case runEval stdOpts (typeProg fix) of
      Left e       -> []
      Right (p, _) -> p

    progTFuns []     = []
    progTFuns (d:ds) = case d of
      TDFun _ _ pes -> (takeVarPat $ fst $ head pes, generaliseT $ getType $ snd $ head pes) : progTFuns ds
      _             -> progTFuns ds

    takeVarPat p = case p of
      VarPat _ v -> v
      _          -> errorWithoutStackTrace "progFuns"

mkDiffsWithGenericTrs :: Int -> String -> [([(SrcSpan, Expr, ExprGeneric)], Prog, Prog, String, String, Int)]
mkDiffsWithGenericTrs inp json = case eitherDecode (LBSC.pack json) of
  Left e -> mempty
  Right (MkInSample _ _ idx)
    | inp > 0 && idx /= inp
    -> mempty
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


mkDiffWithGenericTrs :: Prog -> Prog -> [(SrcSpan, Expr, ExprGeneric)]
mkDiffWithGenericTrs bad fix = assert (not (null x)) $ pruneTrs 2 x
  where
    x  = diffSpansAndGenericTrs (getDiff $ diffExprsT bs fs) bs fs
    bad' = diffProg bad fix
    fix' = diffProg fix bad
    bs = progExprs bad'
    fs = progExprs fix'


data InSample = MkInSample { bad :: String, fix :: String, index :: Int }
  deriving (Show, Generic)
instance FromJSON InSample
