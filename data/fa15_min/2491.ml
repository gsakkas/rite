
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | TimesTimes of expr* expr* expr
  | Cube of expr
  | MultDivBy6 of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | TimesTimes (e1,e2,e3) ->
      ((eval (e1, x, y)) *. (eval (e2, x, y))) *. (eval (e3, x, y))
  | Cube e1 -> ((eval (e1, x, y)) *. (eval (e1, x, y))) *. (eval (e1, x, y))
  | MultDivBy6 (e1,e2) -> ((eval (e1, x, y)) *. (eval (e2, x, y))) /. 6;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | TimesTimes of expr* expr* expr
  | Cube of expr
  | MultDivBy6 of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | TimesTimes (e1,e2,e3) ->
      ((eval (e1, x, y)) *. (eval (e2, x, y))) *. (eval (e3, x, y))
  | Cube e1 -> ((eval (e1, x, y)) *. (eval (e1, x, y))) *. (eval (e1, x, y))
  | MultDivBy6 (e1,e2) -> ((eval (e1, x, y)) *. (eval (e2, x, y))) /. 6.0;;

*)

(* changed spans
(31,71)-(31,72)
6.0
LitG

*)

(* type error slice
(31,27)-(31,72)
(31,71)-(31,72)
*)
