{
module NanoML.Parser where

import Control.Monad
import Data.List
import System.Directory
import System.FilePath

import NanoML.Lexer
import NanoML.Types
}

%name unsafeParseTopForm TopForm
%name unsafeParseExpr SeqExpr
%name unsafeParseLiteral Literal
%name unsafeParsePattern Pattern
%name unsafeParseType Type

%tokentype { Token }
%lexer { lexWrap } { TokEOF }
%monad { Alex }
%error { parseError }


%token

ident   { TokId $$ }
con     { TokCon $$ }
string  { TokString $$ }
char    { TokChar $$ }
int     { TokInt $$ }
float   { TokFloat $$ }

'('     { TokLParen }
')'     { TokRParen }
'{'     { TokLBrace }
'}'     { TokRBrace }
'['     { TokLBrack }
']'     { TokRBrack }

"and"      { TokAnd }
"as"       { TokAs }
"begin"    { TokBegin }
"else"     { TokElse }
"end"      { TokEnd }
"false"    { TokFalse }
"fun"      { TokFun }
"function" { TokFunction }
"if"       { TokIf }
"in"       { TokIn }
"let"      { TokLet }
"match"    { TokMatch }
"mod"      { TokMod }
"of"       { TokOf }
"or"       { TokOr }
"rec"      { TokRec }
"then"     { TokThen }
"true"     { TokTrue }
"type"     { TokType }
"when"     { TokWhen }
"with"     { TokWith }

"&&"       { TokLAnd }
"||"       { TokLOr }
'|'        { TokPipe }
','        { TokComma }
';'        { TokSemi }
";;"       { TokSemiSemi }
"->"       { TokArrow }
'.'        { TokDot }
".["       { TokDotLBrack }
'*'        { TokStar }
'\''       { TokTick }
':'        { TokColon }
"::"       { TokCons }
"[]"       { TokNil }
"()"       { TokUnit }
'='        { TokEq }
'_'        { TokUnderscore }
'-'        { TokMinus }
"-."       { TokMinusDot }
infix0     { TokInfixOp0 $$ }
infix1     { TokInfixOp1 $$ }
infix2     { TokInfixOp2 $$ }
infix3     { TokInfixOp3 $$ }
infix4     { TokInfixOp4 $$ }


-- low precedence
%nonassoc "in"
%nonassoc below_SEMI
%nonassoc ';'
%nonassoc "let"
%nonassoc "function" "with"
%nonassoc "and"
%nonassoc "then"
%nonassoc "else"
%nonassoc "as"
%left     '|'
%nonassoc below_COMMA
%left     ','
%right    "->"
%right    "||" "or"
%right    "&&"
%nonassoc below_INFIX
%left  infix0 '='
%right infix1
%nonassoc below_LBRACKETAT
%right "::"
%left  infix2 '-' "-."
%left  infix3 '*'
%right infix4
%nonassoc unary_minus
%nonassoc constr
%nonassoc constr_app
%nonassoc below_DOT
%nonassoc '.'
%nonassoc below_TOP
%nonassoc "begin" char "false" float int '[' ident '(' string "true"

%%

-- Declarations

TopForm :: { [Decl] }
: TopFormList            { $1 }

TopFormList :: { [Decl] }
: {- empty -}                 { [] }
| Decl ";;" TopFormList       { $1 : $3 }
| Decl TopFormList            { $1 : $2 }
-- | TopFormList ";;" Decl ";;"  { $3 : $1 }

Decl :: { Decl }
: "let" RecFlag LetBindings    { DFun $2 $3 }
| "type" TypeDecl              { DTyp $2 }

LetBindings :: { [(Pat,Expr)] }
: LetBinding                    { [$1] }
| LetBindings "and" LetBinding  { $3 : $1 }

LetBinding :: { (Pat, Expr) }
: ValIdent FunBinding   { (VarPat $1, $2) }
| Pattern '=' SeqExpr   { ($1, $3) }

FunBinding :: { Expr }
: '=' SeqExpr        { $2 }
| SimplePattern FunBinding { Lam $1 $2 }

TypeDecl :: { TypeDecl }
: MaybeTyVars ValIdent '=' TypeRhs  { TypeDecl $2 $1 $4 }

MaybeTyVars :: { [TVar] }
: {- empty -}                 { [] }
| TyVar                       { [$1] }
| '(' TyVarList ')'           { reverse $2 }

