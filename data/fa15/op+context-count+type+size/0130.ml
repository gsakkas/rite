
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
  | varX -> x
  | varY -> y
  | Sine t -> sin (pi *. (eval t x y))
  | Cosine t -> cos (pi *. (eval t x y))
  | Average (t,s) -> ((eval t x y) +. (eval s x y)) /. 2;;


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
  | varX -> x
  | varY -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0;;

*)

(* changed spans
(17,27)-(17,37)
(17,32)-(17,33)
(18,29)-(18,39)
(18,34)-(18,35)
(19,24)-(19,34)
(19,29)-(19,30)
(19,40)-(19,50)
(19,45)-(19,46)
(19,56)-(19,57)
*)

(* type error slice
(13,4)-(19,59)
(13,15)-(19,57)
(14,3)-(19,57)
(17,27)-(17,31)
(17,27)-(17,37)
(17,32)-(17,33)
(19,24)-(19,57)
(19,56)-(19,57)
*)
