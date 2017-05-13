
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
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | Times (t,u) -> (eval (t, x, y)) * (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) * (eval (u, x, y))) / 2
  | Cosine t -> cos (pi * (eval (t, x, y)))
  | Sine t -> sin (pi * (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;
