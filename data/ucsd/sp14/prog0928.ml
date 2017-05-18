
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
  | VarX  -> 1.0
  | VarY  -> 1.0
  | Sine e1 -> sin (2 * (eval (e1, x, y)));;
