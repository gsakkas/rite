
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
      ((eval (expr, x, y)) *. ((eval (expr, x, y)) +. 1.0)) /. 2
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
(29,63)-(29,64)
(31,12)-(31,17)
(31,22)-(31,74)
(31,23)-(31,26)
(31,35)-(31,40)
(31,59)-(31,64)
*)

(* type error slice
(16,2)-(31,74)
(19,28)-(19,47)
(19,29)-(19,33)
(19,34)-(19,46)
(29,6)-(29,64)
(29,63)-(29,64)
(31,6)-(31,18)
(31,7)-(31,11)
(31,12)-(31,17)
(31,22)-(31,74)
(31,23)-(31,26)
(31,27)-(31,73)
*)
