
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
  | Sine e -> sin (pi * e)
  | Cosine e -> cos (pi * e)
  | Average (x,y) -> (x +. y) /. 2.0
  | Times (x,y) -> x *. y
  | Thresh (e,f,g,h) -> failwith "sad";;
