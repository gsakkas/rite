
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
(18,29)-(18,30)
(18,43)-(18,55)
(18,43)-(18,71)
(18,56)-(18,57)
(18,58)-(18,61)
(18,66)-(18,67)
(18,66)-(18,71)
(18,68)-(18,71)
(19,20)-(19,53)
(19,33)-(19,34)
(19,35)-(19,38)
(19,39)-(19,51)
(19,52)-(19,53)
*)

(* type error slice
(15,29)-(15,41)
(15,29)-(15,43)
(15,29)-(15,50)
(15,45)-(15,46)
(18,35)-(18,71)
(18,39)-(18,40)
(18,43)-(18,55)
(18,43)-(18,61)
(18,43)-(18,71)
(18,66)-(18,67)
(18,66)-(18,71)
(19,20)-(19,32)
(19,20)-(19,53)
*)
