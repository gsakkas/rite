
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
  | Sine e1 -> "sin" + (exprToString e1);;


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
(15,16)-(15,41)
"sin"
LitG

*)

(* type error slice
(11,4)-(15,43)
(11,22)-(15,41)
(12,3)-(15,41)
(13,14)-(13,17)
(15,16)-(15,21)
(15,16)-(15,41)
(15,24)-(15,41)
(15,25)-(15,37)
*)
