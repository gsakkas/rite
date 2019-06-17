
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with | VarX  -> "VarX" | VarY  -> "VarY" | Sine e1 -> sin e1;;


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
  match e with | VarX  -> "x" | VarY  -> "y" | Sine e1 -> "sin";;

*)

(* changed spans
(12,27)-(12,33)
"x"
LitG

(12,45)-(12,51)
"y"
LitG

(12,65)-(12,71)
"sin"
LitG

*)

(* type error slice
(12,3)-(12,71)
(12,65)-(12,68)
(12,65)-(12,71)
(12,69)-(12,71)
*)
