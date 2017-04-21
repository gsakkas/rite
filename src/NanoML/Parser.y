{
module NanoML.Parser where

import Prelude hiding ( getChar )

import Control.Monad
import Data.List
import System.Directory
import System.FilePath

import NanoML.Lexer
import NanoML.Prim
import NanoML.Types
}

%name unsafeParseTopForm TopForm
%name unsafeParseExpr SeqExpr
%name unsafeParseLiteral Literal
%name unsafeParsePattern Pattern
%name unsafeParseType Type

%tokentype { LToken }
%lexer { lexWrap } { LToken _ TokEOF }
%monad { Alex }
%error { parseError }


%token

ident   { LToken _ (TokId _) }
con     { LToken _ (TokCon _) }
string  { LToken _ (TokString _) }
char    { LToken _ (TokChar _) }
int     { LToken _ (TokInt _) }
float   { LToken _ (TokFloat _) }

'('     { LToken _ TokLParen }
')'     { LToken _ TokRParen }
'{'     { LToken _ TokLBrace }
'}'     { LToken _ TokRBrace }
'['     { LToken _ TokLBrack }
']'     { LToken _ TokRBrack }
"[|"    { LToken _ TokLBrackPipe }
"|]"    { LToken _ TokRBrackPipe }

"and"      { LToken _ TokAnd }
"as"       { LToken _ TokAs }
"begin"    { LToken _ TokBegin }
"else"     { LToken _ TokElse }
"end"      { LToken _ TokEnd }
"exception"{ LToken _ TokException }
"false"    { LToken _ TokFalse }
"fun"      { LToken _ TokFun }
"function" { LToken _ TokFunction }
"if"       { LToken _ TokIf }
"in"       { LToken _ TokIn }
"let"      { LToken _ TokLet }
"match"    { LToken _ TokMatch }
"module"   { LToken _ TokModule }
"mutable"  { LToken _ TokMutable }
"of"       { LToken _ TokOf }
"open"     { LToken _ TokOpen }
"or"       { LToken _ TokOr }
"rec"      { LToken _ TokRec }
"then"     { LToken _ TokThen }
"true"     { LToken _ TokTrue }
"try"      { LToken _ TokTry }
"type"     { LToken _ TokType }
"when"     { LToken _ TokWhen }
"with"     { LToken _ TokWith }

"&&"       { LToken _ TokLAnd }
"||"       { LToken _ TokLOr }
'|'        { LToken _ TokPipe }
','        { LToken _ TokComma }
';'        { LToken _ TokSemi }
";;"       { LToken _ TokSemiSemi }
"->"       { LToken _ TokArrow }
"<-"       { LToken _ TokBackArrow }
'.'        { LToken _ TokDot }
".."       { LToken _ TokDotDot }
'*'        { LToken _ TokStar }
'\''       { LToken _ TokTick }
'!'        { LToken _ TokBang }
':'        { LToken _ TokColon }
":="       { LToken _ TokColonEq }
"::"       { LToken _ TokCons }
'='        { LToken _ TokEq }
'_'        { LToken _ TokUnderscore }
'+'        { LToken _ TokPlus }
"+."       { LToken _ TokPlusDot }
'-'        { LToken _ TokMinus }
"-."       { LToken _ TokMinusDot }
infix0     { LToken _ (TokInfixOp0 _) }
infix1     { LToken _ (TokInfixOp1 _) }
infix2     { LToken _ (TokInfixOp2 _) }
infix3     { LToken _ (TokInfixOp3 _) }
infix4     { LToken _ (TokInfixOp4 _) }


-- low precedence
%nonassoc "in"
%nonassoc below_SEMI
%nonassoc ';'
%nonassoc "let"
%nonassoc "function" "with"
%nonassoc "and"
%nonassoc "then"
%nonassoc "else"
%nonassoc "<-"
%nonassoc ":="
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
%left  infix2 '+' "+." '-' "-."
%left  infix3 '*'
%right infix4
%nonassoc unary_minus
%nonassoc constr
%nonassoc constr_app
%nonassoc below_SHARP
%nonassoc below_DOT
%nonassoc '.'
%nonassoc '!' "begin" char con "false" float int '{' '[' ident '(' string "true"

