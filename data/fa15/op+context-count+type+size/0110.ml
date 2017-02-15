
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
(17,25)-(17,37)
(17,31)-(17,32)
(18,27)-(18,39)
(18,33)-(18,34)
(19,22)-(19,34)
(19,28)-(19,29)
(19,38)-(19,50)
(19,44)-(19,45)
(19,55)-(19,56)
*)

(* type error slice
(13,3)-(19,58)
(13,14)-(19,56)
(14,2)-(19,56)
(17,25)-(17,37)
(17,26)-(17,30)
(17,31)-(17,32)
(19,21)-(19,56)
(19,55)-(19,56)
*)
