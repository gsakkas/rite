
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Comp of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) /. (float_of_int 2)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Power (e1,e2) -> (eval (e1, x, y)) ** (eval (e2, x, y))
  | Comp (e1,e2,e3) ->
      (((-1) * (eval (e1, x, y))) * (eval (e2, x, y))) * (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Comp of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) /. (float_of_int 2)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Power (e1,e2) -> (eval (e1, x, y)) ** (eval (e2, x, y))
  | Comp (e1,e2,e3) ->
      (((float_of_int (-1)) *. (eval (e1, x, y))) *. (eval (e2, x, y))) *.
        (eval (e3, x, y));;

*)

(* changed spans
(30,10)-(30,12)
(30,10)-(30,31)
(30,10)-(30,52)
(30,10)-(30,73)
*)

(* type error slice
(19,21)-(19,42)
(19,28)-(19,32)
(19,28)-(19,42)
(30,10)-(30,31)
(30,10)-(30,52)
(30,10)-(30,73)
(30,17)-(30,21)
(30,17)-(30,31)
(30,38)-(30,42)
(30,38)-(30,52)
(30,59)-(30,63)
(30,59)-(30,73)
*)
