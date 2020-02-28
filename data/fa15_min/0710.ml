
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
e1
VarG

(31,49)-(31,50)
x
VarG

(31,52)-(31,54)
y
VarG

*)

(* type error slice
(15,4)-(31,58)
(15,15)-(31,56)
(16,3)-(31,56)
(17,14)-(17,15)
(19,16)-(19,19)
(19,16)-(19,45)
(19,20)-(19,45)
(19,21)-(19,38)
(19,22)-(19,26)
(19,27)-(19,37)
(19,28)-(19,30)
(20,18)-(20,21)
(20,18)-(20,47)
(21,24)-(21,71)
(22,22)-(22,60)
(24,7)-(26,27)
(26,12)-(26,16)
(26,12)-(26,27)
(28,7)-(30,27)
(30,12)-(30,16)
(30,12)-(30,27)
(31,18)-(31,56)
(31,39)-(31,56)
(31,40)-(31,44)
(31,45)-(31,55)
(31,46)-(31,47)
*)