%%

-- Declarations

TopForm :: { [Decl] }
: Structure                         { $1 }

Structure :: { [Decl] }
: GetPosition SeqExpr GetPosition DeclList 
  { locDecl $1 $3 (\s -> DEvl s $2) : $4 }
| DeclList
  { $1 }

DeclList :: { [Decl] }
: {- empty -}              { [] }
| ";;" Structure           { $2 }
| Decl DeclList            { $1 : $2 }

Decl :: { Decl }
: GetPosition "let" RecFlag  LetBindings GetPosition
  { locDecl $1 $5 (\s -> DFun s $3 (reverse $4)) }
| GetPosition "type" TypeDecls GetPosition
  { locDecl $1 $4 (\s -> DTyp s (reverse $3)) }
| GetPosition "exception" DataDecl GetPosition
  { locDecl $1 $4 (\s -> DExn s $3) }

LetBindings :: { [(Pat,Expr)] }
: LetBinding                    { [$1] }
| LetBindings "and" LetBinding  { $3 : $1 }

LetBinding :: { (Pat, Expr) }
: ValIdent FunBinding   { (VarPat (getSrcSpanMaybe $1) (getVal $1), $2) }
| Pattern '=' SeqExpr   { ($1, $3) }

FunBinding :: { Expr }
: '=' SeqExpr        { $2 }
| TypeConstraint '=' SeqExpr { $3 }
| SimplePattern FunBinding { Lam (mergeLocated $1 $2) $1 $2 Nothing }

TypeConstraint :: { Type }
: ':' Type { $2 }

TypeDecls :: { [TypeDecl] }
: TypeDecl                  { [$1] }
| TypeDecls "and" TypeDecl  { $3 : $1 }

TypeDecl :: { TypeDecl }
: MaybeTyVars ident '=' TypeRhs  { TypeDecl (getId $2) $1 $4 }

MaybeTyVars :: { [TVar] }
: {- empty -}                 { [] }
| TyVar                       { [$1] }
| '(' TyVarList ')'           { reverse $2 }

TyVarList :: { [TVar] }
: TyVar                       { [$1] }
| TyVarList ',' TyVar         { $3 : $1 }

TyVar :: { TVar }
: '\'' ident                  { (getId $2) }

TypeRhs :: { TypeRhs }
: Type              { Alias $1 }
| '{' LabelDecls MaybeSemi '}' { TRec (reverse $2) }
| DataDecls         { Alg (reverse $1) }
| '|' DataDecls     { Alg (reverse $2) }

LabelDecls :: { [Field] }
: LabelDecl                     { [$1] }
| LabelDecls ';' LabelDecl      { $3 : $1 }

LabelDecl :: { Field }
: MutFlag Label ':' Type              { ($2, $1, $4) }

DataDecls :: { [DataDecl] }
: DataDecl                    { [$1] }
| DataDecls '|' DataDecl      { $3 : $1 }

DataDecl :: { DataDecl }
: con DataArgs              { DataDecl (getCon $1) $2 (error "parseDataDecl") }

DataArgs :: { [Type] }
: {- empty -}                 { [] }
| "of" TypeList               { (reverse $2) }

-- Patterns

Pattern :: { Pat }
: SimplePattern         { $1 }
| Pattern "as" ValIdent { AsPat (mergeLocated $1 $3) $1 (getVal $3) }
| PatternCommaList %prec below_COMMA     { TuplePat (mergeLocated (last $1) (head $1)) (reverse $1) }
| con Pattern      %prec constr_app      { ConPat (mergeLocated $1 $2) (getCon $1) (Just $2) }
| Pattern "::" Pattern                   { ConsPat (mergeLocated $1 $3) $1 $3 }
| Pattern '|' Pattern                    { OrPat (mergeLocated $1 $3) $1 $3 }

SimplePattern :: { Pat }
: ValIdent  %prec below_INFIX  { VarPat (getSrcSpanMaybe $1) (getVal $1) }
| SimplePatternNotIdent        { $1 }

