
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
(15,13)-(15,25)
(15,13)-(15,27)
(16,13)-(16,25)
(16,13)-(16,27)
(19,23)-(19,62)
(19,23)-(19,66)
(19,24)-(19,41)
(19,65)-(19,66)
*)

(* type error slice
(14,2)-(19,66)
(14,2)-(19,66)
(15,13)-(15,25)
(15,13)-(15,27)
(17,18)-(17,42)
(17,25)-(17,41)
(17,26)-(17,30)
(19,23)-(19,62)
(19,23)-(19,62)
(19,23)-(19,66)
(19,24)-(19,41)
(19,25)-(19,29)
(19,44)-(19,61)
(19,45)-(19,49)
*)
