
let pi = 4.0 *. (atan 1.0);;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Poly of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine d -> sin ((eval (d, x, y)) *. pi)
  | Cosine d -> cos ((eval (d, x, y)) *. pi)
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if a < b then eval (a_less, x, y) else eval (b_less, x, y)
  | Square d -> let z = eval (d, x, y) in z *. z
  | Poly (a,b,c,d) ->
      (((eval (a, x, y)) *. (eval ((Square d), x, y))) +.
         ((eval (b, x, y)) *. (eval (d, x, y))))
        +. (eval (c, x, y));;

let _ = eval ((Poly (3, 5, 2, 6)), 1, 1);;
