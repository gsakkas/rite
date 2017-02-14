
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
(15,15)-(15,40)
(15,23)-(15,40)
*)

(* type error slice
(11,3)-(15,42)
(11,21)-(15,40)
(12,2)-(15,40)
(12,2)-(15,40)
(13,13)-(13,16)
(15,15)-(15,20)
(15,15)-(15,40)
(15,15)-(15,40)
(15,15)-(15,40)
(15,23)-(15,40)
(15,24)-(15,36)
*)
