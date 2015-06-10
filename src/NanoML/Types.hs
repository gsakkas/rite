{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE PartialTypeSignatures #-}
module NanoML.Types where

import Control.Applicative
import Control.Monad
import Control.Monad.Catch hiding (try)
import Control.Monad.IO.Class
import qualified Data.HashSet as HashSet
import Data.Functor
import Data.List
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Typeable
import System.Directory
import System.FilePath
import Text.Parser.Expression
import Text.Parser.Token.Highlight
import Text.Parser.Token.Style
import Text.Trifecta

import Debug.Trace
import Text.Printf

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
  | VC Char
  | VS String
  | VB Bool
  | VU
  | VL [Value]
  | VT Int [Value] -- VT sz:{Nat | sz >= 2} (ListN Value sz)
  | VF (Maybe Var) Env Pat Expr
  deriving (Show)

data Literal
  = LI Int
  | LD Double
  | LB Bool
  | LC Char
  | LS String
  | LU
  deriving (Show)

data RecFlag = Rec | NonRec deriving (Show)

type Prog = [Decl]

data Decl
  = DFun RecFlag [(Pat,Expr)]
  | DTyp TypeDecl
  deriving (Show)

data Expr
  = Var Var
  | Lam Pat Expr
  | App Expr Expr
  | Bop Bop Expr Expr
  | Uop Uop Expr
  | Lit Literal
  | Let RecFlag [(Pat,Expr)] Expr
  | Ite Expr Expr Expr
  | Seq Expr Expr -- TODO: do we actually need this for the student examples?
  | Case Expr [Alt]
  | Cons Expr Expr
  | Nil
  | Tuple [Expr]
  deriving (Show)

data ExprF f
  = VarF Var
  | LamF Var f
  | AppF f f
  | BopF Bop f f
  | LitF Literal
  | LetF RecFlag Pat f f
  | IteF f f f
  | SeqF f f -- TODO: do we actually need this for the student examples?
  | CaseF f [(Pat, ExprF f)]
  | ConsF f f
  | NilF
  | TupleF [f]
  deriving (Show, Functor)

--type LocExpr = Fix ExprF Careted

data Uop
  = Neg | FNeg
  deriving (Show)

data Bop
  = Eq | Neq
  | Lt | Le
  | Gt | Ge
  | And | Or
  | Plus  | Minus  | Times  | Div
  | FPlus | FMinus | FTimes | FDiv | FExp
  deriving (Show)

type Alt = (Pat, Guard, Expr)

type Guard = Maybe Expr

data Pat
  = VarPat Var
  | LitPat Literal
  | ConsPat Pat Pat
  | ConPat Var Pat
  | ListPat [Pat]
  | TuplePat [Pat]
--  | FunPat Var [Pat] -- TODO: should this be `[Pat]`?
  | WildPat
  deriving (Show)

data Type
  = TVar TVar
  | TCon TCon
  | TApp Type Type
  | Type :-> Type
  | TTup [Type]
  deriving (Show)

data TypeDecl
  = TypeDecl { tyCon :: TCon, tyVars :: [TVar], tyRhs :: TypeRhs }
  deriving (Show)

data TypeRhs
  = Alias Type
  | Alg   [DataDecl]
  deriving (Show)

data DataDecl
  = DataDecl { dCon :: DCon, dArgs :: [Type] }
  deriving (Show)

type TVar = String

type TCon = String

type DCon = String

instance Exception [Char]

----------------------------------------------------------------------
-- Evaluation
----------------------------------------------------------------------

evalDecl :: MonadThrow m => Decl -> Env -> m Env
evalDecl decl env = undefined -- case decl of
  -- DFun Rec (FunPat f ps) e -> do
  --   c <- setClosureName f <$> eval (mkCurried ps e) env
  --   return (insertEnv f c env)
  -- DFun NonRec (FunPat f ps) e -> do
  --   c <- eval (mkCurried ps e) env
  --   return (insertEnv f c env)

eval :: MonadThrow m => Expr -> Env -> m Value
eval expr env = traceShow expr $ case expr of
  Var v ->
    lookupEnv v env
  Lam v e ->
    return (VF Nothing env v e)
  App e1 e2 -> do
    v1 <- eval e1 env
    v2 <- eval e2 env
    evalApp v1 v2
  Bop b e1 e2 -> do
    v1 <- eval e1 env
    v2 <- eval e2 env
    evalBop b v1 v2
  Lit l -> return (litValue l)
  -- Let Rec (FunPat f ps) e b -> do
  --   c <- setClosureName f <$> eval (mkCurried ps e) env
  --   eval b (insertEnv f c env)
  -- Let NonRec (FunPat f ps) e b -> do
  --   c <- eval (mkCurried ps e) env
  --   eval b (insertEnv f c env)
  -- Let NonRec p e b ->
  --   eval (Case e [(p,Nothing,b)]) env
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
    traceM $ "matching: " ++ show v
    traceM $ "against:  " ++ show as
    evalAlts v as env
  Cons e es -> do
    v     <- eval e env
    VL vs <- eval es env
    return (VL (v : vs))
  Nil -> return (VL [])
  Tuple es -> do
    vs <- mapM (`eval` env) es
    return (VT (length vs) vs)

evalApp :: MonadThrow m => Value -> Value -> m Value
evalApp f a = case f of
  VF Nothing env p e -> do
    Just pat_env <- matchPat a p
    eval e (joinEnv pat_env env)
  VF (Just me) env p e -> do
    Just pat_env <- matchPat a p
    eval e (joinEnv pat_env (insertEnv me f env))
  _ -> throwM "tried to apply a non-function"

evalBop :: MonadThrow m
        => Bop -> Value -> Value -> m Value
evalBop Eq  v1 v2 = VB <$> eqVal v1 v2
evalBop Neq v1 v2 = VB . not <$> eqVal v1 v2
evalBop Lt  v1 v2 = VB <$> ltVal v1 v2
evalBop Le  v1 v2 = (\x y -> VB (x || y)) <$> ltVal v1 v2 <*> eqVal v1 v2
evalBop Gt  v1 v2 = VB <$> gtVal v1 v2
evalBop Ge  v1 v2 = (\x y -> VB (x || y)) <$> gtVal v1 v2 <*> eqVal v1 v2
evalBop Plus v1 v2 = VI <$> plusVal v1 v2
evalBop Minus v1 v2 = VI <$> minusVal v1 v2
evalBop Times v1 v2 = VI <$> timesVal v1 v2
evalBop Div v1 v2 = VI <$> divVal v1 v2

eqVal (VI x) (VI y) = return (x == y)
eqVal (VD x) (VD y) = return (x == y)
eqVal (VB x) (VB y) = return (x == y)
eqVal VU     VU     = return True
eqVal (VL x) (VL y) = and . ((length x == length y) :) <$> zipWithM eqVal x y
eqVal (VT i x) (VT j y)
  | i == j
  = and <$> zipWithM eqVal x y
eqVal x y
  = throwM (printf "cannot check incompatible types for equality: (%s) (%s)" (show x) (show y) :: String)

ltVal (VI x) (VI y) = return (x < y)
ltVal (VD x) (VD y) = return (x < y)
ltVal x      y      = throwM "cannot compare ordering of non-numeric types"

gtVal (VI x) (VI y) = return (x > y)
gtVal (VD x) (VD y) = return (x > y)
gtVal x      y      = throwM "cannot compare ordering of non-numeric types"

plusVal (VI i) (VI j) = return (i+j)
plusVal _      _      = throwM "+ can only be applied to ints"

minusVal (VI i) (VI j) = return (i-j)
minusVal _      _      = throwM "- can only be applied to ints"

timesVal (VI i) (VI j) = return (i*j)
timesVal _      _      = throwM "* can only be applied to ints"

divVal (VI i) (VI j) = return (i `div` j)
divVal _      _      = throwM "/ can only be applied to ints"


litValue :: Literal -> Value
litValue (LI i) = VI i
litValue (LD d) = VD d
litValue (LB b) = VB b
litValue (LS s) = VS s
litValue LU     = VU

evalAlts :: MonadThrow m => Value -> [Alt] -> Env -> m Value
evalAlts _ [] _
  = throwM "no matching pattern"
evalAlts v ((p,g,e):as) env
  = matchPat v p >>= \case
      Nothing  -> evalAlts v as env
      Just bnd -> eval e (joinEnv bnd env)

-- | If a @Pat@ matches a @Value@, returns the @Env@ bound by the
-- pattern.
matchPat :: MonadThrow m => Value -> Pat -> m (Maybe Env)
-- FIXME: should be MonadThrow m => m (Maybe Env) so we can throw exception on ill-typed pattern match
matchPat v p = case p of
  VarPat var ->
    return $ Just (insertEnv var v emptyEnv)
  LitPat lit ->
    return $ if matchLit v lit then Just emptyEnv else Nothing
  ConsPat p ps -> do
    (x,xs) <- unconsVal v
    Just env1 <- matchPat x p
    Just env2 <- matchPat xs ps
    return $ Just (joinEnv env1 env2)
  ListPat ps -> throwM "matchPat.ListPat"
  TuplePat ps -> throwM "matchPat.TuplePat"
--  FunPat _ _ -> throwM "cannot pattern-match on function"
  WildPat ->
    return $ Just emptyEnv

unconsVal :: MonadThrow m => Value -> m (Value, Value)
unconsVal (VL (x:xs)) = return (x, VL xs)
unconsVal _           = throwM "type error: uncons can only be applied to lists"

matchLit :: Value -> Literal -> Bool
matchLit (VI i1) (LI i2) = i1 == i2
matchLit (VD d1) (LD d2) = d1 == d2
matchLit (VB b1) (LB b2) = b1 == b2
matchLit VU      LU      = True
matchLit _       _       = False

{-@ mkCurried :: ListNE Pat -> Expr -> Expr @-}
mkCurried :: [Pat] -> Expr -> Expr
mkCurried [p]    e = Lam p e
mkCurried (p:ps) e = Lam p (mkCurried ps e)
mkCurried p e = error $ "mkCurried: " ++ show p ++ " " ++ show e

setClosureName :: Var -> Value -> Value
setClosureName f (VF _ r v e) = VF (Just f) r v e

mkInfix :: Expr -> Expr -> Expr -> Expr
mkInfix x op y = mkApps op [x,y]

mkApps :: Expr -> [Expr] -> Expr
mkApps = foldl' App

mkList :: [Expr] -> Expr
mkList = foldr Cons Nil

mkFunction :: [Alt] -> Expr
mkFunction alts = Lam (VarPat "$x") (Case (Var "$x") alts)

mkTApps :: Type -> [Type] -> Type
mkTApps = foldl' TApp

mkUMinus :: Var -> Expr -> Expr
mkUMinus "-"  (Lit (LI i)) = Lit (LI (- i))
mkUMinus "-." (Lit (LD d)) = Lit (LD (- d))

----------------------------------------------------------------------
-- Parsing
----------------------------------------------------------------------

-- idStyle :: IdentifierStyle Parser
-- idStyle = emptyIdents { _styleReserved
--                         = HashSet.fromList
--                           [ "let", "rec", "in", "if", "then", "else"
--                           , "match", "with", "end", "fun", "function"
--                           , "true", "false"
--                           ]
--                       , _styleLetter
--                         = _styleLetter emptyIdents <|> char '.'
--                       }

-- opStyle :: IdentifierStyle Parser
-- opStyle = IdentifierStyle
--           { _styleName     = "operator"
--           , _styleStart    = _styleLetter opStyle
--           , _styleLetter   = oneOf ":!#$%&*+./<=>?@\\^|-~,;"
--           , _styleReserved = HashSet.fromList [ "|", "->", ",", ";", ";;" ]
--           , _styleHighlight = Operator
--           , _styleReservedHighlight = ReservedOperator
--           }

-- mystyleLetter :: Parser Char
-- mystyleLetter = _styleLetter emptyOps <|> oneOf ",;"

-- identifier :: Parser Var
-- identifier =  ident idStyle
--           <|> try (parens (ident opStyle))

-- reserved :: String -> Parser ()
-- reserved = reserve idStyle

-- reservedOp :: String -> Parser ()
-- reservedOp = reserve opStyle

-- type_ = do reserved "type"
--            t <- identifier
--            reservedOp "="
--            cs <- many cnstr
--            reservedOp ";;"

-- cnstr = do reservedOp "|"
--            c <- identifier
--            (do reserved "of"
--                e <- typeExpr
--                return ()
--             <|> return ())

-- typeExpr =   -- TTup <$> tupleOf typeExpr
--              typeApp <|> typeTerm

-- typeTerm =   parens typeExpr
--          <|> TVar <$> typeVar
--          <|> TCon <$> typeCon

-- typeApp = do as <- try (tupleOf typeTerm) <|> fmap pure typeTerm
--              c  <- typeCon
--              return (foldl' TApp (TCon c) as)

-- typeCon = identifier

-- typeVar = char '\'' *> identifier

-- decl :: Parser Decl
-- decl = do reserved "let"
--           r <- Rec <$ reserved "rec" <|> return NonRec
--           p <- pat
--           reservedOp "="
--           e <- expr
--           reservedOp ";;"
--           return (DFun r [(p,e)])

-- expr :: Parser Expr
-- expr =   buildExpressionParser table compound
--      <?> "expression"

-- compound :: Parser Expr
-- compound =   let_ <|> lam <|> func <|> ite <|> match <|> app
--          <?> "compound expression"

-- let_ :: Parser Expr
-- let_ = do reserved "let"
--           r <- Rec <$ reserved "rec" <|> return NonRec
--           p <- pat
--           reservedOp "="
--           e <- expr
--           reserved "in"
--           body <- expr
--           return (Let r [(p,e)] body)

-- lam :: Parser Expr
-- lam = do reserved "fun"
--          p  <- pat
--          ps <- many pat
--          reservedOp "->"
--          b <- expr
--          return (mkCurried (p:ps) b)

-- func :: Parser Expr
-- func = do reserved "function"
--           as <- many alt
--           return $ Lam (VarPat "$x") (Case (Var "$x") as)

-- match :: Parser Expr
-- match = do reserved "match"
--            e <- expr
--            reserved "with"
--            as <- many alt
--            return (Case e as)
--       <?> "match"

-- alt :: Parser Alt
-- alt = do reservedOp "|"
--          p <- altPat
--          g <- Just <$> (reserved "when" *> expr) <|> pure Nothing
--          reservedOp "->"
--          e <- expr
--          return (p, g, e)

-- pat :: Parser Pat
-- pat = buildExpressionParser
--         [[ Infix (ConsPat <$ reservedOp "::") AssocRight ]]
--         (simplePat funVarPat)
--    <?> "pattern"

-- altPat :: Parser Pat
-- altPat = buildExpressionParser
--            [[ Infix (ConsPat <$ reservedOp "::") AssocRight ]]
--            (simplePat (VarPat <$> identifier))
--       <?> "pattern"

-- simplePat :: Parser Pat -> Parser Pat
-- simplePat var =   WildPat <$ reserved "_"
--               <|> LitPat <$> literal
--               <|> ListPat <$> listOf pat
--               <|> TuplePat <$> try (tupleOf pat)
--               <|> var
--               <|> parens pat

-- funVarPat :: Parser Pat
-- funVarPat = do v  <- var
--                ps <- try $ many pat
--                if null ps
--                  then return (VarPat v)
--                  else return (FunPat v ps)

-- ite :: Parser Expr
-- ite = do reserved "if"
--          b <- expr
--          reserved "then"
--          t <- expr
--          -- students like to misue if-then (without the else..)
--          e <- reserved "else" *> expr <|> return (Lit LU)
--          return (Ite b t e)

-- app :: Parser Expr
-- app = do f    <- term
--          args <- many term
--          return (foldl' App f args)
--       <?> "function application"

-- term :: Parser Expr
-- term =   Lit <$> literal
--      <|> Var <$> var
--      <|> mkList <$> listOf expr
--      <|> Tuple <$> try (tupleOf expr)
--      <|> parens expr
--      <?> "simple expression"

-- var :: Parser Var
-- var = identifier

-- literal :: Parser Literal
-- literal =   LD <$> try stupidOcamlDouble
--         <|> either (LI . fromInteger) LD <$> try integerOrDouble
--         <|> LB <$> bool
--         <|> LC <$> charLiteral
--         <|> LS <$> stringLiteral
--         <|> LU <$ reservedOp "()"
        

-- stupidOcamlDouble :: Parser Double
-- stupidOcamlDouble = token $ fromInteger <$> decimal <* char '.'

-- bool :: Parser Bool
-- bool =   True  <$ reserved "true"
--      <|> False <$ reserved "false"
--      <?> "boolean"

-- table :: [[Operator Parser Expr]]
-- table  =
--   [ [ prefix "-"  Neg, prefix "-." FNeg ]
--   , [ binary "**" FExp AssocRight ]
--   , [ binary "*"  Times  AssocLeft, binary "/"  Div  AssocLeft
--     , binary "*." FTimes AssocLeft, binary "/." FDiv AssocLeft
--     ]
--   , [ binary "+"  Plus  AssocLeft, binary "-"   Minus  AssocLeft
--     , binary "+." FPlus AssocLeft, binary "-."  FMinus AssocLeft
--     ]
--   , [ infix_ "::" Cons AssocRight ]
--   , [ infix_ "@" (mkBinApp (Var "@")) AssocRight
--     , infix_ "^" (mkBinApp (Var "^")) AssocRight
--     ]
--   , [ binary "=" Eq AssocLeft, binary "==" Eq AssocLeft {- TODO: not quite right -}
--     , binary "<>" Neq AssocLeft, binary "!=" Neq AssocLeft {- TODO: also not quite right -}
--     , binary "<" Lt AssocLeft, binary "<=" Le AssocLeft
--     , binary ">" Gt AssocLeft, binary ">=" Ge AssocLeft
--     ]
--   , [ binary "&&" And AssocLeft ]
--   , [ binary "||" Or  AssocLeft ]
-- --  , [ infix_ "," mkTuple AssocRight ]
--   , [ infix_ ";" Seq AssocRight ]
--   ]

-- binary :: String -> Bop -> Assoc -> Operator Parser Expr
-- binary name bop = Infix (Bop bop <$ reservedOp name)

-- infix_ :: String -> (Expr -> Expr -> Expr) -> Assoc -> Operator Parser Expr
-- infix_ name op = Infix (op <$ reservedOp name)

-- prefix :: String -> Uop -> Operator Parser Expr
-- prefix name op = Prefix (Uop op <$ reservedOp name)

-- mkBinApp :: Expr -> Expr -> Expr -> Expr
-- mkBinApp f e1 e2 = App (App f e1) e2

-- mkTuple :: Expr -> Expr -> Expr
-- mkTuple x (Tuple xs) = Tuple (x:xs)
-- mkTuple x y = Tuple [x,y]

-- -- postfix name fun       = Postfix (fun <* reservedOp name)

-- listOf :: Parser a -> Parser [a]
-- listOf p = brackets (p `sepBy` semi)

-- tupleOf = gtupleOf ","
-- ttupleOf = gtupleOf "*"

-- gtupleOf :: String -> Parser a -> Parser [a]
-- gtupleOf sep p = parens $ do
--   -- make sure we get at least two elemets in the tuple
--   x  <- p <* reservedOp sep
--   xs <- p `sepBy1` reservedOp sep
--   return (x:xs)


----------------------------------------------------------------------
-- Utilities
----------------------------------------------------------------------

-- evalString :: MonadThrow m => String -> m Value
-- evalString s = case parseString expr mempty s of
--   Success e -> eval e emptyEnv

facProg :: String
facProg = unlines [ "let rec fac n ="
                  , "  if n = 0 then"
                  , "    1"
                  , "  else"
                  , "    n * fac (n - 1)"
                  , ";;"
                  ]

badProg :: String
badProg = unlines [ "let f lst ="
                  , "  let rec loop lst acc ="
                  , "    if lst = [] then"
                  , "      acc"
                  , "    else"
                  , "      ()"
                  , "  in"
                  , "  match loop lst [(0.0,0.0)] with"
                  , "    | h :: t -> h"
                  , ";;"
                  ]

-- zipWithM :: Monad m => (a -> b -> m c) -> [a] -> [b] -> m [c]
-- zipWithM f as bs = sequence (zipWith f as bs)

-- parseTopLevel :: String -> Result [Decl]
-- parseTopLevel = parseString (many decl <* eof) mempty

-- parseTopLevelFile :: MonadIO m => FilePath -> m (Result [Decl])
-- parseTopLevelFile = parseFromFileEx (many decl <* eof)

-- testParser :: IO ()
-- testParser = do
--   let dir = "../yunounderstand/data/sp14/prog/unify"
--   mls <- filter (`notElem` ignoredMLs) . filter (".ml" `isSuffixOf`)
--           <$> getDirectoryContents dir
--   forM_ mls $ \ml -> do
--     r <- parseTopLevelFile (dir </> ml)
--     case r of
--       Success _ -> return ()
--       Failure _ -> print ml >> print r -- >> error "die"

ignoredMLs :: [String]
ignoredMLs = [ "prog0012.ml" -- accidental use of ! (deref)
             , "prog0582.ml" -- uses ?
             , "prog0583.ml" -- uses ?
             , "prog0584.ml" -- uses ?
             , "prog1123.ml" -- uses try
             , "prog1261.ml" -- uses n..m range operator
             , "prog1270.ml" -- uses printf
             , "prog2916.ml" -- uses list.rev (record selector)
             , "prog2918.ml" -- uses list.rev (record selector)
             , "prog3003.ml" -- uses sepList.map (record selector)
             , "prog3158.ml" -- accidental type annot (let sumList (1 : int list))
             , "prog3160.ml" -- accidental type annot (let sumList (l : int list))
             , "prog3164.ml" -- array index xs.(0)
             , "prog3165.ml" -- array index xs.(0)
             , "prog3223.ml" -- deref (!)
             , "prog3644.ml" -- deref (!)
             , "prog3645.ml" -- deref (!)
             , "prog3646.ml" -- deref (!)
             , "prog3647.ml" -- deref (!)
             , "prog3648.ml" -- deref (!)
             , "prog3649.ml" -- deref (!)
             , "prog3695.ml" -- record selector
             , "prog3816.ml" -- optional param (~l)
             , "prog4000.ml" -- postfix !
             , "prog4105.ml" -- "or" pattern (1|2)
             , "prog4169.ml" -- deref (!)
             , "prog4170.ml" -- deref (!)
             , "prog4171.ml" -- deref (!)
             , "prog4480.ml" -- uses ?
             , "prog4481.ml" -- uses ?
             , "prog4484.ml" -- uses ?
             , "prog4485.ml" -- uses ?
             , "prog4486.ml" -- uses ?
             , "prog4501.ml" -- uses ?
             , "prog4557.ml" -- uses ?
             , "prog4720.ml" -- uses ?
             , "prog4722.ml" -- uses ?
             ]

-- knownFuncs :: [Var]
-- knownFuncs = [ "sumList"
--              , "digitsOfInt"
--              , "additivePersistence"
--              , "digitalRoot"
--              , "listReverse"
--              , "palindrome"
--              , "assoc"
--              , "removeDuplicates"
--              , "wwhile"
--              , "fixpoint"
--              , "exprToString"
--              , "eval"
--              , "build"
--              , "sqsum"
--              , "pipe"
--              , "sepConcat"
--              , "stringOfList"
--              , "clone"
--              , "padZero"
--              , "removeZero"
--              , "bigAdd"
--              , "mulByDigit"
--              , "bigMul"
--              ]
