
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
  | Thresh (w,t,u,z) -> if (eval w) < (eval t) then eval u else eval z
  | Times (t,u) -> (eval t) * (eval u)
  | Average (t,u) -> ((eval t) * (eval u)) / 2
  | Cosine t -> cos (pi * (eval t))
  | Sine t -> sin (pi * (eval t))
  | VarX  -> x
  | VarY  -> y;;
