
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
  | VarX  -> float_of_int x
  | VarY  -> float_of_int y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) + (eval (e2, x, y))) / 2;;


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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.;;

*)

(* changed spans
(15,14)-(15,26)
(15,14)-(15,28)
(16,14)-(16,26)
(16,14)-(16,28)
(19,26)-(19,40)
(19,26)-(19,60)
(19,26)-(19,67)
(19,66)-(19,67)
*)

(* type error slice
(14,3)-(19,67)
(14,3)-(19,67)
(15,14)-(15,26)
(15,14)-(15,28)
(17,20)-(17,40)
(17,27)-(17,31)
(17,27)-(17,40)
(19,26)-(19,30)
(19,26)-(19,40)
(19,26)-(19,60)
(19,26)-(19,60)
(19,26)-(19,67)
(19,46)-(19,50)
(19,46)-(19,60)
*)