SimplePatternNotIdent :: { Pat }
: '_'                               { WildPat (getSrcSpanMaybe $1) }
| SignedLiteral                     { LitPat (getSrcSpanMaybe $1) (getVal $1) }
| SignedLiteral ".." SignedLiteral  { IntervalPat (mergeLocated $1 $3) (getVal $1) (getVal $3) }
| SignedLiteral '.' '.' SignedLiteral  { IntervalPat (mergeLocated $1 $4) (getVal $1) (getVal $4) }
| '[' PatternSemiList ']'           { ListPat (mergeLocated $1 $3) (reverse $2) }
| '(' Pattern ')'                   { $2 }
| '(' Pattern ':' Type ')'          { ConstraintPat (mergeLocated $1 $5) $2 $4 }
| ConLongIdent                      { ConPat (getSrcSpanMaybe $1) (getVal $1) Nothing }

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
| Expr ';' SeqExpr           { Seq (mergeLocated $1 $3) $1 $3 }

Expr :: { Expr }
: SimpleExpr      %prec below_SHARP         { $1 }
| SimpleExpr SimpleExprList                 { mkApps (mergeLocated $1 (head $2)) $1 (reverse $2) }
| ConLongIdent SimpleExpr %prec below_SHARP { mkConApp (mergeLocated $1 $2) (getVal $1) [$2] }
| "let" RecFlag LetBindings "in" SeqExpr    { Let (mergeLocated $1 $5) $2 (reverse $3) $5 }
| "function" MaybePipe AltList              { mkFunction (mergeLocated $1 (thd3 (head $3))) (reverse $3) }
| "fun" SimplePattern FunDef                { Lam (mergeLocated $1 $3) $2 $3 Nothing }
| "match" SeqExpr "with" MaybePipe AltList  { Case (mergeLocated $1 (thd3 (head $5))) $2 (reverse $5) }
| "try" SeqExpr "with" MaybePipe AltList    { Try (mergeLocated $1 (thd3 (head $5))) $2 (reverse $5) }
| ExprCommaList   %prec below_COMMA         { Tuple (mergeLocated (last $1) (head $1)) (reverse $1) }
| "if" SeqExpr "then" Expr "else" Expr      { Ite (mergeLocated $1 $6) $2 $4 $6 }
| "if" SeqExpr "then" Expr                  { Ite (mergeLocated $1 $4) $2 $4 (VU (mergeLocated $1 $4)) }
| Expr "::" Expr                            { mkConApp (mergeLocated $1 $3) "::" [$1, $3] }
| '(' "::" ')' '(' Expr ',' Expr ')'        { mkConApp (mergeLocated $1 $8) "::" [$5, $7] }
| Expr ':' Type                             { mkApps (mergeLocated $1 $1) (mkPrim1Fun (P1 "cast" (\v -> return v) $3)) [$1] }
| SimpleExpr '.' LongIdent "<-" Expr        { SetField (mergeLocated $1 $5) $1 (getVal $3) $5 }
-- | SimpleExpr '.' '(' SeqExpr ')' "<-" Expr  { mkApps (Var "Array.set") [$1, $4, $7] }
-- | SimpleExpr '.' '[' SeqExpr ']' "<-" Expr  { mkApps (Var "String.set") [$1, $4, $7] }
| Expr ":=" Expr                            { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) ":=") $3 }
| Expr "&&" Expr                            { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) "&&") $3 }
| Expr "||" Expr                            { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) "||") $3 }
| Expr "or" Expr                            { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) "||") $3 }
| Expr infix0 Expr                          { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) (getInfix0 $2)) $3 }
| Expr '='    Expr                          { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) "=") $3 }
| Expr infix1 Expr                          { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) (getInfix1 $2)) $3 }
| Expr '+'    Expr                          { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) "+") $3 }
| Expr "+."   Expr                          { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) "+.") $3 }
| Expr '-'    Expr                          { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) "-") $3 }
| Expr "-."   Expr                          { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) "-.") $3 }
| Expr infix2 Expr                          { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) (getInfix2 $2)) $3 }
| Expr infix3 Expr                          { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) (getInfix3 $2)) $3 }
| Expr '*'    Expr                          { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) "*") $3 }
| Expr infix4 Expr                          { mkInfix (mergeLocated $1 $3) $1 (Var (getSrcSpanMaybe $2) (getInfix4 $2)) $3 }
| Subtractive Expr %prec unary_minus        { mkUMinus (mergeLocated $1 $2) (getVal $1) $2 }

