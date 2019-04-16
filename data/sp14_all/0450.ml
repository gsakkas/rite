
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
(29,18)-(29,42)
eval (e1 , x , y) *. (- 1.0)
BopG (AppG (fromList [EmptyG])) (UopG EmptyG)

(31,7)-(33,50)
((eval (e1 , x , y) *. eval (e1 , x , y)) +. (eval (e2 , x , y) *. eval (e2 , x , y))) +. (eval (e3 , x , y) *. eval (e3 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* type error slice
(20,20)-(20,45)
(20,27)-(20,44)
(20,28)-(20,32)
(29,18)-(29,35)
(29,18)-(29,42)
(29,19)-(29,23)
(31,8)-(31,47)
(31,9)-(31,26)
(31,10)-(31,14)
(31,29)-(31,46)
(31,30)-(31,34)
(32,10)-(32,49)
(32,11)-(32,28)
(32,12)-(32,16)
(32,31)-(32,48)
(32,32)-(32,36)
(33,11)-(33,50)
(33,12)-(33,29)
(33,13)-(33,17)
(33,32)-(33,49)
(33,33)-(33,37)
*)
