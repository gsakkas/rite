
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
  | Sine s -> "sin(pi*" ^ (exprToString s ")");;


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
  | Sine s -> "sin(pi*" ^ ((exprToString s) ^ ")");;

*)

(* changed spans
(15,27)-(15,47)
exprToString s ^ ")"
AppG [AppG [EmptyG],LitG]

*)

(* type error slice
(11,4)-(15,49)
(11,22)-(15,47)
(12,3)-(15,47)
(13,14)-(13,17)
(15,27)-(15,47)
(15,28)-(15,40)
*)
