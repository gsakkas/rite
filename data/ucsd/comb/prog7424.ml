
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec exprToString e =
  match e with
  | VarX  -> e
  | Sine e' -> sin (pi * e')
  | Cosine e' -> cos (pi * e')
  | Average (a,b) -> (a + b) / 2
  | Times (a,b) -> a * b
  | Thresh (a,b,c,d) -> (a < (b ?c) : d);;