SimpleExpr :: { Expr }
: ValLongIdent          { Var (getSrcSpanMaybe $1) (getVal $1) }
| ConLongIdent %prec constr  { mkConApp (getSrcSpanMaybe $1) (getVal $1) [] }
| Value                 { (getVal $1) }
| SimpleExpr '.' '[' SeqExpr ']'     { mkApps (mergeLocated $1 $5) (Var (mergeLocated $1 $5) "String.get") [$1, $4] }
| SimpleExpr '.' '(' SeqExpr ')'     { mkApps (mergeLocated $1 $5) (Var (mergeLocated $1 $5) "Array.get")  [$1, $4] }
| SimpleExpr '.' LongIdent        { Field (mergeLocated $1 $3) $1 (getVal $3) }
| '!' SimpleExpr        { mkApps (mergeLocated $1 $2) (Var (getSrcSpanMaybe $1) "!") [$2] }
| '(' SeqExpr ')'       { $2 }
| "[|" ExprSemiList MaybeSemi "|]" { Array (mergeLocated $1 $4) (reverse $2) Nothing }
| '{' RecordExpr '}'    { Record (mergeLocated $1 $3) $2 Nothing }
| "begin" SeqExpr "end" { $2 }
| "begin" "end"         { VU (mergeLocated $1 $2) }
| '[' ExprSemiList MaybeSemi ']'  { List (mergeLocated $1 $4) (reverse $2) Nothing }

SimpleExprList :: { [Expr] }
: SimpleExpr                  { [$1] }
| SimpleExprList SimpleExpr   { $2 : $1 }

RecordExpr :: { [(String, Expr)] }
: LabelExprList               { $1 }

LabelExprList :: { [(String, Expr)] }
: LabelExpr                     { [$1] }
| LabelExpr ';' LabelExprList   { $1 : $3 }
| LabelExpr ';'                 { [$1] }

LabelExpr :: { (String,Expr) }
: LongIdent '=' Expr            { (getVal $1, $3) }

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

FunDef :: { Expr }
: "->" SeqExpr          { $2 }
| SimplePattern FunDef  { Lam (mergeLocated $1 $2) $1 $2 Nothing }

Value :: { Loc Value }
: string    { L (getSrcSpanMaybe $1) (VS (getSrcSpanMaybe $1) (read (getString $1))) }
| char      { L (getSrcSpanMaybe $1) (VC (getSrcSpanMaybe $1) (read (getChar $1))) }
| int       { L (getSrcSpanMaybe $1) (VI (getSrcSpanMaybe $1) (read (getInt $1))) }
| float     { L (getSrcSpanMaybe $1) (VD (getSrcSpanMaybe $1) (read (getFloat $1))) }
| "true"    { L (getSrcSpanMaybe $1) (VB (getSrcSpanMaybe $1) True) }
| "false"   { L (getSrcSpanMaybe $1) (VB (getSrcSpanMaybe $1) False) }

Literal :: { Loc Literal }
: string    { L (getSrcSpanMaybe $1) (LS (read (getString $1))) }
| char      { L (getSrcSpanMaybe $1) (LC (read (getChar $1))) }
| int       { L (getSrcSpanMaybe $1) (LI (read (getInt $1))) }
| float     { L (getSrcSpanMaybe $1) (LD (read (getFloat $1))) }
| "true"    { L (getSrcSpanMaybe $1) (LB True) }
| "false"   { L (getSrcSpanMaybe $1) (LB False) }

SignedLiteral :: { Loc Literal }
: Literal   { $1 }
| '-' int   { L (mergeLocated $1 $2) (LI (negate (read (getInt $2)))) }
| '-' float { L (mergeLocated $1 $2) (LD (negate (read (getFloat $2)))) }
| '+' int   { L (mergeLocated $1 $2) (LI (read (getInt $2))) }
| '+' float { L (mergeLocated $1 $2) (LD (read (getFloat $2))) }

