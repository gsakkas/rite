{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeSynonymInstances #-}
module NanoML.HeatMap where

import Control.Monad.IO.Class (liftIO)
import Control.Monad.State (evalStateT, modify, get, put)
import           Data.List                    hiding (group)
import qualified Data.Map                     as Map
import           Prelude                      hiding ((<$>))
import           Text.PrettyPrint.Annotated.Leijen hiding (Pretty, pretty, list)
import qualified Text.PrettyPrint.Annotated.Leijen as PP
import Numeric (showHex)

import NanoML.Classify
import NanoML.Types hiding (Annot)

-- W
-- Eq [-0.06406111  0.0640611 ]
-- Neq [-0.01457523  0.01457523]
-- Lt [-0.19006032  0.19006032]
-- Le [-0.187015  0.187015]
-- Gt [-0.08262776  0.08262776]
-- Ge [-0.01763367  0.01763367]
-- And [ 0.03144223 -0.03144224]
-- Or [-0.01229332  0.01229331]
-- Plus [-0.23259756  0.23259759]
-- Minus [-0.17104992  0.17104992]
-- Times [ 0.08778118 -0.08778119]
-- Div [ 0.13608319 -0.13608322]
-- Mod [ 0.09898072 -0.09898074]
-- :: [ 0.07203147 -0.07203148]
-- [] [-0.18782224  0.18782224]
-- (,) [ 0.00776304 -0.00776298]
-- Fun [-0.1542004   0.15420042]
-- ('b', array([-0.23434784,  0.23434804], dtype=float32))

type Annot = Double

computeHeat :: Expr -> Annot
                -- returns the "badness" score,
                -- i.e positive is "bad", negative is "good"
computeHeat e = head $ head $ mmult fs ws `msum` b
  where
  fs = [ map ($e) preds_has ] -- TODO parameterize

  ws = [ [-0.06406111,  0.0640611 ]
       , [-0.01457523,  0.01457523]
       , [-0.19006032,  0.19006032]
       , [-0.187015  ,  0.187015  ]
       , [-0.08262776,  0.08262776]
       , [-0.01763367,  0.01763367]
       , [ 0.03144223, -0.03144224]
       , [-0.01229332,  0.01229331]
       , [-0.23259756,  0.23259759]
       , [-0.17104992,  0.17104992]
       , [ 0.08778118, -0.08778119]
       , [ 0.13608319, -0.13608322]
       , [ 0.09898072, -0.09898074]
       , [ 0.07203147, -0.07203148]
       , [-0.18782224,  0.18782224]
       , [ 0.00776304, -0.00776298]
       , [-0.1542004 ,  0.15420042]
       ]

  b = [ [-0.23434784,  0.23434804] ]

foo :: [([Double], Double)]
                -- returns the "badness" score,
                -- i.e positive is "bad", negative is "good"
foo = [ (fs, head $ head $ mmult [fs] ws `msum` b)
      | fs <- map (map bool2double) $ enum 17
      ]
  where
  ws = [ [-0.06406111,  0.0640611 ]
       , [-0.01457523,  0.01457523]
       , [-0.19006032,  0.19006032]
       , [-0.187015  ,  0.187015  ]
       , [-0.08262776,  0.08262776]
       , [-0.01763367,  0.01763367]
       , [ 0.03144223, -0.03144224]
       , [-0.01229332,  0.01229331]
       , [-0.23259756,  0.23259759]
       , [-0.17104992,  0.17104992]
       , [ 0.08778118, -0.08778119]
       , [ 0.13608319, -0.13608322]
       , [ 0.09898072, -0.09898074]
       , [ 0.07203147, -0.07203148]
       , [-0.18782224,  0.18782224]
       , [ 0.00776304, -0.00776298]
       , [-0.1542004 ,  0.15420042]
       ]

  b = [ [-0.23434784,  0.23434804] ]

cATEGORICAL_COLS = ["Eq","Neq","Lt","Le","Gt","Ge",
                    "And","Or",
                    "Plus","Minus","Times","Div","Mod",
                    "::", "[]", "(,)", "Fun"]

-- Q: what feature vectors are marked BAD
-- A:
-- mapM_ (print . fst) $ map (first (catMaybes . zipWith (\a b -> if b >= 1 then Just a else Nothing) cATEGORICAL_COLS)) $ filter (\(_,d) -> d > 0) foo


enum :: Int -> [[Bool]]
enum 1 = [[True, False]]
enum n = map (True:) (enum (n-1)) ++ map (False:) (enum (n-1))

mmult :: Num a => [[a]] -> [[a]] -> [[a]]
mmult a b = [ [ sum $ zipWith (*) ar bc | bc <- (transpose b) ] | ar <- a ]

msum :: Num a => [[a]] -> [[a]] -> [[a]]
msum a b = zipWith (zipWith (+)) a b


renderHeat :: Doc Annot -> IO ()
renderHeat d = evalStateT do_this [] >> putStrLn "\ESC[0m"
  where
  do_this = displayDecoratedA (liftIO . putStr) push pop (renderPretty 0.5 60 d)
  push h = modify (heat2ansi h:) >> liftIO (putStr (heat2ansi h))
  pop h  = do _:rest <- get
              liftIO $ case rest of
                [] -> putStr "\ESC[0m"
                x:_ -> putStr x
              put rest

  heat2ansi h = "\ESC[38;2;" ++ (if h < 0 then "0;0;0" else "255;255;255") ++ "m"
               ++ "\ESC[48;2;" ++ mkansi h ++ "m" --  ++ s ++ "\ESC[0m"

  mkansi h = show (truncate (255 * (1 - (h+1) / 2)))  -- r
          ++ ";"
          ++ show (truncate (255 * (1 - (h+1) / 2)))  -- g
          ++ ";"
          ++ show (truncate (255 * (1 - (h+1) / 2)))  -- b
    --      ++ "0"                                                -- b

  -- heat2ansi h s = "\ESC[48;2;" ++ mkansi h ++ "m" ++ s ++ "\ESC[0m"

  -- mkansi h = show (truncate (255 * (if h > 0 then sqrt(h) else 0)))  -- r
  --         ++ ";"
  --         ++ show (truncate (255 * (if h < 0 then 0 else 0)))  -- g
  --         ++ ";"
  --         ++ "0"                                                -- b


class Pretty a where
  pretty :: a -> Doc Annot
  pretty = prettyPrec 0

  prettyPrec :: Int -> a -> Doc Annot
  prettyPrec _ = pretty

-- | Wrap the enclosed 'Doc' in parentheses only if the condition holds.
parensIf True  = parens
parensIf False = id

list xs = text "["
          <> (hsep $ intersperse semi $ map (prettyPrec 0) xs)
          <> text "]"
array xs = text "[|"
           <> (hsep $ intersperse semi $ map (prettyPrec 0) xs)
           <> text "|]"
tuple xs = text "("
           <> (hsep $ intersperse comma $ map (prettyPrec 0) xs)
           <> text ")"
record xs = text "{"
            <> (hsep $ intersperse semi $ map prettyField xs)
            <> text "}"

prettyField (f,x) = text f <+> text "=" <+> prettyPrec 0 x

instance Pretty Literal where
  pretty l = case l of
    LI i -> parensIf (i < 0) $ pretty i
    LD d -> parensIf (d < 0) $ pretty d
    LC c -> pretty c
    LS s -> text $ show s
    LB b -> text (if b then "true" else "false")
--    LU   -> text "()"

annotateIf b a d
  | b         = annotate a $ noAnnotate d
  | otherwise = d

instance Pretty Expr where
  -- HEREHERHERHE extreact features, run model, annotate with heat
  prettyPrec z e = annotate (computeHeat e) $ case e of
    Var _ v -> parensIf (isInfix v) $ text v
    Lam _ (VarPat _ "$x") (Case _ (Var _ "$x") alts) _ ->
      group $ parensIf (z > zl) $ hang 2 $
      text "function" <$> vsep (map (prettyAlt (zl)) alts)
      where zl = 5
    Lam _ p e _ ->
      group $ parensIf (z > zl) $ hang 2 $
      text "fun" <+> pretty p <+> text "->" <$> prettyPrec (zl) e
      where zl = 5
    App _ (Var _ f) [x, y]
      | isInfix f ->
        parensIf (z > zf) $
        prettyPrec (zf+1) x <+>
        text f <+>
        prettyPrec (zf+1) y
      where zf = opPrec f
    App _ f xs ->
      parensIf (z > za) $
      prettyPrec za f <+>
      align (foldr1 (</>) (map (prettyPrec (za+1)) xs))
      where za = 26
    Lit _ l -> pretty l
    Let _ r bnds body ->
      parensIf (z > zl) $
      align $ text "let" <> pretty r <+> prettyBinds (zl) bnds <+> text "in"
              <$> prettyPrec (zl) body
      where zl = 4
    Ite _ b t f ->
      group $ parensIf (z > zi) $ align $
      text "if"   <+> prettyPrec (zi) b <$>
      text "then" <+> prettyPrec (zi) t <$>
      text "else" <+> prettyPrec (zi) f
      where zi = 7
    Seq _ x y ->
      parensIf (z > zs) $
      prettyPrec (zs) x <> semi </> prettyPrec (zs) y
      where zs = 3
    Case _ e alts ->
      parensIf (z > zc) $ align $
      text "match" <+> prettyPrec (zc) e <+> text "with"
        <$> vsep (map (prettyAlt (zc)) alts)
      where zc = 5
    Tuple _ xs -> tuple xs
    ConApp _ c Nothing _ -> text c
    ConApp _ "::" (Just (Tuple _ [hd,tl])) _ ->
      parensIf (z > zc) $
      prettyPrec (zc+1) hd <+>
      text "::" <+>
      prettyPrec (zc+1) tl
      where zc = 26
    ConApp _ c (Just e) _ ->
      parensIf (z > zc) $
      text c <+> prettyPrec (zc+1) e
      where zc = 26
    Record _ flds _ -> record flds
    Field _ e f ->
      prettyPrec z e <> char '.' <> text f
    SetField _ e f v ->
      prettyPrec z e <> char '.' <> text f <+> text "<-" <+>
      prettyPrec z v
    Array _ es _ -> array es
    List _ es _ -> list es
    Try _ e ps ->
      parensIf (z > zt) $ align $
      text "try" <+> prettyPrec zt e <+> text "with"
        <$> vsep (map (prettyAlt (zt)) ps)
      where zt = 5
    Prim1 _ p -> text (show p)
    Prim2 _ p -> text (show p)
    -- Val _ v -> prettyPrec z v
    Bop _ bop x y ->
      parensIf (z > zb) $
      prettyPrec (zb+1) x <+> pretty bop <+> prettyPrec (zb+1) y
      where zb = opPrec (error "prettyExpr.Bop")
    Uop _ uop x ->
      parens $
      pretty uop <+> prettyPrec (zb+1) x
      where zb = opPrec (error "prettyExpr.Uop")
    With _ env e -> prettyPrec z e
    Replace _ env e -> prettyPrec z e
    Hole _ _r _ -> text "_"  -- NOTE: ignore the index
    Ref r -> text "<ref-" <> pretty r <> text ">"

instance Pretty Bop where
  pretty Eq = text "="
  pretty Neq = text "<>"
  pretty Lt = text "<"
  pretty Le = text "<="
  pretty Gt = text ">"
  pretty Ge = text ">="
  pretty And = text "&&"
  pretty Or = text "||"
  pretty Plus = text "+"
  pretty Minus = text "-"
  pretty Times = text "*"
  pretty Div = text "/"
  pretty Mod = text "mod"
  pretty FPlus = text "+."
  pretty FMinus = text "-."
  pretty FTimes = text "*."
  pretty FDiv = text "/."
  pretty FExp = text "exp"

instance Pretty Uop where
  pretty Neg = text "-"
  pretty FNeg = text "-."

isInfix :: Var -> Bool
isInfix = all (`elem` "!$%&*+-./:<=>?@^|~")

opPrec :: Var -> Int
opPrec = const 12 -- FIXME

instance Pretty RecFlag where
  pretty Rec = text " rec"
  pretty _   = empty

instance Pretty MutFlag where
  pretty Mut = text "mutable "
  pretty _   = empty

instance Pretty Pat where
  prettyPrec z p = case p of
    VarPat _ v -> text v
    LitPat _ l -> pretty l
    IntervalPat _ l h -> pretty l <+> text ".." <+> pretty h
    ConsPat _ x xs -> parensIf (z > zc) $ prettyPrec (zc+1) x <+> text "::" <+> prettyPrec zc xs
                      where zc = 6
    ConPat _ c Nothing -> text c
    ConPat _ c (Just p) -> text c <+> pretty p
    ListPat _ l -> prettyList l
    TuplePat _ l -> prettyTuple 0 l
    WildPat _ -> text "_"
    OrPat _ p1 p2 -> pretty p1 <+> text "|" <+> pretty p2
    AsPat _ p v -> pretty p <+> text "as" <+> text v
    ConstraintPat _ p t -> parens $ pretty p <+> char ':' <+> pretty t

instance Pretty (Doc Annot) where
  prettyPrec _ = id

prettyList xs = parens $ hsep $ intersperse semi $ map (prettyPrec 0) xs

prettyTuple z [] = empty
prettyTuple z [x] = prettyPrec z x
prettyTuple z xs = parens $ hsep $ intersperse comma $ map (prettyPrec z) xs

prettyTypeTuple xs = parens $ hsep $ intersperse (text "*") $ map pretty xs

prettyTypeArgs [] = empty
prettyTypeArgs as = prettyTuple 0 as <+> empty

prettyBind z (VarPat _ p, e'@(Lam {}))
  = group $ nest 2 $ pretty p <+> hsep (map pretty ps) <+> text "="
    <$> prettyPrec z e
  where
  (ps, e) = gatherLams e'
prettyBind z (p, e) = group $ nest 2 $ pretty p <+> text "=" <$> prettyPrec z e

gatherLams :: Value -> ([Pat], Expr)
gatherLams (Lam _ p e _) = go [p] e
  where
  go ps (Lam _ p e _) = go (p:ps) e
  go ps e             = (reverse ps, e)

prettyBinds z [b] = prettyBind z b
prettyBinds z (b:bs) = prettyBind z b <$> text "and" <+> prettyBinds z bs

prettyAlt z (p, g, e) = text "|" <+> prettyPrec z p
                      <> maybe empty (\g -> text " when" <+> prettyPrec z g) g
                      <+> text "->" <+> prettyPrec z e


instance Pretty Decl where
  pretty d = case d of
    DFun _ r bnds -> text "let" <> pretty r <+> prettyBinds 0 bnds
    DEvl _ expr   -> pretty expr
    DTyp _ tdecls -> text "type" <+> prettyTypeDecls tdecls
    DExn _ decl   -> text "exception" <+> pretty decl

prettyTypeDecls [b]    = pretty b
prettyTypeDecls (b:bs) = pretty b <$> text "and" <+> prettyTypeDecls bs


instance Pretty TypeDecl where
  pretty TypeDecl {..} = group $ prettyTuple 0 tyVars <+> text tyCon <+> text "=" <$>
                                 pretty tyRhs

instance Pretty TypeRhs where
  pretty (Alias t) = pretty t
  pretty (Alg ds)  = vsep (map ((text "|" <+>) . pretty) ds)

instance Pretty DataDecl where
  pretty DataDecl {..} = case dArgs of
    []  -> text dCon
    ts  -> text dCon <+> text "of" <+> hsep (intersperse (text "*") $ map pretty ts)

prettyProg :: Prog -> Doc Annot
prettyProg = vsep . map pretty

instance Pretty TVar where
  pretty = text

instance Pretty Int where
  pretty = text . show

instance Pretty Double where
  pretty = text . show

instance Pretty Char where
  pretty = text . show

expr ==> val = nest 2 $ pretty expr <$> (text "==>" <+> pretty val)
var =: val   = group $ nest 2 $ text var    <+> (text ":="  <$> pretty val)

render :: Doc a -> String
render d = displayS (renderPretty 0.5 60 d) ""

renderSpans :: Doc a -> (String, SpanList a)
renderSpans d = displaySpans (renderPretty 0.5 60 d)

instance Pretty MSrcSpan where
  pretty (Just ss) = pretty ss
  pretty Nothing = text "<unknown>"

instance Pretty SrcSpan where
  pretty SrcSpan{..} = text "line" <+> pretty srcSpanStartLine
                    <> char ',' <+> text "column" <+> pretty srcSpanStartCol

instance Pretty Type where
  prettyPrec z t = case t of
    TVar v -> squote <> text v
--    TCon c -> text c
    TApp t ts -> prettyTypeArgs ts <> pretty t
    TTup ts -> parens $ hsep $ intersperse (text "*") $ map pretty ts
    ti :-> to -> parensIf (z > zf) $
                 prettyPrec (zf+1) ti <+> text "->" <+> prettyPrec zf to
      where zf = 5

instance Pretty NanoError where
  pretty e = case e of
    MLException v -> text "*** Exception:" <+> pretty v
    UnboundVariable v ss ->
      text "Unbound variable" <>
       -- "at" <+> pretty ss <+>
       text ":" <+> pretty v
    TypeError t1 t2 ss ->
      let tvs = freeTyVars t1 ++ freeTyVars t2
          su  = Map.fromList $ zip tvs (map (TVar . (:[])) ['a' .. 'z'])
          t1' = subst su t1
          t2' = subst su t2
      in
      text "Type error" <>
      -- "at" <+> pretty ss <+>
      -- text ": could not match" <+> pretty t1 <+> text "with" <+> pretty t2
      text ": stuck because" <+>
      {-ticks-} (pretty t1') <+>
      text "is incompatible with" <+>
      {-ticks-} (pretty t2')
    ParseError s -> text "Parse error:" <+> text s
    OutputTypeMismatch v t -> text "Type error: output value" <+> pretty v <+> text "does not have type" <+> pretty t
    OtherError s -> text "Error:" <+> text s
    TimeoutError n -> text "Error: <timeout after" <+> pretty n <+> text "steps>"

ticks d = char '`' <> d <> char '\''

prettyTyCon :: Type -> Doc Annot
prettyTyCon t = case t of
  TVar {} -> pretty t
  TApp c _ -> text c
  _ :-> _ -> text "function"
  TTup x -> pretty (length x) <> char '-' <> text "tuple"
