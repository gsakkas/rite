
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
  | Sine x -> sin (pi *. (eval x))
  | Cosine x -> cos (pi *. (eval x))
  | Average (x1,x2) -> ((eval x1) +. (eval x2)) /. 2.;;
