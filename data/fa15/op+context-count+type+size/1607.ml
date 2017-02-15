
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
(28,20)-(28,61)
(28,27)-(28,31)
(28,36)-(28,56)
(28,43)-(28,47)
(28,52)-(28,55)
(28,60)-(28,61)
(30,12)-(30,17)
(30,22)-(30,58)
(30,23)-(30,26)
(30,27)-(30,57)
(30,28)-(30,40)
(30,29)-(30,33)
(30,44)-(30,56)
(30,45)-(30,49)
(30,50)-(30,55)
*)

(* type error slice
(16,2)-(30,58)
(16,2)-(30,58)
(16,2)-(30,58)
(16,2)-(30,58)
(16,2)-(30,58)
(19,17)-(19,20)
(19,17)-(19,48)
(19,28)-(19,47)
(19,29)-(19,33)
(19,34)-(19,46)
(28,20)-(28,57)
(28,20)-(28,61)
(28,20)-(28,61)
(28,21)-(28,32)
(28,22)-(28,26)
(28,27)-(28,31)
(28,37)-(28,48)
(28,38)-(28,42)
(28,43)-(28,47)
(30,6)-(30,18)
(30,7)-(30,11)
(30,12)-(30,17)
(30,22)-(30,58)
(30,23)-(30,26)
(30,27)-(30,57)
(30,28)-(30,40)
(30,29)-(30,33)
(30,34)-(30,39)
(30,44)-(30,56)
(30,45)-(30,49)
(30,50)-(30,55)
*)
