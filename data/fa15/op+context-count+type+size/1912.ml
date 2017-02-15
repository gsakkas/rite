
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
      "((" ^
        ((exprToString e) ^ ("+" ^ ((exprToString e) ^ (")" / (2 ")")))))
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
(19,23)-(19,24)
(19,50)-(19,51)
(19,55)-(19,70)
(19,56)-(19,59)
(19,62)-(19,69)
(19,63)-(19,64)
(19,65)-(19,68)
(20,19)-(20,52)
(20,32)-(20,33)
(20,34)-(20,37)
(20,38)-(20,50)
(20,51)-(20,52)
*)

(* type error slice
(15,26)-(15,50)
(15,27)-(15,43)
(15,28)-(15,40)
(15,44)-(15,45)
(19,35)-(19,71)
(19,53)-(19,54)
(19,55)-(19,70)
(19,55)-(19,70)
(19,56)-(19,59)
(19,62)-(19,69)
(19,63)-(19,64)
(20,19)-(20,31)
(20,19)-(20,52)
*)
