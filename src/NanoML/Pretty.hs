module NanoML.Pretty (pretty, prettyProg, hsep) where

import Prelude hiding ( (<$>) )
import Data.List
import Text.PrettyPrint.ANSI.Leijen hiding (Pretty, pretty)
import qualified Text.PrettyPrint.ANSI.Leijen as PP

import NanoML.Types

class Pretty a where
  pretty :: a -> Doc
  pretty = prettyPrec 0

  prettyPrec :: Int -> a -> Doc
  prettyPrec _ = pretty

-- | Wrap the enclosed 'Doc' in parentheses only if the condition holds.
parensIf True  = parens
parensIf False = id

instance Pretty Value where
  pretty v = case v of
    VI i -> pretty i
    VD d -> pretty d
    VC c -> pretty c
    VS s -> text $ show s
    VB b -> text (if b then "true" else "false")
    VU   -> text "()"
    VL l -> brackets $ encloseSep lbracket rbracket semi $ map pretty l
    VT _ xs -> parens $ hcat $ intersperse comma $ map pretty xs
    VF _ -> text "<fun>"

instance Pretty Literal where
  pretty l = case l of
    LI i -> pretty i
    LD d -> pretty d
    LC c -> pretty c
    LS s -> text $ show s
    LB b -> text (if b then "true" else "false")
    LU   -> text "()"

instance Pretty Expr where
  prettyPrec z e = case e of
    Var v -> text v
    Lam p e -> parensIf (z > zl) $
               text "fun" <+> pretty p <+> text "->" </> nest 2 (pretty e)
      where zl = 5
    App (Var f) [x, y]
      | isInfix f
        -> parensIf (z > zf) $
           prettyPrec (zf+1) x <+> text f <+> prettyPrec (zf+1) y
      where zf = opPrec f
    App f xs -> parensIf (z > za) $
                prettyPrec za f <+> hsep (map (prettyPrec (za+1)) xs)
      where za = 26
    Lit l -> pretty l
    Let r bnds body -> parensIf (z > zl) $
                       align $ text "let" <> pretty r <+> prettyBinds bnds
                               <+> text "in" </> pretty body
      where zl = 4
    Ite b t f -> parensIf (z > zi) $
                 text "if" <+> pretty b </> text "then" <+> pretty t
                                        </> text "else" <+> pretty f
      where zi = 7
    Seq x y -> parensIf (z > zs) $
               prettyPrec (zs+1) x <> semi </> prettyPrec (zs+1) y
      where zs = 3
    Case e alts -> parensIf (z > zc) $
                   text "match" <+> pretty e <+> text "with"
                     <$> vsep (map prettyAlt alts)
      where zc = 5
    Nil -> text "[]"
    Cons x xs -> parensIf (z > zc) $
                 prettyPrec (zc+1) x <+> text "::" <+> prettyPrec (zc+1) xs
      where zc = 20
    Tuple xs -> parens $ hcat $ intersperse comma $ map pretty xs
    Prim1 p x -> parens (text (show p) <+> pretty x)
    Prim2 p x y -> parens (text (show p) <+> pretty x <+> pretty y)

isInfix :: Var -> Bool
isInfix = all (`elem` "!$%&*+-./:<=>?@^|~")

opPrec :: Var -> Int
opPrec = const 5 -- FIXME

instance Pretty RecFlag where
  pretty Rec = text " rec"
  pretty _   = empty

instance Pretty Pat where
  pretty p = case p of
    VarPat v -> text v
    LitPat l -> pretty l
    ConsPat x xs -> pretty x <+> text "::" <+> pretty xs
    ConPat c (TuplePat []) -> text c
    ConPat c p -> text c <+> pretty p
    ListPat l -> brackets $ encloseSep lbracket rbracket semi $ map pretty l
    TuplePat l -> parens $ hcat $ intersperse comma $ map pretty l
    WildPat -> text "_"

prettyBind (p, e) = pretty p <+> text "=" <+> nest 2 (pretty e)

prettyBinds [b] = prettyBind b
prettyBinds (b:bs) = prettyBind b <$> text "and" <+> prettyBinds bs

prettyAlt (p, g, e) = text "|" <+> pretty p
                      <> maybe empty (\g -> text " when" <+> pretty g) g
                      <+> text "->" <+> pretty e

instance Pretty Decl where
  pretty d = case d of
    DFun r bnds -> text "let" <> pretty r <+> prettyBinds bnds <+> text ";;"

prettyProg :: Prog -> Doc
prettyProg = vsep . map pretty


instance Pretty Int where
  pretty = PP.pretty

instance Pretty Double where
  pretty = PP.pretty

instance Pretty Char where
  pretty = PP.pretty
