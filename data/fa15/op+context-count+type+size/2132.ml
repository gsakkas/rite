
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
  | Sine e -> "sin(pi*" exprToString e ")"
  | Cosine e -> "cos(pi*" exprToString e ")"
  | Average e -> (("((" exprToString e), ((exprToString e ")") / (2 ")")))
  | Times e -> exprToString e "*" exprToString e;;


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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y));;

*)

(* changed spans
(12,2)-(18,48)
(15,14)-(15,23)
(15,14)-(15,42)
(15,24)-(15,36)
(16,16)-(16,25)
(16,16)-(16,44)
(16,26)-(16,38)
(17,17)-(17,74)
(17,19)-(17,23)
(17,24)-(17,36)
(17,37)-(17,38)
(17,41)-(17,73)
(17,43)-(17,55)
(17,56)-(17,57)
(17,58)-(17,61)
(17,66)-(17,67)
(17,68)-(17,71)
(18,15)-(18,48)
(18,28)-(18,29)
(18,30)-(18,33)
(18,34)-(18,46)
(18,47)-(18,48)
*)

(* type error slice
(15,14)-(15,23)
(15,14)-(15,42)
(16,16)-(16,25)
(16,16)-(16,44)
(17,18)-(17,39)
(17,19)-(17,23)
(17,41)-(17,73)
(17,42)-(17,62)
(17,43)-(17,55)
(17,65)-(17,72)
(17,66)-(17,67)
(18,15)-(18,27)
(18,15)-(18,48)
*)
