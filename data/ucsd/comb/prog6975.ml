
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
  | varX -> x
  | varY -> y
  | Sine t -> sin (pi *. t)
  | Cosine t -> cos (pi *. t)
  | Average (t,s) -> (t +. s) /. 2;;
