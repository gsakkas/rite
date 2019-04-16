
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
  | Sine expr -> sin (pi * (eval (expr, x, y)))
  | Cosine expr -> cos (pi * (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) + (eval (expr2, x, y))) / 2
  | Times (expr1,expr2) -> (eval (expr1, x, y)) * (eval (expr2, x, y));;


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
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2.0
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y));;

*)

(* changed spans
(17,22)-(17,48)
pi *. eval (expr , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,24)-(18,50)
pi *. eval (expr , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(20,7)-(20,56)
(eval (expr1 , x , y) +. eval (expr2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(21,28)-(21,71)
eval (expr1 , x , y) *. eval (expr2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(17,18)-(17,21)
(17,18)-(17,48)
(17,22)-(17,48)
(17,23)-(17,25)
(18,20)-(18,23)
(18,20)-(18,50)
(18,24)-(18,50)
(18,25)-(18,27)
*)
