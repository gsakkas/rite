module NanoML.Pretty where

import Prelude hiding ( (<$>) )
import Data.List
import Text.PrettyPrint.ANSI.Leijen

import NanoML.Types

instance Pretty Value where
  pretty v = case v of
    VI i -> pretty i
    VD d -> pretty d
    VC c -> pretty c
    VS s -> pretty s
    VB b -> text (if b then "true" else "false")
    VU   -> text "()"
    VL l -> brackets $ encloseSep lbracket rbracket semi $ map pretty l
    VT _ l -> tupled $ map pretty l
    VF _ -> text "<fun>"

instance Pretty Literal where
  pretty l = case l of
    LI i -> pretty i
    LD d -> pretty d
    LC c -> pretty c
    LS s -> pretty s
    LB b -> text (if b then "true" else "false")
    LU   -> text "()"

instance Pretty Expr where
  pretty e = case e of
    Var v -> text v
    Lam p e -> text "fun" <+> pretty p <+> text "->" </> nest 2 (pretty e)
    App x y -> parens $ pretty x <+> pretty y
    Lit l -> pretty l
    Let r bnds body -> align $ text "let" <> pretty r <+> prettyBinds bnds
                               <+> text "in" </> pretty body
    Ite b t f -> text "if" <+> pretty b </> text "then" <+> pretty t
                                        </> text "else" <+> pretty f
    Seq x y -> pretty x <> semi </> pretty y
    Case e alts -> text "match" <+> pretty e <+> text "with"
                   <$> vsep (map prettyAlt alts)
    Nil -> text "[]"
    Cons x xs -> pretty x <+> text "::" <+> pretty xs
    Tuple xs -> parens $ hcat $ intersperse comma $ map pretty xs
    Prim1 p x -> parens (text (show p) <+> pretty x)
    Prim2 p x y -> parens (text (show p) <+> pretty x <+> pretty y)

instance Pretty RecFlag where
  pretty Rec = text " rec"
  pretty _   = empty

instance Pretty Pat where
  pretty p = case p of
    VarPat v -> text v
    LitPat l -> pretty l
    ConsPat x xs -> pretty x <+> text "::" <+> pretty xs
    ConPat c (TuplePat []) -> pretty c
    ConPat c p -> pretty c <+> pretty p
    ListPat l -> brackets $ encloseSep lbracket rbracket semi $ map pretty l
    TuplePat l -> parens $ hcat $ intersperse comma $ map pretty l
    WildPat -> text "_"

prettyBind (p, e) = pretty p <+> text "=" <+> nest 2 (pretty e)

prettyBinds [b] = prettyBind b
prettyBinds (b:bs) = pretty b <$> text "and" <+> pretty bs


prettyAlt (p, g, e) = text "|" <+> pretty p
                      <> maybe empty (\g -> text " when" <+> pretty g) g
                      <+> text "->" <+> pretty e

instance Pretty Decl where
  pretty d = case d of
    DFun r bnds -> text "let" <> pretty r <+> prettyBinds bnds <+> text ";;"

prettyProg :: Prog -> Doc
prettyProg = vsep . map pretty
