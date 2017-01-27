
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
  | SumSquared of expr* expr* expr;;

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
  | Percent e1 -> (eval (e1, x, y)) *. 0.01
  | Negate e1 -> (eval (e1, x, y)) *. (-1.0)
  | SumSquared (e1,e2,e3) ->
      (((eval (e1, x, y)) * (eval (e1, x, y))) +
         ((eval (e2, x, y)) * (eval (e2, x, y))))
        + ((eval (e3, x, y)) * (eval (e3, x, y)));;


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
  | SumSquared of expr* expr* expr;;

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
  | Percent e1 -> (eval (e1, x, y)) *. 0.01
  | Negate e1 -> (eval (e1, x, y)) *. (-1.0)
  | SumSquared (e1,e2,e3) ->
      (((eval (e1, x, y)) *. (eval (e1, x, y))) +.
         ((eval (e2, x, y)) *. (eval (e2, x, y))))
        +. ((eval (e3, x, y)) *. (eval (e3, x, y)));;

*)

(* changed spans
(31,10)-(31,24)
(31,10)-(31,44)
(31,10)-(32,46)
(31,10)-(33,47)
(32,12)-(32,46)
(33,13)-(33,47)
*)

(* type error slice
(17,3)-(33,47)
(18,14)-(18,15)
(20,28)-(20,32)
(20,28)-(20,42)
(20,34)-(20,36)
(20,34)-(20,42)
(20,38)-(20,39)
(20,41)-(20,42)
(29,19)-(29,44)
(29,40)-(29,44)
(29,41)-(29,44)
(31,10)-(31,14)
(31,10)-(31,24)
(31,10)-(31,44)
(31,10)-(33,47)
(31,16)-(31,18)
(31,16)-(31,24)
(31,20)-(31,21)
(31,23)-(31,24)
(31,30)-(31,34)
(31,30)-(31,44)
(31,36)-(31,38)
(31,36)-(31,44)
(31,40)-(31,41)
(31,43)-(31,44)
(32,12)-(32,16)
(32,12)-(32,26)
(32,12)-(32,46)
(32,18)-(32,20)
(32,18)-(32,26)
(32,22)-(32,23)
(32,25)-(32,26)
(32,32)-(32,36)
(32,32)-(32,46)
(32,38)-(32,40)
(32,38)-(32,46)
(32,42)-(32,43)
(32,45)-(32,46)
(33,13)-(33,17)
(33,13)-(33,27)
(33,13)-(33,47)
(33,19)-(33,21)
(33,19)-(33,27)
(33,23)-(33,24)
(33,26)-(33,27)
(33,33)-(33,37)
(33,33)-(33,47)
(33,39)-(33,41)
(33,39)-(33,47)
(33,43)-(33,44)
(33,46)-(33,47)
*)