TyVarList :: { [TVar] }
: TyVar                       { [$1] }
| TyVarList ',' TyVar         { $3 : $1 }

TyVar :: { TVar }
: '\'' ident                  { $2 }

TypeRhs :: { TypeRhs }
: Type                        { Alias $1 }
| MaybePipe DataDecls         { Alg (reverse $2) }

DataDecls :: { [DataDecl] }
: DataDecl                    { [$1] }
| DataDecls '|' DataDecl      { $3 : $1 }

DataDecl :: { DataDecl }
: ConIdent DataArgs              { DataDecl $1 (reverse $2) }

DataArgs :: { [Type] }
: {- empty -}                 { [] }
| "of" TypeList               { reverse $2 }

-- Patterns

Pattern :: { Pat }
: SimplePattern         { $1 }
| Pattern "as" ValIdent { $1 } -- FIXME: do i need to implement the alias?
| PatternCommaList %prec below_COMMA     { TuplePat (reverse $1) }
| ConIdent Pattern %prec constr_app      { ConPat $1 $2 }
| Pattern "::" Pattern                   { ConsPat $1 $3 }

SimplePattern :: { Pat }
: ValIdent  %prec below_INFIX  { VarPat $1 }
| SimplePatternNotIdent        { $1 }

SimplePatternNotIdent :: { Pat }
: '_'                     { WildPat }
| Literal                 { LitPat $1 }
| '[' PatternSemiList ']' { ListPat (reverse $2) }
| '(' Pattern ')'         { $2 }
| ConLongIdent            { ConPat $1 (TuplePat []) }

PatternCommaList :: { [Pat] }
: PatternCommaList ',' Pattern  { $3 : $1 }
| Pattern ',' Pattern           { [$3, $1] }

PatternSemiList :: { [Pat] }
: PatternSemiList ';' Pattern  { $3 : $1 }
| Pattern                      { [$1] }

-- Expressions

SeqExpr :: { Expr }
: Expr     %prec below_SEMI  { $1 }
| Expr ';'                   { $1 }
| Expr ';' SeqExpr           { Seq $1 $3 }

Expr :: { Expr }
: SimpleExpr      %prec below_TOP           { $1 }
| SimpleExpr SimpleExprList                 { mkApps $1 (reverse $2) }
| "let" RecFlag LetBindings "in" SeqExpr     { Let $2 $3 $5 }
| "function" MaybePipe AltList              { mkFunction $3 }
| "fun" SimplePattern "->" Expr             { Lam $2 $4 }
| "match" SeqExpr "with" MaybePipe AltList  { Case $2 (reverse $5) }
| ExprCommaList   %prec below_COMMA         { Tuple (reverse $1) }
| "if" SeqExpr "then" Expr "else" Expr      { Ite $2 $4 $6 }
| "if" SeqExpr "then" Expr                  { Ite $2 $4 (Lit LU) }
| SimpleExpr ".[" SeqExpr ']'               { mkApps (Var "String.get") [$1, $3] }
| Expr "::" Expr                            { Cons $1 $3 }
| Expr "&&" Expr                            { mkInfix $1 (Var "&&") $3 }
| Expr "||" Expr                            { mkInfix $1 (Var "||") $3 }
| Expr "or" Expr                            { mkInfix $1 (Var "||") $3 }
| Expr infix0 Expr                          { mkInfix $1 (Var $2) $3 }
| Expr '='    Expr                          { mkInfix $1 (Var "=") $3 }
| Expr infix1 Expr                          { mkInfix $1 (Var $2) $3 }
| Expr '-'    Expr                          { mkInfix $1 (Var "-") $3 }
| Expr "-."   Expr                          { mkInfix $1 (Var "-.") $3 }
| Expr infix2 Expr                          { mkInfix $1 (Var $2) $3 }
| Expr infix3 Expr                          { mkInfix $1 (Var $2) $3 }
| Expr '*'    Expr                          { mkInfix $1 (Var "*") $3 }
| Expr infix4 Expr                          { mkInfix $1 (Var $2) $3 }
| Subtractive Expr %prec unary_minus        { mkUMinus $1 $2 }

SimpleExpr :: { Expr }
: ValLongIdent          { Var $1 }
| ConLongIdent %prec constr  { Var $1 }
| Literal               { Lit $1 }
| '(' SeqExpr ')'       { $2 }
| "begin" SeqExpr "end" { $2 }
| '[' ExprSemiList ']'  { mkList (reverse $2) }
| "[]"                  { mkList [] }

