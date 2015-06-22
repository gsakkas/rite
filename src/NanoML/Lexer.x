{
{-# OPTIONS_GHC -fno-warn-tabs #-}
module NanoML.Lexer where

import Data.Char
}

%wrapper "monad"

$digit = 0-9
$alpha = [a-zA-Z]
$lower = [a-z]
$upper = [A-Z]
$symbol = [\! \$ \% \& \* \+ \- \. \/ \: \< \= \> \? \@ \^ \| \~]


tokens :-
  $white+       ;
  $digit+       { tokS TokInt }
  $digit+ \. $digit* { tokS (TokFloat . (++"0")) }

 "(*"           { nested_comment }

  \(            { tok TokLParen }
  \)            { tok TokRParen }
  \{            { tok TokLBrace }
  \}            { tok TokRBrace }
  \[            { tok TokLBrack }
  \]            { tok TokRBrack }
  (\-\>)        { tok TokArrow }
  \:            { tok TokColon }
  \:\:          { tok TokCons }
  \;            { tok TokSemi }
  \;\;          { tok TokSemiSemi }
  \[\]          { tok TokNil }
  \(\)          { tok TokUnit }

  \=            { tok TokEq }
  \*            { tok TokStar }
  \'            { tok TokTick }
  \-            { tok TokMinus }
  \-\.          { tok TokMinusDot }

--  (\=|\=\=)     { tok TokEq }
--  (\<\>|\!\=)   { tok TokNe }
--  \<            { tok TokLt }
--  \>            { tok TokGt }
--  \<\=          { tok TokLe }
--  \>\=          { tok TokGe }

  \_            { tok TokUnderscore }
  \,            { tok TokComma }

--  \+            { tok TokPlus }
--  \/            { tok TokDiv }
--  \-            { tok TokMinus }
--  \*            { tok TokStar }

  \&\&          { tok TokLAnd }
  \|\|          { tok TokLOr }
  \|            { tok TokPipe }
  \.            { tok TokDot }
  \.\[          { tok TokDotLBrack }

  "and"         { tok TokAnd }
  "as"          { tok TokAs }
  "begin"       { tok TokBegin }
  "else"        { tok TokElse }
  "end"         { tok TokEnd }
  "false"       { tok TokFalse }
  "fun"         { tok TokFun }
  "function"    { tok TokFunction }
  "if"          { tok TokIf }
  "in"          { tok TokIn }
  "let"         { tok TokLet }
  "match"       { tok TokMatch }
--  "mod"         { tok TokMod }
  "of"          { tok TokOf }
  "or"          { tok TokOr }
  "rec"         { tok TokRec }
  "then"        { tok TokThen }
  "true"        { tok TokTrue }
  "type"        { tok TokType }
  "when"        { tok TokWhen }
  "with"        { tok TokWith }

  [\= \< \> \| \& \$] $symbol* { tokS TokInfixOp0 }
  \!\=                         { tokS TokInfixOp0 }
  [\@ \^]             $symbol* { tokS TokInfixOp1 }
  [\+ \-]             $symbol* { tokS TokInfixOp2 }
  [\* \/ \%]          $symbol* { tokS TokInfixOp3 }
  "mod"                        { tokS TokInfixOp3 }
  \*\*                $symbol* { tokS TokInfixOp4 }


  ($lower | \_) [$alpha $digit \_ \']* { tokS TokId }
  ($upper | \_) [$alpha $digit \_ \']* { tokS TokCon }
  \" ($printable # [\"])* \" { tokS TokString }
  \' ($printable # [\']) \' { tokS TokChar }
  $printable { tokS TokUnknown }

{
tok :: Token -> AlexInput -> Int -> Alex Token
tok t _ _ = return t

tokS :: (String -> Token) -> AlexInput -> Int -> Alex Token
tokS t (_, _, _, str) len = return (t (take len str))

data Token
  = TokId String
  | TokCon String
  | TokString String
  | TokChar String
  | TokInt String
  | TokFloat String

  | TokLParen
  | TokRParen
  | TokLBrace
  | TokRBrace
  | TokLBrack
  | TokRBrack

  | TokAnd
  | TokAs
  | TokBegin
  | TokElse
  | TokEnd
  | TokFalse
  | TokFun
  | TokFunction
  | TokIf
  | TokIn
  | TokLet
  | TokMatch
  | TokMod
  | TokOf
  | TokOr
  | TokRec
  | TokThen
  | TokTrue
  | TokType
  | TokWhen
  | TokWith 

  | TokLAnd
  | TokLOr
  | TokTick
  | TokStar
  | TokPlus
  | TokMinus
  | TokMinusDot
  | TokArrow
  | TokDot
  | TokDotLBrack
  | TokDotDot
  | TokColon
  | TokComma
  | TokSemi
  | TokSemiSemi
  | TokEq
  | TokNe
  | TokLt
  | TokGt
  | TokLe
  | TokGe
  | TokUnderscore
  | TokPipe
  | TokCons
  | TokNil
  | TokUnit

  | TokInfixOp0 String
  | TokInfixOp1 String
  | TokInfixOp2 String
  | TokInfixOp3 String
  | TokInfixOp4 String

  | TokUnknown String
  | TokEOF
  deriving (Eq,Show)

nested_comment :: AlexInput -> Int -> Alex Token
nested_comment _ _ = do
  input <- alexGetInput
  go 1 input
  where go 0 input = do alexSetInput input; alexMonadScan
	go n input = do
          case alexGetByte input of
	    Nothing  -> err input
	    Just (c,input) -> do
              case chr (fromIntegral c) of
	    	'*' -> do
                  case alexGetByte input of
		    Nothing  -> err input
                    Just (41,input) -> go (n-1) input
                    Just (c,input)  -> go n input
	     	'\123' -> do
                  case alexGetByte input of
		    Nothing  -> err input
                    Just (c,input) | c == fromIntegral (ord '*') -> go (n+1) input
		    Just (c,input)   -> go n input
	    	c -> go n input
        err input = do alexSetInput input; lexError "error in nested comment"  

getPos :: AlexPosn -> (Int, Int)
getPos (AlexPn _ line column) = (line, column)

getPosition :: Alex (Int, Int)
getPosition = Alex $ \s -> Right (s, getPos . alex_pos $ s)

lexWrap :: (Token -> Alex a) -> Alex a
lexWrap cont = do
    tok <- alexMonadScan
    cont tok

lexError s = do
  (p,c,_,input) <- alexGetInput
  alexError (showPosn p ++ ": " ++ s ++
		   (if (not (null input))
		     then " before " ++ show (head input)
		     else " at end of file"))

alexEOF = return TokEOF

showPosn (AlexPn _ line col) = show line ++ ':': show col

alexScanTokens :: String -> Either String [Token]
alexScanTokens input = runAlex input gather
  where
  gather = do
    t <- alexMonadScan
    case t of
      TokEOF -> return [TokEOF]
      _      -> return . (t :) =<< gather
}
