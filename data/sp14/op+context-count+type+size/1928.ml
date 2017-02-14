
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
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval x1) +. (eval x2)) /. 2.;;


(* fix

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
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.;;

*)

(* changed spans
(19,31)-(19,33)
(19,39)-(19,46)
(19,44)-(19,46)
*)

(* type error slice
(14,3)-(19,54)
(14,3)-(19,54)
(17,28)-(17,32)
(17,28)-(17,42)
(17,34)-(17,42)
(19,26)-(19,30)
(19,26)-(19,33)
(19,31)-(19,33)
(19,39)-(19,43)
(19,39)-(19,46)
(19,44)-(19,46)
*)
