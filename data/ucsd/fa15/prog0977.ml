
let pi = 4.0 *. (atan 1.0);;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SumFromOneToExpr of expr
  | AverageCubes of expr* expr* expr;;

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
  | SumFromOneToExpr expr ->
      ((eval (expr, x, y)) *. ((eval (expr, x, y)) +. 1.0)) /. 2.0
  | AverageCubes (expr1,expr2,expr3) ->
      ((((eval (expr1, x, y)) ** 3.0) +. ((eval (expr2, x, y)) ** 3.0)) +.
         (((eval (expr1, x, y)) ** 3.0) /. 3.0))
        /. 3.0;;

let _ = eval ((AverageCubes (VarX, VarY, VarY)), 0.001, (-. 5));;
