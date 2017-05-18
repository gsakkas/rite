
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
  | Sine e -> sin ((eval e), x, y)
  | Cosine e -> cos (pi * (eval e))
  | Average (e,e1) -> ((eval e) + (eval e1)) / 2
  | Times (e,e1) -> (eval e) * (eval e2)
  | Thresh (e,e2,e3,e4) -> (e < (e2 ?e3) : e4);;
