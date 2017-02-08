
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin ((eval e1), x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin (eval (e1, x, y));;

*)

(* changed spans
(12,61)-(12,75)
(12,66)-(12,68)
*)

(* type error slice
(11,4)-(12,78)
(11,15)-(12,75)
(12,3)-(12,75)
(12,55)-(12,58)
(12,55)-(12,75)
(12,61)-(12,65)
(12,61)-(12,68)
(12,61)-(12,75)
(12,66)-(12,68)
*)
