
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
(31,46)-(31,47)
(31,52)-(31,54)
*)

(* type error slice
(15,4)-(31,58)
(15,15)-(31,54)
(16,3)-(31,54)
(16,3)-(31,54)
(16,3)-(31,54)
(16,3)-(31,54)
(16,3)-(31,54)
(16,3)-(31,54)
(16,3)-(31,54)
(16,3)-(31,54)
(16,3)-(31,54)
(16,3)-(31,54)
(17,14)-(17,15)
(19,16)-(19,19)
(19,16)-(19,44)
(19,22)-(19,26)
(19,22)-(19,36)
(19,22)-(19,44)
(19,28)-(19,30)
(19,28)-(19,36)
(20,18)-(20,21)
(20,18)-(20,46)
(21,26)-(21,71)
(22,23)-(22,58)
(24,7)-(26,26)
(25,12)-(25,16)
(25,12)-(25,26)
(25,18)-(25,20)
(25,18)-(25,26)
(28,7)-(30,26)
(29,12)-(29,16)
(29,12)-(29,26)
(31,19)-(31,54)
(31,40)-(31,44)
(31,40)-(31,54)
(31,46)-(31,47)
(31,46)-(31,54)
*)
