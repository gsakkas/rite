
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
(30,7)-(30,67)
(eval (e1 , x , y) *. eval (e1 , x , y)) +. eval (e2 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* type error slice
(19,20)-(19,45)
(19,27)-(19,44)
(19,28)-(19,32)
(30,7)-(30,47)
(30,7)-(30,67)
(30,50)-(30,67)
(30,51)-(30,55)
*)
