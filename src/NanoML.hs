{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
module NanoML where

import Control.Applicative
import Control.Monad.Catch hiding (try)
import qualified Data.HashSet as HashSet
import Data.List
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Typeable
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

-- | Left-biased union of environments.
joinEnv :: Env -> Env -> Env
joinEnv = Map.union

lookupEnv :: MonadThrow m => Var -> Env -> m Value
lookupEnv v env = case Map.lookup v env of
  Nothing -> throwM (UnboundVariable v)
  Just x  -> return x

emptyEnv :: Env
emptyEnv = Map.empty

data UnboundVariable
  = UnboundVariable Var
  deriving (Show, Typeable)
instance Exception UnboundVariable

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
  | ConsPat Pat Pat
  | ListPat [Pat]
  | TuplePat [Pat]
  | FunPat Var [Var] -- TODO: should this be `[Pat]`?
  | WildPat
  deriving (Show)

instance Exception [Char]

----------------------------------------------------------------------
-- Evaluation
----------------------------------------------------------------------

eval :: MonadThrow m => Expr -> Env -> m Value
eval expr env = case expr of
  Var v ->
    lookupEnv v env
  Lam v e ->
    return (VC env v e)
  App e1 e2 -> do
    v1 <- eval e1 env
    v2 <- eval e2 env
    evalApp v1 v2
  Lit l -> return (litValue l)
  Let NonRec (FunPat f vs) e b -> do
    c <- eval (mkCurried vs e) env
    eval b (insertEnv f c env)
  Let NonRec p e b ->
    eval (Case e [(p,b)]) env
  Let Rec p e b ->
    throwM "eval.LetRec"
  Ite eb et ef -> do
    vb <- eval eb env
    case vb of
      VB True  -> eval et env
      VB False -> eval ef env
      _        -> throwM "if-then-else given a non-boolean"
  Seq e1 e2 ->
    eval e1 env >> eval e2 env
  Case e as -> do
    v <- eval e env
    evalAlts v as env

mkCurried :: [Var] -> Expr -> Expr
mkCurried [v]    e = Lam v e
mkCurried (v:vs) e = Lam v (mkCurried vs e)

evalApp :: MonadThrow m => Value -> Value -> m Value
evalApp f a = case f of
  VC env v e -> eval e (insertEnv v a env)
  _          -> throwM "tried to apply a non-function"

litValue :: Literal -> Value
litValue (LI i) = VI i
litValue (LD d) = VD d
litValue (LB b) = VB b
litValue LU     = VU

evalAlts :: MonadThrow m => Value -> [Alt] -> Env -> m Value
evalAlts _ [] _
  = throwM "no matching pattern"
evalAlts v ((p,e):as) env
  = case matchPat v p of
      Nothing  -> evalAlts v as env
      Just bnd -> eval e (joinEnv bnd env)

-- | If a @Pat@ matches a @Value@, returns the @Env@ bound by the
-- pattern.
matchPat :: Value -> Pat -> Maybe Env
matchPat v p = case p of
  VarPat var ->
    Just (insertEnv var v emptyEnv)
  LitPat lit ->
    if matchLit v lit then Just emptyEnv else Nothing
  ConsPat p ps -> throwM "matchPat.ConsPat"
  ListPat ps -> throwM "matchPat.ListPat"
  TuplePat ps -> throwM "matchPat.TuplePat"
  FunPat _ _ -> throwM "cannot pattern-match on function"
  WildPat ->
    Just emptyEnv

matchLit :: Value -> Literal -> Bool
matchLit (VI i1) (LI i2) = i1 == i2
matchLit (VD d1) (LD d2) = d1 == d2
matchLit (VB b1) (LB b2) = b1 == b2
matchLit VU      LU      = True
matchLit _       _       = False

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


----------------------------------------------------------------------
-- Utilities
----------------------------------------------------------------------

evalString :: MonadThrow m => String -> m Value
evalString s = case parseString expr mempty s of
  Success e -> eval e emptyEnv
