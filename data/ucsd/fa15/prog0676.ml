
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
  | Sine e -> sin (pi *. (eval e))
  | Cosine e -> cos (pi *. (eval ee))
  | Average (e1,e2) ->
      (((eval e) +. (eval e)) /. 2) (((eval e) +. (eval e)) /. 2)
  | Times (e1,e2) -> (eval e) *. (eval e)
  | Thresh (e1,e2,e3,e4) -> ((eval e1) < (eval e2 ?eval e3) : eval e4);;
