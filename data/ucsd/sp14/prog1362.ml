
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
  | Sine m -> sin (pi *. (eval (m, x, y)))
  | Cosine m -> cos (pi *. (eval (m, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) / 2.;;