Subtractive :: { Loc Var }
: '-'          { L (getSrcSpanMaybe $1) "-" }
| "-."         { L (getSrcSpanMaybe $1) "-." }

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
: SimpleType2           %prec below_SHARP { $1 }
| '(' TypeCommaList ')' %prec below_SHARP { case $2 of { [a] -> a } }

SimpleType2 :: { Type }
: '\'' ident                       { TVar (getId $2) }
| LongIdent                        { tCon (getVal $1) }
| '(' ')'                          { tCon tUNIT }
| SimpleType2 LongIdent            { mkTApps (getVal $2) [$1] }
| '(' TypeCommaList ')' LongIdent  { mkTApps (getVal $4) (reverse $2) }

TypeCommaList :: { [Type] }
: Type                         { [$1] }
| TypeCommaList ',' Type       { $3 : $1 }

-- Misc

Label :: { String }
: ident              { getId $1 }

ValIdent :: { Loc Var }
: ident              { L (getSrcSpanMaybe $1) (getId $1) }
| '(' Operator ')'   { L (mergeLocated $1 $3) (getVal $2) }

ValLongIdent :: { Loc Var }
: ValIdent                  { $1 }
| ModLongIdent '.' ValIdent { L (mergeLocated $1 $3) (getVal $1 ++ "." ++ getVal $3) }

LongIdent :: { Loc Var }
: ident                  { L (getSrcSpanMaybe $1) (getId $1) }
| ModLongIdent '.' ident { L (mergeLocated $1 $3) (getVal $1 ++ "." ++ getId $3) }

ConLongIdent :: { Loc Var }
: ModLongIdent %prec below_DOT { $1 }
| '[' ']'                      { L (mergeLocated $1 $2) "[]" }
| '(' ')'                      { L (mergeLocated $1 $2) "()" }

ModLongIdent :: { Loc Var }
: con                    { L (getSrcSpanMaybe $1) (getCon $1) }
| ModLongIdent '.' con   { L (mergeLocated $1 $3) (getVal $1 ++ "." ++ getCon $3) }

Operator :: { Loc Var }
: infix0             { L (getSrcSpanMaybe $1) (getInfix0 $1) }
| infix1             { L (getSrcSpanMaybe $1) (getInfix1 $1) }
| infix2             { L (getSrcSpanMaybe $1) (getInfix2 $1) }
| infix3             { L (getSrcSpanMaybe $1) (getInfix3 $1) }
| infix4             { L (getSrcSpanMaybe $1) (getInfix4 $1) }
| '!'                { L (getSrcSpanMaybe $1) "!" }
| ":="               { L (getSrcSpanMaybe $1) ":=" }
| '+'                { L (getSrcSpanMaybe $1) "+" }
| "+."               { L (getSrcSpanMaybe $1) "+." }
| '-'                { L (getSrcSpanMaybe $1) "-" }
| "-."               { L (getSrcSpanMaybe $1) "-." }
| '*'                { L (getSrcSpanMaybe $1) "*" }
| '='                { L (getSrcSpanMaybe $1) "=" }


RecFlag :: { RecFlag }
: {- empty -} { NonRec }
| "rec"       { Rec }

MutFlag :: { MutFlag }
: {- empty -} { NonMut }
| "mutable"   { Mut }

MaybePipe :: { () }
: {- empty -}      { () }
| '|'              { () }

MaybeSemi :: { () }
: {- empty -}      { () }
| ';'              { () }

GetPosition :: { (Int, Int) }
: {- empty -}      {% getPosition }

{

locDecl :: (Int,Int) -> (Int,Int) -> (SrcSpan -> Decl) -> Decl
locDecl (sl,sc) (el,ec) f = f (SrcSpan sl sc el ec)

parseError :: LToken -> Alex a
parseError (LToken loc t) = do
    -- (line, column) <- getPosition
    alexError $ "unexpected token " ++ show t
      ++ " at line " ++ show (srcSpanStartLine loc)
      ++ ", column " ++ show (srcSpanStartCol loc)

safeParse parser s = runAlex s parser

parseTopForm = safeParse unsafeParseTopForm
parseExpr    = safeParse unsafeParseExpr
parseLiteral = safeParse unsafeParseLiteral
parsePattern = safeParse unsafeParsePattern
parseType    = safeParse unsafeParseType

}
