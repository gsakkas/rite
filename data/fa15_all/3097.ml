
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SumInts of expr
  | Power of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2.0
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y))
  | Thresh (expr1,expr2,expr3,expr4) ->
      if (eval (expr1, x, y)) < (eval (expr2, x, y))
      then eval (expr3, x, y)
      else eval (expr4, x, y)
  | SumInts expr -> ((eval expr) *. ((eval expr) +. 1.0)) / 2
  | Power (expr1,expr2,expr3) ->
      (eval expr1) ** (abs ((eval expr1) +. (eval expr2)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SumInts of expr
  | Power of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2.0
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y))
  | Thresh (expr1,expr2,expr3,expr4) ->
      if (eval (expr1, x, y)) < (eval (expr2, x, y))
      then eval (expr3, x, y)
      else eval (expr4, x, y)
  | SumInts expr ->
      ((eval (expr, x, y)) *. ((eval (expr, x, y)) +. 1.0)) /. 2.0
  | Power (expr1,expr2,expr3) ->
      (eval (expr1, x, y)) **
        (abs_float ((eval (expr2, x, y)) +. (eval (expr3, x, y))));;

*)

(* changed spans
(28,21)-(28,62)
(eval (expr , x , y) *. (eval (expr , x , y) +. 1.0)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(30,13)-(30,18)
(expr1 , x , y)
TupleG [VarG,VarG,VarG]

(30,23)-(30,59)
abs_float (eval (expr2 , x , y) +. eval (expr3 , x , y))
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(16,3)-(30,59)
(19,18)-(19,21)
(19,18)-(19,49)
(19,29)-(19,48)
(19,30)-(19,34)
(19,35)-(19,47)
(28,21)-(28,58)
(28,21)-(28,62)
(28,22)-(28,33)
(28,23)-(28,27)
(28,28)-(28,32)
(28,38)-(28,49)
(28,39)-(28,43)
(28,44)-(28,48)
(30,7)-(30,19)
(30,8)-(30,12)
(30,13)-(30,18)
(30,23)-(30,59)
(30,24)-(30,27)
(30,28)-(30,58)
(30,29)-(30,41)
(30,30)-(30,34)
(30,35)-(30,40)
(30,45)-(30,57)
(30,46)-(30,50)
(30,51)-(30,56)
*)
