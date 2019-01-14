
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Square of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine m -> sin (pi *. (eval (m, x, y)))
  | Cosine m -> cos (pi *. (eval (m, x, y)))
  | Square m -> (eval (m, x, y)) ** 2
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) /. 2.
  | Times (m,n) -> (eval (m, x, y)) *. (eval (n, x, y))
  | Thresh (m,n,o,p) ->
      if (eval (m, x, y)) < (eval (n, x, y))
      then eval (o, x, y)
      else eval (p, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Square of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine m -> sin (pi *. (eval (m, x, y)))
  | Cosine m -> cos (pi *. (eval (m, x, y)))
  | Square m -> (eval (m, x, y)) ** 2.0
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) /. 2.
  | Times (m,n) -> (eval (m, x, y)) *. (eval (n, x, y))
  | Thresh (m,n,o,p) ->
      if (eval (m, x, y)) < (eval (n, x, y))
      then eval (o, x, y)
      else eval (p, x, y);;

*)

(* changed spans
(20,36)-(20,37)
2.0
LitG

*)
