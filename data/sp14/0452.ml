
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
(29,7)-(29,68)
(eval (e1 , x , y) +. eval (e2 , x , y)) +. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

*)

(* type error slice
(20,20)-(20,45)
(20,27)-(20,44)
(20,28)-(20,32)
(29,7)-(29,68)
(29,7)-(29,76)
(29,8)-(29,47)
(29,9)-(29,26)
(29,10)-(29,14)
(29,29)-(29,46)
(29,30)-(29,34)
*)
