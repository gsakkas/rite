
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Flatten of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Squared e -> (eval (e, x, y)) ** 2.
  | Flatten (e1,e2,e3) ->
      ((eval (e1, x, y)) / (eval (e2, x, y))) / (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Flatten of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Squared e -> (eval (e, x, y)) ** 2.
  | Flatten (e1,e2,e3) ->
      ((eval (e1, x, y)) /. (eval (e2, x, y))) /. (eval (e3, x, y));;

*)

(* changed spans
(29,7)-(29,66)
(eval (e1 , x , y) /. eval (e2 , x , y)) /. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

*)

(* type error slice
(19,19)-(19,43)
(19,26)-(19,42)
(19,27)-(19,31)
(29,7)-(29,46)
(29,7)-(29,66)
(29,8)-(29,25)
(29,9)-(29,13)
(29,28)-(29,45)
(29,29)-(29,33)
(29,49)-(29,66)
(29,50)-(29,54)
*)
