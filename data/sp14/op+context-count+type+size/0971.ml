
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
  | Negate e1 -> (eval (e1, x, y)) * (-1)
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
(29,17)-(29,41)
(29,37)-(29,41)
(31,6)-(32,49)
(31,6)-(33,49)
(31,7)-(31,46)
(31,8)-(31,25)
(32,9)-(32,48)
(33,10)-(33,49)
*)

(* type error slice
(20,19)-(20,44)
(20,26)-(20,43)
(20,27)-(20,31)
(29,17)-(29,34)
(29,17)-(29,41)
(29,18)-(29,22)
(31,7)-(31,46)
(31,7)-(31,46)
(31,8)-(31,25)
(31,9)-(31,13)
(31,28)-(31,45)
(31,29)-(31,33)
(32,9)-(32,48)
(32,9)-(32,48)
(32,10)-(32,27)
(32,11)-(32,15)
(32,30)-(32,47)
(32,31)-(32,35)
(33,10)-(33,49)
(33,10)-(33,49)
(33,11)-(33,28)
(33,12)-(33,16)
(33,31)-(33,48)
(33,32)-(33,36)
*)
