{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE ImplicitParams       #-}
module NanoML.Pretty
  (pretty, prettyRedex, prettyProg, hsep, vsep, vcat, Doc, render, renderSpans, (==>), (=:), nest, text, fillHoles)
  where

import           Control.Arrow                (first, second)
import qualified Data.IntMap                  as IntMap
import           Data.List                    hiding (group)
import qualified Data.Vector                  as Vector
import           Prelude                      hiding ((<$>))
import           Text.PrettyPrint.Annotated.Leijen hiding (Pretty, pretty, list)
import qualified Text.PrettyPrint.Annotated.Leijen as PP

import           NanoML.Types

import Debug.Trace

class Pretty a where
  pretty :: a -> Doc Annot
  pretty = let ?env = emptyEnv
           in prettyPrec 0

  prettyPrec :: (?env :: Env) => Int -> a -> Doc Annot
  prettyPrec _ = pretty

prettyRedex env e = let ?env = env
                    in prettyPrec 0 e

-- | Wrap the enclosed 'Doc' in parentheses only if the condition holds.
parensIf True  = parens
parensIf False = id

fillHoles :: EvalState -> Expr -> Expr
fillHoles st = go
  where
  go e = case e of
    Hole _ r _ -> maybe e (go . snd) (IntMap.lookup r (stStore st))

    Lam ms p x me -> Lam ms p (go x) me
    App ms f xs -> App ms (go f) (map go xs)
    Bop ms b x y -> Bop ms b (go x) (go y)
    Uop ms u x -> Uop ms u (go x)
    Let ms r bnds body -> Let ms r (map (second go) bnds) (go body)
    Ite ms b t f -> Ite ms (go b) (go t) (go f)
    Seq ms x y -> Seq ms (go x) (go y)
    Case ms x alts -> Case ms (go x) (map (\(p,g,x) -> (p, fmap go g, go x)) alts)
    Tuple ms xs -> Tuple ms (map go xs)
    ConApp ms d mx mt -> ConApp ms d (fmap go mx) mt
    Record ms flds mt -> Record ms (map (second go) flds) mt
    Field ms x f -> Field ms (go x) f
    SetField ms x f y -> SetField ms (go x) f (go y)
    Array ms xs mt -> Array ms (map go xs) mt
    List ms xs mt -> List ms (map go xs) mt
    Try ms x alts -> Try ms (go x) (map (\(p,g,x) -> (p, fmap go g, go x)) alts)
    With ms env x -> With ms env (go x)
    Replace ms env x -> Replace ms env (go x)

    _ -> e


-- instance Pretty Value where
--   prettyPrec z v = case v of
--     VI _ i -> pretty i
--     VD _ d -> pretty d
--     VC _ c -> text $ "'" ++ [c] ++ "'"
--     VS _ s -> text $ show s
--     VB _ b -> text (if b then "true" else "false")
--     VU _   -> text "()"
--     VL _ l _ -> list l
--     VT _ _ xs _ -> tuple xs
--     VA _ d Nothing _ -> text d
--     VA _ d (Just x) _ -> parensIf (z>za) $ text d <+> pretty x
--       where za = 26
--     VR _ fs _ -> record fs
--     VV _ vs _ -> array $ Vector.toList vs
--     VF _ (Func e _) -> prettyPrec z e
--     VH _ _ -> text "_"

list xs = text "[" <> (hsep $ intersperse semi $ map (prettyPrec 0) xs) <> text "]"
array xs = text "[|" <> (hsep $ intersperse semi $ map (prettyPrec 0) xs) <> text "|]"
tuple xs = text "(" <> (hsep $ intersperse comma $ map (prettyPrec 0) xs) <> text ")"
record xs = text "{" <> (hsep $ intersperse semi $ map prettyField xs) <> text "}"

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

-- noAnnotateIf b d =
--   if b
--      then noAnnotate d
--      else d

isFun (Lam {}) = True
isFun (Prim1 {}) = True
isFun (Prim2 {}) = True
isFun _        = False

isValueOrFunVar (Var _ v) = maybe False isFun (lookupEnv v ?env)
isValueOrFunVar (Lam {})  = True
isValueOrFunVar (Prim1 {})  = True
isValueOrFunVar (Prim2 {})  = True
isValueOrFunVar e = isValue e

instance Pretty Expr where
  prettyPrec z e = case e of
    Var _ v -> parensIf (isInfix v) $
               case lookupEnv v ?env of
                 Just (Lam {}) -> text v
                 Just (Prim1 {}) -> text v
                 Just (Prim2 {}) -> text v
                 x -> annotate Redex $ text v
    Lam _ (VarPat _ "$x") (Case _ (Var _ "$x") alts) _ ->
      noAnnotate $
      group $ parensIf (z > zl) $ hang 2 $
      text "function" <$> vsep (map (prettyAlt (zl)) alts)
      where zl = 5
    Lam _ p e _ ->
      noAnnotate $
      group $ parensIf (z > zl) $ hang 2 $
      text "fun" <+> pretty p <+> text "->" <$> prettyPrec (zl) e
      where zl = 5
    App _ (Var _ f) [x, y]
      | isInfix f ->
        annotateIf (isValueOrFunVar x && isValueOrFunVar y) Redex $
        parensIf (z > zf) $
        prettyPrec (zf+1) x <+> text f <+> prettyPrec (zf+1) y
      where zf = opPrec f
    App _ f xs ->
      annotateIf (all isValueOrFunVar (f:xs)) Redex $
      parensIf (z > za) $
      (prettyPrec za f) <+>
      align (foldr1 (</>) (map (prettyPrec (za+1)) xs))
      where za = 26
    Lit _ l -> pretty l
    Let _ r bnds body ->
      annotateIf (all (isValueOrFunVar . snd) bnds) Redex $
      group $ parensIf (z > zl) $
      align $ text "let" <> pretty r <+> prettyBinds (zl) bnds
          <+> text "in" <$> noAnnotate (prettyPrec (zl) body)
      where zl = 4
    Ite _ b t f ->
      annotateIf (isValueOrFunVar b) Redex $
      group $ parensIf (z > zi) $ align $
      text "if"   <+> prettyPrec (zi) b <$>
      text "then" <+> noAnnotate (prettyPrec (zi) t) <$>
      text "else" <+> noAnnotate (prettyPrec (zi) f)
      where zi = 7
    Seq _ x y ->
      annotateIf (isValueOrFunVar x) Redex $
      parensIf (z > zs) $
      prettyPrec (zs) x <> semi </> noAnnotate (prettyPrec (zs) y)

      where zs = 3
    Case _ e alts
      --  isValueOrFunVar e ->
      --   parensIf (z > zc) $ align $
      --   text "match" <+> annotate Redex (noAnnotate (pretty e)) <+> text "with"
      --     <$> vsep (map prettyAltRedex alts)
      --  otherwise ->
      --   parensIf (z > zc) $ align $
      --   text "match" <+> pretty e <+> text "with"
      --     <$> vsep (map prettyAlt alts)
      -- where zc = 5
      ->
      annotateIf (isValueOrFunVar e) Redex $
      parensIf (z > zc) $ align $
      text "match" <+> prettyPrec (zc) e <+> text "with"
        <$> vsep (map (noAnnotate . prettyAlt (zc)) alts)
      where zc = 5
    Tuple _ xs -> prettyTuple 0 xs
    ConApp _ c Nothing _ -> text c
    ConApp _ "::" (Just (Tuple _ [hd,tl])) _ ->
      parensIf (z > zc) $
      prettyPrec (zc+1) hd <+> text "::" <+> prettyPrec (zc+1) tl
      where zc = 26
    ConApp _ c (Just e) _ -> parensIf (z > zc) $
                         text c <+> prettyPrec (zc+1) e
      where zc = 26
    Record _ flds _ -> record flds
    Field _ e f ->
      annotateIf (isValueOrFunVar e) Redex $
      prettyPrec z e <> char '.' <> text f
    SetField _ e f v ->
      annotateIf (isValueOrFunVar e && isValueOrFunVar v) Redex $
      prettyPrec z e <> char '.' <> text f <+> text "<-" <+> prettyPrec z v
    Array _ es _ -> array es
    List _ es _ -> list es
    Try _ e ps ->
      annotateIf (isValueOrFunVar e) Redex $
      parensIf (z > zt) $ align $
      text "try" <+> prettyPrec zt e <+> text "with"
        <$> vsep (map (prettyAlt (zt)) ps)
      where zt = 5
    Prim1 _ p -> text (show p)
    Prim2 _ p -> text (show p)
    -- Val _ v -> prettyPrec z v
    Bop _ bop x y ->
      annotateIf (isValueOrFunVar x && isValueOrFunVar y) Redex $
      parensIf (z > zb) $
      prettyPrec (zb+1) x <+> pretty bop <+> prettyPrec (zb+1) y
      where zb = opPrec (error "prettyExpr.Bop")
    Uop _ uop x ->
      annotateIf (isValueOrFunVar x) Redex $ parens $ -- parensIf (z > zb) $
      pretty uop <+> prettyPrec (zb+1) x
      where zb = opPrec (error "prettyExpr.Uop")
    With _ env e -> let ?env = env in prettyPrec z e
    Replace _ env e -> let ?env = env in prettyPrec z e
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
    ListPat _ l -> list l
    TuplePat _ l -> prettyTuple 0 l
    WildPat _ -> text "_"
    OrPat _ p1 p2 -> pretty p1 <+> text "|" <+> pretty p2
    AsPat _ p v -> pretty p <+> text "as" <+> text v
    ConstraintPat _ p t -> parens $ pretty p <+> char ':' <+> pretty t


prettyTuple z [] = empty
prettyTuple z [x] = prettyPrec z x
prettyTuple z xs = parens $ hsep $ intersperse comma $ map (prettyPrec z) xs

prettyTypeTuple xs = parens $ hsep $ intersperse (text "*") $ map pretty xs

prettyTypeArgs [] = empty
prettyTypeArgs as = prettyTuple 0 as <+> empty

prettyBind z (p, e) = group $ nest 2 $ pretty p <+> text "=" <$> prettyPrec z e

prettyBinds z [b] = prettyBind z b
prettyBinds z (b:bs) = prettyBind z b <$> text "and" <+> prettyBinds z bs

prettyAlt z (p, g, e) = text "|" <+> prettyPrec z p
                      <> maybe empty (\g -> text " when" <+> prettyPrec z g) g
                      <+> text "->" <+> prettyPrec z e

prettyAltRedex z (p, g, e) =
  text "|" <+> annotate Redex (prettyPrec z p)
  <> maybe empty (\g -> text " when" <+> noAnnotate (prettyPrec z g)) g
  <+> text "->" <+> noAnnotate (prettyPrec z e)

instance Pretty Decl where
  pretty d = case d of
    DFun _ r bnds -> let ?env = emptyEnv in
                     text "let" <> pretty r <+> prettyBinds 0 bnds
    DEvl _ expr   -> pretty expr
    DTyp _ tdecls -> text "type" <+> prettyTypeDecls tdecls
    DExn _ decl   -> text "exception" <+> pretty decl

prettyTypeDecls [b]    = pretty b
prettyTypeDecls (b:bs) = pretty b <$> text "and" <+> prettyTypeDecls bs


instance Pretty TypeDecl where
  pretty TypeDecl {..} = let ?env = emptyEnv in
                         group $ prettyTuple 0 tyVars <+> text tyCon <+> text "=" <$>
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
      text "Type error" <>
      -- "at" <+> pretty ss <+>
      -- text ": could not match" <+> pretty t1 <+> text "with" <+> pretty t2
      text ": stuck because" <+>
      ticks (prettyTyCon t1) <+>
      text "is incompatible with" <+>
      ticks (prettyTyCon t2)
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
