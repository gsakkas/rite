
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ThreshRev of expr* expr* expr* expr
  | Square of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin ((eval (e1, x, y)) *. pi)
  | Cosine e1 -> cos ((eval (e1, x, y)) *. pi)
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | ThreshRev (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Square e1 -> (eval (e1, x, y)) *. (eval (x, y, e1));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ThreshRev of expr* expr* expr* expr
  | Square of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin ((eval (e1, x, y)) *. pi)
  | Cosine e1 -> cos ((eval (e1, x, y)) *. pi)
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | ThreshRev (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Square e1 -> (eval (e1, x, y)) *. (eval (e1, x, y));;

*)

(* changed spans
(31,45)-(31,46)
(31,51)-(31,53)
*)

(* type error slice
(15,3)-(31,57)
(15,14)-(31,55)
(16,2)-(31,55)
(16,2)-(31,55)
(16,2)-(31,55)
(16,2)-(31,55)
(16,2)-(31,55)
(16,2)-(31,55)
(16,2)-(31,55)
(16,2)-(31,55)
(16,2)-(31,55)
(16,2)-(31,55)
(17,13)-(17,14)
(19,15)-(19,18)
(19,15)-(19,44)
(19,19)-(19,44)
(19,20)-(19,37)
(19,21)-(19,25)
(19,26)-(19,36)
(19,27)-(19,29)
(20,17)-(20,20)
(20,17)-(20,46)
(21,23)-(21,70)
(22,21)-(22,59)
(24,6)-(26,26)
(25,11)-(25,15)
(25,11)-(25,26)
(25,16)-(25,26)
(25,17)-(25,19)
(28,6)-(30,26)
(29,11)-(29,15)
(29,11)-(29,26)
(31,17)-(31,55)
(31,38)-(31,55)
(31,39)-(31,43)
(31,44)-(31,54)
(31,45)-(31,46)
*)
