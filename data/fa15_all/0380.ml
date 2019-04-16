
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
(17,26)-(17,38)
eval (t , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,28)-(18,40)
eval (t , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,23)-(19,35)
eval (t , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,39)-(19,51)
eval (s , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,56)-(19,57)
2.0
LitG

*)

(* type error slice
(13,4)-(19,59)
(13,15)-(19,57)
(14,3)-(19,57)
(17,26)-(17,38)
(17,27)-(17,31)
(17,32)-(17,33)
(19,22)-(19,57)
(19,56)-(19,57)
*)
