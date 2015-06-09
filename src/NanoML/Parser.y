{
module NanoML.Parser where

import NanoML.Lexer
import NanoML.Types
}

%name unsafeParseTopForm TopForm
%name unsafeParseExpr SeqExpr
%name unsafeParseLiteral Literal
%name unsafeParseType Type

%tokentype { Token }
%lexer { lexWrap } { TokEOF }
%monad { Alex }
%error { parseError }


%token

ident   { TokId $$ }
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
'*'        { TokStar }
'\''       { TokTick }
':'        { TokColon }
"::"       { TokCons }
"[]"       { TokNil }
"()"       { TokUnit }
'='        { TokEq }
'_'        { TokUnderscore }
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
%right    "||"
%right    "&&"
%nonassoc below_INFIX
%left  infix0
%right infix1
%nonassoc below_LBRACKETAT
%right "::"
%left  infix2
%left  infix3
%right infix4
%nonassoc below_TOP
%nonassoc "begin" char "false" float int '[' ident '(' string "true"

%%

-- Declarations

TopForm :: { [Decl] }
: TopFormList            { reverse $1 }

TopFormList :: { [Decl] }
: {- empty -}            { [] }
| Decl ";;"              { [$1] }
| TopFormList ";;" Decl  { $3 : $1 }

Decl :: { Decl }
: "let" RecFlag LetBinding     { DFun $2 (fst $3) (snd $3) }
| "type" TypeDecl              { DTyp $2 }

LetBinding :: { (Pat, Expr) }
: ident FunBinding   { (VarPat $1, $2) }
| Pattern '=' Expr   { ($1, $3) }

FunBinding :: { Expr }
: '=' SeqExpr        { $2 }
| SimplePattern FunBinding { Lam $1 $2 }

TypeDecl :: { TypeDecl }
: MaybeTyVars ident '=' TypeRhs  { TypeDecl $2 $1 $4 }

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
| DataDecls                   { Alg (reverse $1) }

DataDecls :: { [DataDecl] }
: DataDecl                    { [$1] }
| DataDecls '|' DataDecl      { $3 : $1 }

DataDecl :: { DataDecl }
: ident DataArgs              { DataDecl $1 (reverse $2) }

DataArgs :: { [Type] }
: {- empty -}                 { [] }
| "of" TypeList               { reverse $2 }

-- Patterns

Pattern :: { Pat }
: SimplePattern        { $1 }
| Pattern "::" Pattern { ConsPat $1 $3 }
| PatternCommaList     { TuplePat (reverse $1) }

SimplePattern :: { Pat }
: ident                   { VarPat $1 }
| '_'                     { WildPat }
| Literal                 { LitPat $1 }
| '[' PatternSemiList ']' { ListPat (reverse $2) }
| '(' Pattern ')'         { $2 }

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
| "let" RecFlag LetBinding "in" SeqExpr     { Let $2 (fst $3) (snd $3) $5 }
| "function" MaybePipe AltList              { mkFunction $3 }
| "fun" SimplePattern Expr                  { Lam $2 $3 }
| "match" SeqExpr "with" MaybePipe AltList  { Case $2 (reverse $5) }
| ExprCommaList   %prec below_COMMA         { Tuple (reverse $1) }
| "if" SeqExpr "then" Expr "else" Expr      { Ite $2 $4 $6 }
| "if" SeqExpr "then" Expr                  { Ite $2 $4 (Lit LU) }
| Expr "::" Expr                            { Cons $1 $3 }
| Expr infix0 Expr                          { mkInfix $1 (Var $2) $3 }
| Expr infix1 Expr                          { mkInfix $1 (Var $2) $3 }
| Expr infix2 Expr                          { mkInfix $1 (Var $2) $3 }
| Expr infix3 Expr                          { mkInfix $1 (Var $2) $3 }
| Expr infix4 Expr                          { mkInfix $1 (Var $2) $3 }

SimpleExpr :: { Expr }
: ident                 { Var $1 }
| Literal               { Lit $1 }
| '(' SeqExpr ')'       { $2 }
| "begin" SeqExpr "end" { $2 }
| '[' ExprSemiList ']'  { mkList (reverse $2) }

SimpleExprList :: { [Expr] }
: SimpleExpr                  { [$1] }
| SimpleExprList SimpleExpr   { $2 : $1 }

ExprCommaList :: { [Expr] }
: ExprCommaList ',' Expr   { $3 : $1 }
| Expr ',' Expr            { [$1, $3] }

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

-- Types

Type :: { Type }
: SimpleTypeOrTuple  { $1 }
| Type "->" Type     { $1 :-> $3 }

SimpleTypeOrTuple :: { Type }
: SimpleType   %prec below_LBRACKETAT   { $1 }
| SimpleType '*' TypeList               { TTup ($1 : reverse $3) }

TypeList :: { [Type] }
: SimpleType   %prec below_LBRACKETAT   { [$1] }
| TypeList '*' Type                     { $3 : $1 }

SimpleType :: { Type }
: SimpleType2           %prec below_TOP { $1 }
| '(' TypeCommaList ')' %prec below_TOP { case $2 of { [a] -> a } }

SimpleType2 :: { Type }
: '\'' ident                   { TVar $2 }
| ident                        { TCon $1 }
| SimpleType2 ident            { TApp (TCon $2) $1 }
| '(' TypeCommaList ')' ident  { mkTApps (TCon $4) (reverse $2) }

TypeCommaList :: { [Type] }
: Type                         { [$1] }
| TypeCommaList ',' Type       { $3 : $1 }

-- Misc

RecFlag :: { RecFlag }
: {- empty -} { NonRec }
| "rec"       { Rec }

MaybePipe :: { () }
: {- empty -}      { () }
| '|'              { () }


{

parseError :: Token -> Alex a
parseError t = do
    (line, column) <- getPosition
    alexError $ "unexpected token " ++ show t
      ++ " at line " ++ show line
      ++ ", column " ++ show (column - 1)

-- successfully parse or let the string as is
safeParse parser s = either (const (Left s)) Right (runAlex s parser)

parseTopForm = safeParse unsafeParseTopForm
parseExpr    = safeParse unsafeParseExpr
parseLiteral = safeParse unsafeParseLiteral
parseType    = safeParse unsafeParseType
}
