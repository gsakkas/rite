
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
  | Sine e -> sin (pi * e)
  | Cosine e -> cos (pi * e)
  | Average (e1,e2) -> (e1 + e2) / 2
  | Times (e1,e2) -> e1 * e2
  | Thresh (a,b,a_less,b_less) -> a < (b ?a_less:b_less);;
