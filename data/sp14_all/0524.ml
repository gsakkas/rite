
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
  | Sine i -> sin (pi * (eval (i, x, y)))
  | Cosine i -> cos (pi * (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) + (eval (i2, x, y))) / 2.0;;


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
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0;;

*)

(* changed spans
(17,19)-(17,42)
pi *. eval (i , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,21)-(18,44)
pi *. eval (i , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,24)-(19,69)
(eval (i1 , x , y) +. eval (i2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(17,15)-(17,18)
(17,15)-(17,42)
(17,19)-(17,42)
(17,20)-(17,22)
(18,17)-(18,20)
(18,17)-(18,44)
(18,21)-(18,44)
(18,22)-(18,24)
(19,24)-(19,69)
(19,66)-(19,69)
*)
