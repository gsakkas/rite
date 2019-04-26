{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE MultiWayIf        #-}
{-# LANGUAGE OverloadedStrings #-}

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
  }
  deriving (Generic, Show)
instance ParseRecord Fixes

main :: IO ()
main = do
  Fixes {source=src, mode=md, predictions=preds, out=out, clusters=cls} <-
    getRecord "make-fixes"
  jsons <- lines <$> readFile src
  let cfile = fromMaybe "data/sp14_all/clusters/top_clusters.json" cls
  pred_files <- sort <$> listDirectory preds
  raw_preds <- mapM LBSC.readFile pred_files
  let predf_ids = map takeBaseName pred_files
  case md of
    "tiny"
      -> do
        bd <- readFile "data/bad.ml"
        fx <- readFile "data/fix.ml"
        mkFixes' False preds_tis bd fx
    "synthesis"
      -> do
        ff <- lines <$> readFile cfile
        let top_cls = map readJSONLFile ff
        mkFixes True out preds top_cls (preds_tsize ++ preds_tis ++ map only_ctx preds_tis_ctx) (zip predf_ids raw_preds) jsons
    _ -> errorWithoutStackTrace "main failed: No such parameter for --mode"


data WithSlice = JustSlice | All deriving Eq

mkFixes :: Bool -> String -> String -> [(ExprGeneric, [Type])] -> [Feature] -> [(String, LBSC.ByteString)] -> [String] -> IO ()
mkFixes forTestSet out nm top_cls fs all_preds jsons = do
  let preds = map readPreds all_preds
  let uniqs = concatMap mkDiffsWithGenericTrs jsons
  let feats = [ (ss, bad, fix, badStr, fixStr, pds, idx)
              | (ss, bad, fix, badStr, fixStr, idx) <- uniqs
              , (idx', pds) <- preds
              , idx == idx'
              ]
  forM_ feats $ \ f@(ss, bad, fix, badStr, fixStr, pds, i) -> do
    let ss_expr  = map (\(fi, se, td) -> show fi ++ "\n" ++ render (pretty se) ++ "\n" ++ show td ++ "\n") ss

    let fn   = printf "%04d" (i :: Int)
    let path = out </> fn <.> "ml"
    createDirectoryIfMissing True (takeDirectory path)
    writeFile path $ unlines $ [ badStr ]
                            ++ [ "", "(* bad", badStr, "*)" ]
                            ++ [ "", "(* student fix", fixStr, "*)" ]
                            ++ [ "", "(* changed spans" ] ++ ss_expr ++ [ "*)" ]
                            -- ++ [ "", "(* type error slice" ] ++ map show cs ++ [ "*)" ]


-- George
getEgMtype :: (SrcSpan, Expr, ExprGeneric) -> [SrcSpan] -> [TExpr] -> Maybe Type
getEgMtype (ss, e, eg) alls tes
  | eg == EmptyG      = return (TVar "tEMPTY")
  | ss `notElem` alls = return (TVar "tNewPart")
  | otherwise         = generaliseT . getType <$> find (\te -> return (getTSrcSpan te) == getSrcSpanExprMaybe e) tes

-- George
mkFixes' :: Bool -> [Feature] -> String -> String -> IO ()
mkFixes' forTestSet fs badStr' fixStr' = do
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

readPreds :: (String, LBSC.ByteString) -> (Int, [Preds])
readPreds (idx, predf) =
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
