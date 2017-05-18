
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
  | Sine expr -> (sin pi) * (eval expr)
  | Cosine expr -> (cos pi) * (eval expr)
  | Average (expr1,expr2) -> ((eval expr1) + (eval expr2)) / 2
  | Times (expr1,expr2) -> (eval expr1) * (eval expr2)
  | Thresh (expr1,expr2,expr3,expr4) ->
      ((eval expr1) < (eval expr2 ?eval expr3) : eval expr4);;
