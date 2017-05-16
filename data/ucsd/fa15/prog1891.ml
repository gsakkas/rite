
let pi = 4.0 *. (atan 1.0);;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Expn of expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine b -> sin (pi *. (eval (b, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Expn (a,b) -> (eval (a, x, y)) ** (eval (b, x, y))
  | _ -> 0.0;;

let _ = eval (Expn (2.0, 2.0));;