SimpleExprList :: { [Expr] }
: SimpleExpr                  { [$1] }
| SimpleExprList SimpleExpr   { $2 : $1 }

ExprCommaList :: { [Expr] }
: ExprCommaList ',' Expr   { $3 : $1 }
| Expr ',' Expr            { [$3, $1] }

ExprSemiList :: { [Expr] }
: Expr                    { [$1] }
| ExprSemiList ';' Expr   { $3 : $1 }

AltList :: { [Alt] }
: Alt                   { [$1] }
| AltList '|' Alt       { $3 : $1 }

Alt :: { Alt }
: Pattern "->" SeqExpr                 { ($1, Nothing, $3) }
| Pattern "when" SeqExpr "->" SeqExpr  { ($1, Just $3, $5) }

Literal :: { Literal }
: string    { LS (read $1) }
| char      { LC (read $1) }
| int       { LI (read $1) }
| float     { LD (read $1) }
| "()"      { LU }
| "true"    { LB True }
| "false"   { LB False }

Subtractive :: { Var }
: '-'          { "-" }
| "-."         { "-." }

-- Types

Type :: { Type }
: SimpleTypeOrTuple  { $1 }
| Type "->" Type     { $1 :-> $3 }

SimpleTypeOrTuple :: { Type }
: SimpleType   %prec below_LBRACKETAT   { $1 }
| SimpleType '*' TypeList               { TTup ($1 : reverse $3) }

TypeList :: { [Type] }
: SimpleType   %prec below_LBRACKETAT   { [$1] }
| TypeList '*' SimpleType               { $3 : $1 }

SimpleType :: { Type }
: SimpleType2           %prec below_TOP { $1 }
| '(' TypeCommaList ')' %prec below_TOP { case $2 of { [a] -> a } }

SimpleType2 :: { Type }
: '\'' ident                   { TVar $2 }
| ValLongIdent                 { TCon $1 }
| SimpleType2 ValLongIdent            { TApp (TCon $2) $1 }
| '(' TypeCommaList ')' ValLongIdent  { mkTApps (TCon $4) (reverse $2) }

TypeCommaList :: { [Type] }
: Type                         { [$1] }
| TypeCommaList ',' Type       { $3 : $1 }

-- Misc

ValIdent :: { Var }
: ident              { $1 }
| '(' Operator ')'   { $2 }

ValLongIdent :: { Var }
: ValIdent           { $1 }
| ModLongIdent '.' ValIdent { $1 ++ "." ++ $3 }

ConLongIdent :: { Var }
: ModLongIdent %prec below_DOT { $1 }
| "[]"                         { "[]" }
| "()"                         { "()" }

ModLongIdent :: { Var }
: con                    { $1 }
| ModLongIdent '.' con   { $1 ++ "." ++ $3 }

Operator :: { Var }
: infix0             { $1 }
| infix1             { $1 }
| infix2             { $1 }
| infix3             { $1 }
| infix4             { $1 }
| '*'                { "*" }
| '='                { "=" }
| '-'                { "-" }
| "-."               { "-." }

RecFlag :: { RecFlag }
: {- empty -} { NonRec }
| "rec"       { Rec }

MaybePipe :: { () }
: {- empty -}      { () }
| '|'              { () }

ConIdent :: { Var }
: con     { $1 }

{

parseError :: Token -> Alex a
parseError t = do
    (line, column) <- getPosition
    alexError $ "unexpected token " ++ show t
      ++ " at line " ++ show line
      ++ ", column " ++ show (column - 1)

safeParse parser s = runAlex s parser

parseTopForm = safeParse unsafeParseTopForm
parseExpr    = safeParse unsafeParseExpr
parseLiteral = safeParse unsafeParseLiteral
parsePattern = safeParse unsafeParsePattern
parseType    = safeParse unsafeParseType

testParser :: IO [Prog]
testParser = do
  let dir = "../yunounderstand/data/sp14/prog/unify"
  mls <- filter (`notElem` ignoredMLs) . filter (".ml" `isSuffixOf`)
          <$> getDirectoryContents dir
  forM mls $ \ml -> do
    r <- parseTopForm <$> readFile (dir </> ml)
    case r of
      Right p -> return p
      Left _ -> print ml >> print r >> error "die"
}
