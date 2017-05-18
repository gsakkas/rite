
let pi = 4.0 *. (atan 1.0);;

type expr =
  | VarX
  | VarY
  | Neg of expr
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Smallest of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Neg e1 -> (eval (e1, x, y)) *. (-1.0)
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Smallest (e1,e2,e3) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then
        (if (eval (e1, x, y)) < (eval (e3, x, y))
         then eval (e1, x, y)
         else eval (e3, x, y))
      else
        if (eval (e2, x, y)) < (eval (e3, x, y))
        then eval (e2, x, y)
        else eval (e3, x, y)
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

let _ = eval ((Smallest (VarX, VarY, (Neg VarX))), 1, 2);;
