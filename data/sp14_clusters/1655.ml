
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
(15,15)-(15,19)
"Sin("
LitG

(15,22)-(15,39)
(^)
VarG

(15,22)-(15,39)
exprToString e1 ^ ")"
AppG [AppG [EmptyG],LitG]

*)
