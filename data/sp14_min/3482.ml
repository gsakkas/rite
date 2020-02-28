
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr0 -> sin (eval (expr0, x, y))
  | Cosine expr0 -> cos (eval (expr0, x, y))
  | Average (expr0,expr1) ->
      ((eval (expr0, x, y)) +. (eval (expr1, x, y))) /. 2
  | Times (expr0,expr1) -> (eval (expr0, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr0,expr1,expr2,expr3) ->
      (match (eval (expr0, x, y)) < (eval (expr1, x, y)) with
       | true  -> eval (expr2, x, y)
       | false  -> eval (expr3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr0 -> sin (eval (expr0, x, y))
  | Cosine expr0 -> cos (eval (expr0, x, y))
  | Average (expr0,expr1) ->
      ((eval (expr0, x, y)) +. (eval (expr1, x, y))) /. 2.
  | Times (expr0,expr1) -> (eval (expr0, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr0,expr1,expr2,expr3) ->
      (match (eval (expr0, x, y)) < (eval (expr1, x, y)) with
       | true  -> eval (expr2, x, y)
       | false  -> eval (expr3, x, y));;

*)

(* changed spans
(18,57)-(18,58)
2.0
LitG

*)

(* type error slice
(18,7)-(18,58)
(18,57)-(18,58)
*)
