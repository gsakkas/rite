
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr
  | DivideByOne of expr* expr* expr;;

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
  | SquareRoot e' -> sqrt (eval (e', x, y))
  | DivideByOne (e1,e2,e3) ->
      1 /. (((eval (e1, x, y)) - (eval (e2, x, y))) - (eval (e3, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr
  | DivideByOne of expr* expr* expr;;

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
  | SquareRoot e' -> sqrt (eval (e', x, y))
  | DivideByOne (e1,e2,e3) ->
      1.0 /. (((eval (e1, x, y)) -. (eval (e2, x, y))) -. (eval (e3, x, y)));;

*)

(* changed spans
(29,7)-(29,8)
1.0
LitG

(29,12)-(29,73)
(eval (e1 , x , y) -. eval (e2 , x , y)) -. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* type error slice
(19,20)-(19,45)
(19,27)-(19,44)
(19,28)-(19,32)
(29,7)-(29,8)
(29,7)-(29,73)
(29,12)-(29,73)
(29,13)-(29,52)
(29,14)-(29,31)
(29,15)-(29,19)
(29,34)-(29,51)
(29,35)-(29,39)
*)
