
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
  | VarX  -> "VarX"
  | VarY  -> "VarY"
  | Sine e1 -> sin (exprToString e1);;


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
(13,13)-(13,19)
(14,13)-(14,19)
(15,15)-(15,18)
(15,15)-(15,36)
(15,19)-(15,36)
*)

(* type error slice
(12,2)-(15,36)
(12,2)-(15,36)
(13,13)-(13,19)
(15,15)-(15,18)
(15,15)-(15,36)
*)
