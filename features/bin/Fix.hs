{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE MultiWayIf        #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Control.Exception          (assert, evaluate)
import           Control.Monad
import           Control.Arrow              (second)
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
  let cfile = fromMaybe "data/sp14_all/clusters/top_clusters.json" cls
  pred_files <- sort <$> listDirectory preds
  raw_preds <- mapM (\ff -> LBSC.readFile (preds </> ff)) pred_files
  let predf_ids = map takeBaseName pred_files
  let all_preds = zipWith readPreds predf_ids raw_preds
  ff <- lines <$> readFile cfile
  let top_cls = map readJSONLFile ff
  case md of
    "tiny"
      -> do
        let input = if isNothing fl then Just 42 else fl
        let all_preds' = filter (\(i, _) -> fromJust input == i) all_preds
        res <- timeout 5 $ mkFixes out top_cls all_preds' jsons
        print res
    "synthesis"
      -> do
        res <- mkFixes out top_cls all_preds jsons
        print res
    "timed-synth"
      -> do
        res <- forM all_preds $ \pr -> timeout 10 $ mkFixes out top_cls [pr] jsons
        let pur = catMaybes res
        print $ genericLength pur * 100 / genericLength res
        print $ sum (map fst pur) / genericLength pur
        print $ sum (map snd pur) / genericLength pur
    _ -> errorWithoutStackTrace "main failed: No such parameter for --mode"


mkFixes :: String -> [(ExprGeneric, [Type])] -> [(Int, [Preds])] -> [String] -> IO (Double, Double)
mkFixes out top_cls all_preds jsons = do
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
    let templates  = map (\pd -> fst (top_cls !! (getCorrectTmpl pd - 1))) goods
    let results    = nubOrd $ allCombos $ map (\(tmpl, bd) -> synthesize bad bd tmpl) $ zip templates old_parts
    let pretty_bad = render (prettyProg bad)
    let edit_dist  = levenshteinDistance defaultEditCosts pretty_bad . render . prettyProg
    let replaced   = take 3 $ sortOn edit_dist $ filter typeCheck $ map (foldl replaceSSWithExpr bad) results

    let vscopes = map (\(s, _, _) -> show $ getVarsInScope bad s) ss
    -- let ree = map show $ take 3 $ filter (typeCheck . foldl replaceSSWithExpr bad) results
    -- forM_ results $ \r -> do
    --   print $ typeCheck r
    let reps = replaced
    -- print $ null goods || not (null replaced)

    let brk  = "\n\n(* -------------------------------------- *)\n"
    let printable = map (\p -> render (prettyProg p) ++ brk) replaced
    -- let printable = map (\p -> render (prettyProg p) ++ brk) results
    let fn   = printf "%04d" (i :: Int)
    let path = out </> fn <.> "ml"
    createDirectoryIfMissing True (takeDirectory path)
    writeFile path $ unlines $ printable
                            ++ [ "", "(* bad", badStr, "*)" ]
                            ++ [ "", "(* student fix", fixStr, "*)" ]
                            ++ [ "", "(* changed spans", "" ] ++ ss_expr ++ [ "*)" ]
                            -- ++ [ "", "(* changed exprs", "" ] ++ ree ++ [ "*)" ]
                            -- ++ [ "", "(* variables in scope for changed spans", "" ] ++ vscopes ++ [ "*)" ]
                            -- ++ [ "", "(* type error slice" ] ++ map show cs ++ [ "*)" ]
    return (null goods || not (null replaced), elem (map exprKind $ concatMap allSubExprs $ progExprs fix) $ map (map exprKind . concatMap allSubExprs . progExprs) replaced)
  return (genericLength (filter fst xx) * 100.0 / genericLength xx, genericLength (filter snd xx) * 100.0 / genericLength xx)


-- | Like 'Timeout.timeout', but in seconds.
timeout :: Int -> IO a -> IO (Maybe a)
timeout sec = Timeout.timeout (sec * 10^6)


-- George
getEgMtype :: (SrcSpan, Expr, ExprGeneric) -> [SrcSpan] -> [TExpr] -> Maybe Type
getEgMtype (ss, e, eg) alls tes
  | eg == EmptyG      = return (TVar "tEMPTY")
  | ss `notElem` alls = return (TVar "tNewPart")
  | otherwise         = generaliseT . getType <$> find (\te -> return (getTSrcSpan te) == getSrcSpanExprMaybe e) tes


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

type Preds = (String, Int, Int, Int, Int, Int, Int)

getPredSrcSpan :: Preds -> String
getPredSrcSpan (ss, _, _, _, _, _, _) = ss

getCorrectTmpl :: Preds -> Int
getCorrectTmpl (_, _, _, _, _, _, i) = i

readPreds :: String -> LBSC.ByteString -> (Int, [Preds])
readPreds idx predf =
  case decode HasHeader predf :: Either String (V.Vector Preds) of
    Left e -> errorWithoutStackTrace ("readPreds: " ++ e)
    Right v -> (read idx :: Int, V.toList v)

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
  mkTypeOut = ctfold f []
    where
    f p e acc = (:acc) . namedRecord $
                ["SourceSpan" .= show (infoSpan (texprInfo e))]
             ++ didChange (infoSpan (texprInfo e))
             ++ inSlice (infoSpan (texprInfo e))
             ++ concatMap (\(ls,c) -> zipWith (.=) (map mkFeature ls) (c p e)) fs

mkLabel :: String -> BSC.ByteString
mkLabel s = BSC.pack ("L-" ++ s)

mkFeature :: String -> BSC.ByteString
mkFeature s = BSC.pack ("F-" ++ s)


data InSample = MkInSample { bad :: String, fix :: String, index :: Int }
  deriving (Show, Generic)
instance FromJSON InSample
