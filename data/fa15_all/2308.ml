
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
(19,24)-(19,25)
y
VarG

(19,51)-(19,52)
y
VarG

(19,56)-(19,71)
")/2)"
LitG

(20,20)-(20,53)
exprToString x ^ ("*" ^ exprToString y)
AppG [AppG [EmptyG],AppG [EmptyG,EmptyG]]

*)

(* type error slice
(15,27)-(15,51)
(15,28)-(15,44)
(15,29)-(15,41)
(15,45)-(15,46)
(19,36)-(19,72)
(19,54)-(19,55)
(19,56)-(19,71)
(19,57)-(19,60)
(19,63)-(19,70)
(19,64)-(19,65)
(20,20)-(20,32)
(20,20)-(20,53)
*)
