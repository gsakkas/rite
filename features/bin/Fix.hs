{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE MultiWayIf        #-}
{-# LANGUAGE OverloadedStrings #-}

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
import           Data.Containers.ListUtils (nubOrd)
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
  raw_preds <- mapM (\ff -> LBSC.readFile (preds </> ff)) pred_files
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
        res <- timeout 20 $ mkFixes out top_cls funs dcons all_preds' jsons
        print res
    "synthesis"
      -> do
        res <- mkFixes out top_cls funs dcons all_preds jsons
        print res
    "timed-synth"
      -> do
        res <- forM all_preds $ \pr -> timeout 30 $ mkFixes out top_cls funs dcons [pr] jsons
        let pur = catMaybes res
        let tmpls = map getTemplate all_preds
        let unfinished = concat $ zipWith (\t r -> if isNothing r then t else []) tmpls res
        print $ genericLength pur * 100 / genericLength res
        print $ sum (map fst pur) / genericLength pur
        print $ sum (map snd pur) / genericLength pur
        print $ map (\us -> (head us, length us)) $ group $ sort unfinished
    _ -> errorWithoutStackTrace "main failed: No such parameter for --mode"


mkFixes :: String -> [([ExprGeneric], [ExprGeneric])] -> [Var] -> [DCon] -> [(Int, [Preds])] -> [String] -> IO (Double, Double)
mkFixes out top_cls funs dcons all_preds jsons = do
  let uniqs = concatMap mkDiffsWithGenericTrs jsons
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
    let results    = nubOrd $ allCombos $ map (\(tmpls, bd) -> synthesize bad bd tmpls funs dcons) $ zip templates old_parts
    -- let results    = map (\(tmpls, bd) -> map (>>= (\t -> Just $ synthesize bad bd t funs dcons)) tmpls) $ zip templates old_parts
    let pretty_bad = render (prettyProg bad)
    let edit_dist  = levenshteinDistance defaultEditCosts pretty_bad . render . prettyProg
    let candidates = filter (\p -> all (`notElem` errorSlice p) $ map (fromJust.getSrcSpanExprMaybe) old_parts) $ map (foldl replaceSSWithExpr bad) results
    let replaced   = take 3 $ sortOn edit_dist $ if any typeCheck candidates then filter typeCheck candidates else candidates
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
    -- let resul = nubOrd $ allCombos $ map (\(tmpls, bd) -> synthesize bad bd tmpls funs dcons) $ zip templ old_parts
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


type Preds = (String, Int, Int, Int, Int, Int, Int)

getPredSrcSpan :: Preds -> String
getPredSrcSpan (ss, _, _, _, _, _, _) = ss

getRankedPreds :: Preds -> [Int]
getRankedPreds (_, p1, p2, p3, p4, p5, _) = [p1, p2, p3, p4, p5]

getCorrectTmpl :: Preds -> Int
getCorrectTmpl (_, _, _, _, _, _, i) = i

readPreds :: String -> LBSC.ByteString -> (Int, [Preds])
readPreds idx predf =
  case decode HasHeader predf :: Either String (V.Vector Preds) of
    Left e -> errorWithoutStackTrace ("readPreds: " ++ e)
    Right v -> (read idx :: Int, V.toList v)


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
