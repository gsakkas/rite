
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
  | SumInts expr -> ((eval (expr, x, y)) *. ((eval (expr, x, y)) +. 1.0)) / 2
  | Power (expr1,expr2,expr3) ->
      (eval expr1) ** (abs ((eval (expr1, x, y)) +. (eval (expr2, x, y))));;


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
(28,21)-(28,78)
(eval (expr , x , y) *. (eval (expr , x , y) +. 1.0)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(30,13)-(30,18)
(expr1 , x , y)
TupleG [VarG,VarG,VarG]

(30,23)-(30,75)
abs_float (eval (expr2 , x , y) +. eval (expr3 , x , y))
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(16,3)-(30,75)
(19,18)-(19,21)
(19,18)-(19,49)
(19,29)-(19,48)
(19,30)-(19,34)
(19,35)-(19,47)
(28,21)-(28,74)
(28,21)-(28,78)
(30,7)-(30,19)
(30,8)-(30,12)
(30,13)-(30,18)
(30,23)-(30,75)
(30,24)-(30,27)
(30,28)-(30,74)
*)
