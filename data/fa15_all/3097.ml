
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
(eval (expr , x , y) *. (eval (expr , x , y) +. 1.0)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(28,27)-(28,31)
(expr , x , y)
TupleG (fromList [VarG])

(28,36)-(28,56)
x
VarG

(28,36)-(28,56)
y
VarG

(28,43)-(28,47)
(expr , x , y)
TupleG (fromList [VarG])

(28,52)-(28,55)
x
VarG

(28,52)-(28,55)
y
VarG

(28,60)-(28,61)
2.0
LitG

(30,12)-(30,17)
(expr1 , x , y)
TupleG (fromList [VarG])

(30,22)-(30,58)
x
VarG

(30,22)-(30,58)
y
VarG

(30,23)-(30,26)
abs_float
VarG

(30,34)-(30,39)
(expr2 , x , y)
TupleG (fromList [VarG])

(30,44)-(30,56)
expr2
VarG

(30,44)-(30,56)
x
VarG

(30,44)-(30,56)
y
VarG

(30,50)-(30,55)
(expr3 , x , y)
TupleG (fromList [VarG])

*)
