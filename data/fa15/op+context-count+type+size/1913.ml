
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
      "((" ^ ((exprToString e) ^ ("+" ^ ((exprToString e ")") / (2 ")"))))
  | Times (x,y) -> exprToString e "*" exprToString e;;


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
(18,28)-(18,29)
(18,40)-(18,72)
(18,42)-(18,54)
(18,55)-(18,56)
(18,57)-(18,60)
(18,64)-(18,71)
(18,65)-(18,66)
(18,67)-(18,70)
(19,19)-(19,52)
(19,32)-(19,33)
(19,34)-(19,37)
(19,38)-(19,50)
(19,51)-(19,52)
*)

(* type error slice
(15,26)-(15,50)
(15,27)-(15,43)
(15,28)-(15,40)
(15,44)-(15,45)
(18,33)-(18,73)
(18,38)-(18,39)
(18,40)-(18,72)
(18,41)-(18,61)
(18,42)-(18,54)
(18,64)-(18,71)
(18,65)-(18,66)
(19,19)-(19,31)
(19,19)-(19,52)
*)
