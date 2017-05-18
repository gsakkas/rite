
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
  | Sine a -> sin (pi * (eval (a, x, y)))
  | Cosine a -> cos (pi * (eval a))
  | Average (a,b) -> ((eval a) + (eval b)) / 2
  | Times (a,b) -> (eval a) * (eval b)
  | Thresh (a,b,c,d) -> ((eval a) < (eval b ?eval c) : eval d);;
