
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let c1 () = failwith "to be implemented";;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin (eval (s1, x, y))
  | Cosine c1 -> cos (eval (c1, x, y))
  | Average (a1,a2) -> ((eval (a1, x, y)) +. (eval (a2, x, y))) /. 2;;
