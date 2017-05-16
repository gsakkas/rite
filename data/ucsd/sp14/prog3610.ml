
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | DivAdd of expr* expr* expr* expr
  | TriMult of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (a1,a2) -> ((eval (a1, x, y)) +. (eval (a2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y)
  | DivAdd (da1,da2,da3,da4) ->
      if (eval (da1, x, y)) < (eval (da2, x, y))
      then (eval (da1, x, y)) /. (eval (da2, x, y))
      else
        if (eval (da1, x, y)) > (eval (da2, x, y))
        then (eval (da3, x, y)) < (eval (da4, x, y))
  | TriMult (tm1,tm2,tm3) ->
      ((eval (tm1, x, y)) *. (eval (tm2, x, y))) *. (eval (tm3, x, y));;
