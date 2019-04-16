
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e -> pi * e;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | VarX  -> x | VarY  -> y;;

*)

(* changed spans
(14,3)-(14,60)
match e with
| VarX -> x
| VarY -> y
CaseG VarG (fromList [(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(14,3)-(14,60)
(14,54)-(14,56)
(14,54)-(14,60)
(14,59)-(14,60)
*)
