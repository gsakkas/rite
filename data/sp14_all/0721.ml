
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
  | Average (expr,expr1) ->
      ((eval (expr, x, y)) +. (eval (expr1, x, y))) /. 2
  | Times (expr,expr1) -> (eval (expr, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr,expr1,expr2,expr3) ->
      if (eval (expr, x, y)) < (eval (expr1, x, y))
      then eval (expr2, x, y)
      else eval (expr3, x, y);;


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
  | Average (expr,expr1) -> (eval (expr, x, y)) +. (eval (expr1, x, y))
  | Times (expr,expr1) -> (eval (expr, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr,expr1,expr2,expr3) ->
      if (eval (expr, x, y)) < (eval (expr1, x, y))
      then eval (expr2, x, y)
      else eval (expr3, x, y);;

*)

(* changed spans
(20,7)-(20,57)
eval (expr , x , y) +. eval (expr1 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(20,7)-(20,57)
(20,56)-(20,57)
*)
