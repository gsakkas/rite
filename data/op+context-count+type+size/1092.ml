
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Percent of expr
  | Negate of expr
  | SumPercent of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | SumPercent (e1,e2,e3) ->
      (((eval (e1, x, y)) + (eval (e2, x, y))) + (eval (e3, x, y))) *. 0.01
  | Negate e1 -> (eval (e1, x, y)) *. (-1.0);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Percent of expr
  | Negate of expr
  | SumPercent of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | SumPercent (e1,e2,e3) ->
      (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y))) *. 0.01
  | Negate e1 -> (eval (e1, x, y)) *. (-1.0);;

*)

(* changed spans
(29,10)-(29,24)
(29,10)-(29,44)
(29,10)-(29,65)
*)

(* type error slice
(17,3)-(30,44)
(20,28)-(20,32)
(20,28)-(20,42)
(20,34)-(20,36)
(20,34)-(20,42)
(20,38)-(20,39)
(20,41)-(20,42)
(29,10)-(29,14)
(29,10)-(29,24)
(29,10)-(29,44)
(29,10)-(29,65)
(29,10)-(29,76)
(29,16)-(29,18)
(29,16)-(29,24)
(29,20)-(29,21)
(29,23)-(29,24)
(29,30)-(29,34)
(29,30)-(29,44)
(29,36)-(29,38)
(29,36)-(29,44)
(29,40)-(29,41)
(29,43)-(29,44)
(29,51)-(29,55)
(29,51)-(29,65)
(29,57)-(29,59)
(29,57)-(29,65)
(29,61)-(29,62)
(29,64)-(29,65)
(30,19)-(30,44)
(30,40)-(30,44)
(30,41)-(30,44)
*)
