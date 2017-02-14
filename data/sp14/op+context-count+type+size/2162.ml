
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e0 -> sin (pi *. (eval (e0, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e2,e3) -> ((eval (e2, x, y)) + (eval (e3, x, y))) / 2
  | Times (e4,e5) -> (eval (e4, x, y)) * (eval (e5, x, y))
  | Thresh (e6,e7,e8,e9) ->
      if (eval (e6, x, y)) < (eval (e7, x, y))
      then eval (e8, x, y)
      else eval (e9, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e0 -> sin (pi *. (eval (e0, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e2,e3) -> ((eval (e2, x, y)) +. (eval (e3, x, y))) /. 2.0
  | Times (e4,e5) -> (eval (e4, x, y)) *. (eval (e5, x, y))
  | Thresh (e6,e7,e8,e9) ->
      if (eval (e6, x, y)) < (eval (e7, x, y))
      then eval (e8, x, y)
      else eval (e9, x, y);;

*)

(* changed spans
(19,26)-(19,40)
(19,26)-(19,60)
(19,26)-(19,67)
(19,66)-(19,67)
(20,23)-(20,37)
(20,23)-(20,57)
*)

(* type error slice
(17,21)-(17,42)
(17,28)-(17,32)
(17,28)-(17,42)
(19,26)-(19,30)
(19,26)-(19,40)
(19,26)-(19,60)
(19,26)-(19,60)
(19,46)-(19,50)
(19,46)-(19,60)
(20,23)-(20,27)
(20,23)-(20,37)
(20,23)-(20,57)
(20,23)-(20,57)
(20,43)-(20,47)
(20,43)-(20,57)
*)
