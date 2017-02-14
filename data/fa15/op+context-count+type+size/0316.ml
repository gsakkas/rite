
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
(12,26)-(12,32)
(12,44)-(12,50)
(12,64)-(12,67)
(12,64)-(12,70)
(12,68)-(12,70)
*)

(* type error slice
(12,2)-(12,70)
(12,64)-(12,67)
(12,64)-(12,70)
(12,68)-(12,70)
*)
