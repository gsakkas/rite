
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
  | Sine e0 -> sin (pi * (eval e0))
  | Cosine e1 -> cos (eval e1)
  | Average (e2,e3) -> ((eval e2) + (eval e3)) / 2
  | Times (e4,e5) -> (eval e4) * (eval e5)
  | Thresh (e6,e7,e8,e9) ->
      if (eval e6) < (eval e7) then eval e8 else eval e9;;
