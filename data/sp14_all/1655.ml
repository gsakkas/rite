
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
  | Sine e1 -> Sine ^ (exprToString e1);;


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
  | Sine e1 -> "Sin(" ^ ((exprToString e1) ^ ")");;

*)

(* changed spans
(15,16)-(15,20)
"Sin("
LitG

(15,23)-(15,40)
exprToString e1 ^ ")"
AppG [AppG [EmptyG],LitG]

*)

(* type error slice
(15,16)-(15,20)
(15,16)-(15,40)
(15,21)-(15,22)
*)
