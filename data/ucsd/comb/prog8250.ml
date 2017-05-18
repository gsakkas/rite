
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | TowerInv of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Power (a,b) ->
      if ((a < 1.0) && (a > (-1.0))) || ((b < 1.0) && (b > (-1.0)))
      then 0.5
      else a **. b
  | TowerInv (a,b,c) ->
      if ((a < 1.0) && (a > (-1.0))) || ((b < 1.0) && (b > (-1.0)))
      then 0.5
      else 1 /. ((eval (a, x, y)) ** ((eval (b, x, y)) ** (eval (c, x, y))));;
