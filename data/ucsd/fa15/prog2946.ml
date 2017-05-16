
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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> Cosine (pi *. (eval (e, x, y)))
  | Average (x,y) -> ((eval (e, x, y)) +. (eval (e, x, y))) / 2.0
  | Times (x,y) -> (eval (e, x, y)) *. (eval (e, x, y))
  | Thresh (w,x,y,z) ->
      (((eval (e, x, y)) *. (eval (e, x, y))) *. (eval (e, x, y))) *.
        (eval (e, x, y) uncomment after implementing eval);;
