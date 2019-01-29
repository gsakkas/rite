
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Nom of expr* expr* expr
  | Squa of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr,expr1) ->
      ((eval (expr, x, y)) +. (eval (expr1, x, y))) /. 2.
  | Times (expr,expr1) -> (eval (expr, x, y)) *. (eval (expr1, x, y))
  | Squa expr ->
      let res = eval (expr, x, y) in res /. ((abs_float res) +. 1.0)
  | Nom (expr,expr1,expr2) ->
      let (r1,r2,r3) =
        ((eval (expr, x, y)), (eval (expr1, x, y)), (eval (expr2, x, y))) in
      ((r1 +. r2) +. r3) /.
        ((((abs_float r1) +. (abs_float r2)) +. (abs_float r3)) +. 1)
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
  | Thresh of expr* expr* expr* expr
  | Nom of expr* expr* expr
  | Squa of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr,expr1) ->
      ((eval (expr, x, y)) +. (eval (expr1, x, y))) /. 2.
  | Times (expr,expr1) -> (eval (expr, x, y)) *. (eval (expr1, x, y))
  | Squa expr ->
      let res = eval (expr, x, y) in res /. ((abs_float res) +. 1.0)
  | Nom (expr,expr1,expr2) ->
      let (r1,r2,r3) =
        ((eval (expr, x, y)), (eval (expr1, x, y)), (eval (expr2, x, y))) in
      ((r1 +. r2) +. r3) /.
        ((((abs_float r1) +. (abs_float r2)) +. (abs_float r3)) +. 1.)
  | Thresh (expr,expr1,expr2,expr3) ->
      if (eval (expr, x, y)) < (eval (expr1, x, y))
      then eval (expr2, x, y)
      else eval (expr3, x, y);;

*)

(* changed spans
(30,67)-(30,68)
1.0
LitG

*)
