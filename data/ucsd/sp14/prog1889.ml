
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
  | Sine u -> sin (pi *. (eval u))
  | Cosine u -> cos (pi *. (eval u))
  | Average (u,v) -> ((eval u) +. (eval v)) /. 2
  | Times (u,v) -> (eval u) *. (eval v)
  | Thresh (s,t,u,v) -> if (eval s) < (eval t) then eval u else eval v;;
