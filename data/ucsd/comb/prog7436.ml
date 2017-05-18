
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> e
  | VarY  -> e
  | Sine e' -> sin (3.142 * (exprToString e'))
  | Cosine e' -> cos (3.142 * (exprToString e'))
  | Average (a,b) -> ((exprToString a) + (exprToString b)) / 2
  | Times (a,b) -> a * b
  | Thresh (a,b,c,d) -> (a < (b ?c) : d);;
