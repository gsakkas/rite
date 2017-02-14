
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | TimesTimes of expr* expr* expr
  | SqXPlusY of expr* expr;;

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
  | SqXPlusY (e1,e2) ->
      ((eval (e1, x, y)) *. (eval (e1, x, y))) + (eval (e2, x, y));;


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
  | SqXPlusY of expr* expr;;

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
  | SqXPlusY (e1,e2) ->
      ((eval (e1, x, y)) *. (eval (e1, x, y))) +. (eval (e2, x, y));;

*)

(* changed spans
(30,9)-(30,65)
*)

(* type error slice
(19,21)-(19,42)
(19,28)-(19,32)
(19,28)-(19,42)
(30,9)-(30,44)
(30,9)-(30,65)
(30,9)-(30,65)
(30,51)-(30,55)
(30,51)-(30,65)
*)
