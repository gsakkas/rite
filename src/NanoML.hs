module NanoML where

import Control.Applicative
import qualified Data.HashSet as HashSet
import Data.List
import Data.Map (Map)
import qualified Data.Map as Map
import Text.Parser.Expression
import Text.Parser.Token.Style
import Text.Trifecta


----------------------------------------------------------------------
-- Core Types
----------------------------------------------------------------------

type Var = String

type Env = Map Var Value

insertEnv :: Var -> Value -> Env -> Env
insertEnv = Map.insert

lookupEnv :: Var -> Env -> Maybe Value
lookupEnv = Map.lookup

data Value
  = VI Int
  | VD Double
  | VB Bool
  | VU
  | VL [Value]
  | VT Int [Value] -- VT sz:Nat (ListN Value sz)
  | VC Env Var Expr
  deriving (Show)

data Literal
  = LI Int
  | LD Double
  | LB Bool
  | LU
  deriving (Show)

data RecFlag = Rec | NonRec deriving (Show)

data Expr
  = Var Var
  | Lam Var Expr
  | App Expr Expr
  | Lit Literal
  | Let RecFlag Pat Expr Expr
  | Ite Expr Expr Expr
  | Seq Expr Expr -- TODO: do we actually need this for the student examples?
  | Case Expr [Alt]
  deriving (Show)

type Alt = (Pat, Expr)

data Pat
  = VarPat Var
  | LitPat Literal
  | ListPat [Pat]
  | TuplePat [Pat]
  | FunPat Var [Var] -- TODO: should this be `[Pat]`?
  | WildPat
  deriving (Show)


----------------------------------------------------------------------
-- Parsing
----------------------------------------------------------------------

idStyle :: IdentifierStyle Parser
idStyle = emptyIdents { _styleReserved
                        = HashSet.fromList
                          [ "let", "rec", "in", "if", "then", "else"
                          , "match", "with", "fun", "function"
                          , "true", "false"
                          ]
                      }

opStyle :: IdentifierStyle Parser
opStyle = emptyOps { _styleReserved
                     = HashSet.fromList
                       [ "+", "-", "*", "/", "+.", "-.", "*.", "/."
                       , "++", "^", "="
                       ]
                   }

identifier :: Parser Var
identifier = ident idStyle

reserved :: String -> Parser ()
reserved = reserve idStyle

reservedOp :: String -> Parser ()
reservedOp = reserve idStyle

expr :: Parser Expr
expr =   buildExpressionParser table compound
     <?> "expression"

compound :: Parser Expr
compound =   let_ <|> ite <|> app
         <?> "compound expression"

let_ :: Parser Expr
let_ = do reserved "let"
          b <- Rec <$ reserved "rec" <|> return NonRec
          p <- pat
          reservedOp "="
          e <- expr
          reserved "in"
          body <- expr
          return (Let b p e body)

pat :: Parser Pat
pat =   WildPat <$ reserved "_"
    <|> LitPat <$> literal
    <|> ListPat <$> listOf pat
    <|> TuplePat <$> tupleOf pat
    <|> funVarPat
    <?> "pattern"

funVarPat :: Parser Pat
funVarPat = do v  <- identifier
               vs <- many identifier
               if null vs
                 then return (VarPat v)
                 else return (FunPat v vs)

ite :: Parser Expr
ite = do reserved "if"
         b <- expr
         reserved "then"
         t <- expr
         reserved "else"
         e <- expr
         return (Ite b t e)

app :: Parser Expr
app = do f    <- term
         args <- many term
         return (foldl' App f args)
      <?> "function application"

term :: Parser Expr
term =   parens expr
     <|> Lit <$> literal
     <|> Var <$> var
     <?> "simple expression"

var :: Parser Var
var = identifier

literal :: Parser Literal
literal =   either (LI . fromInteger) LD <$> try integerOrDouble
        <|> LB <$> bool
        <?> "literal"

bool :: Parser Bool
bool =   True  <$ reserved "true"
     <|> False <$ reserved "false"
     <?> "boolean"

table :: [[Operator Parser Expr]]
table  = [ [ binary "*"  AssocLeft, binary "/"  AssocLeft
           , binary "*." AssocLeft, binary "/." AssocLeft
           ]
         , [ binary "+"  AssocLeft, binary "-"  AssocLeft
           , binary "+." AssocLeft, binary "-." AssocLeft
           ]
         ]

binary :: String -> Assoc -> Operator Parser Expr
binary name = Infix (mkOp <* reservedOp name)
  where
  mkOp = return $ \e1 e2 -> (App (App (Var name) e1) e2)
-- prefix  name fun       = Prefix (fun <* reservedOp name)
-- postfix name fun       = Postfix (fun <* reservedOp name)

listOf :: Parser a -> Parser [a]
listOf p = brackets (p `sepBy` semi)

tupleOf :: Parser a -> Parser [a]
tupleOf p = parens (p `sepBy` comma)

