
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
(31,7)-(31,46)
((eval (e1 , x , y) *. eval (e1 , x , y)) +. (eval (e2 , x , y) *. eval (e2 , x , y))) +. (eval (e3 , x , y) *. eval (e3 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(31,8)-(31,25)
(eval (e1 , x , y) *. eval (e1 , x , y)) +. (eval (e2 , x , y) *. eval (e2 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(31,8)-(31,25)
eval (e1 , x , y) *. eval (e1 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(32,9)-(32,48)
eval (e2 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(33,10)-(33,49)
eval (e3 , x , y) *. eval (e3 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)
