
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
(12,3)-(18,49)
(15,15)-(15,24)
(15,15)-(15,43)
(15,25)-(15,37)
(16,17)-(16,26)
(16,17)-(16,45)
(16,27)-(16,39)
(17,20)-(17,24)
(17,20)-(17,72)
(17,25)-(17,37)
(17,38)-(17,39)
(17,44)-(17,56)
(17,44)-(17,72)
(17,57)-(17,58)
(17,59)-(17,62)
(17,67)-(17,68)
(17,69)-(17,72)
(18,16)-(18,49)
(18,29)-(18,30)
(18,31)-(18,34)
(18,35)-(18,47)
(18,48)-(18,49)
*)

(* type error slice
(15,15)-(15,24)
(15,15)-(15,43)
(16,17)-(16,26)
(16,17)-(16,45)
(17,20)-(17,24)
(17,20)-(17,39)
(17,44)-(17,56)
(17,44)-(17,62)
(17,44)-(17,72)
(17,67)-(17,68)
(17,67)-(17,72)
(18,16)-(18,28)
(18,16)-(18,49)
*)
