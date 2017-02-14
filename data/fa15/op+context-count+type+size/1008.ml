
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" exprToString a ")"
  | Cosine a -> "cos(pi*" exprToString a ")"
  | Average (a,b) -> "((" exprToString a "+" exprToString b ")/2)"
  | Times (a,b) -> exprToString a "*" exprToString b
  | Thresh (a,b,c,d) ->
      "(" exprToString a "<" exprToString b "?" exprToString c ":"
        exprToString d ")";;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))));;

*)

(* changed spans
(15,14)-(15,23)
(15,14)-(15,42)
(15,24)-(15,36)
(16,16)-(16,25)
(16,16)-(16,44)
(16,26)-(16,38)
(17,21)-(17,25)
(17,21)-(17,66)
(17,26)-(17,38)
(17,41)-(17,44)
(17,45)-(17,57)
(18,19)-(18,31)
(18,19)-(18,52)
(18,32)-(18,33)
(18,34)-(18,37)
(18,38)-(18,50)
(18,51)-(18,52)
(20,6)-(20,9)
(20,6)-(21,26)
(20,10)-(20,22)
(20,25)-(20,28)
(20,29)-(20,41)
(20,42)-(20,43)
(20,44)-(20,47)
(20,48)-(20,60)
(20,61)-(20,62)
(20,63)-(20,66)
(21,8)-(21,20)
(21,21)-(21,22)
(21,23)-(21,26)
*)

(* type error slice
(15,14)-(15,23)
(15,14)-(15,42)
(16,16)-(16,25)
(16,16)-(16,44)
(17,21)-(17,25)
(17,21)-(17,66)
(18,19)-(18,31)
(18,19)-(18,52)
(18,38)-(18,50)
(20,6)-(20,9)
(20,6)-(21,26)
*)
