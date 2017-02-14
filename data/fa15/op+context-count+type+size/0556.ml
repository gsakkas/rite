
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Golden of expr
  | MeanPi of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Golden e' ->
      cos ((((eval (e', x, y)) ** 2.0) -. (eval (e', x, y))) -. 1.0)
  | MeanPi (e1,e2,e3) ->
      sin (((eval (e1, x, y) eval) + (e2, x, y)) + ((eval (e3, x, y)) /. pi));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Golden of expr
  | MeanPi of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Golden e' ->
      cos ((((eval (e', x, y)) ** 2.0) -. (eval (e', x, y))) -. 1.0)
  | MeanPi (e1,e2,e3) ->
      sin
        (((eval (e1, x, y)) +. (eval (e2, x, y))) +.
           ((eval (e3, x, y)) /. pi));;

*)

(* changed spans
(30,14)-(30,18)
(30,14)-(30,34)
(30,14)-(30,47)
(30,14)-(30,76)
(30,30)-(30,34)
*)

(* type error slice
(19,21)-(19,42)
(19,28)-(19,32)
(19,28)-(19,42)
(30,7)-(30,10)
(30,7)-(30,76)
(30,14)-(30,18)
(30,14)-(30,34)
(30,14)-(30,47)
(30,14)-(30,76)
(30,14)-(30,76)
(30,39)-(30,47)
(30,54)-(30,76)
*)
