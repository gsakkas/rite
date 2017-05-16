
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
  | buildX -> x
  | buildY -> y
  | Sine q -> sin (pi *. (eval (q, x, y)))
  | Cosine q -> cos (pi *. (eval (q, x, y)))
  | Average (e1,e2) -> (e1 +. e2) /. 2
  | buildTimes -> e1 *. e2
  | buildThresh -> if a < b then a_less else b_less;;
