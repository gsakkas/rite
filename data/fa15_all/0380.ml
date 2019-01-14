
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
eval (t , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(17,31)-(17,32)
(t , x , y)
TupleG (fromList [VarG])

(18,27)-(18,39)
eval (t , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,33)-(18,34)
(t , x , y)
TupleG (fromList [VarG])

(19,22)-(19,34)
eval (t , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,28)-(19,29)
(t , x , y)
TupleG (fromList [VarG])

(19,38)-(19,50)
eval (s , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,44)-(19,45)
(s , x , y)
TupleG (fromList [VarG])

(19,55)-(19,56)
2.0
LitG

*)
