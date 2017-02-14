
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> buildTimes (x, y)
  | Thresh (e1,e2,e3,e4) -> buildThresh (x, y, x, y);;


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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(11,18)-(11,67)
(11,39)-(11,67)
(11,47)-(11,48)
(11,50)-(11,51)
(11,53)-(11,59)
(11,61)-(11,67)
(13,17)-(13,39)
(13,26)-(13,39)
(13,33)-(13,35)
(13,37)-(13,39)
(24,22)-(24,32)
(24,22)-(24,38)
(24,34)-(24,35)
(24,34)-(24,38)
(25,29)-(25,40)
(25,42)-(25,43)
(25,42)-(25,52)
(25,48)-(25,49)
*)

(* type error slice
(13,4)-(13,42)
(13,17)-(13,39)
(13,26)-(13,39)
(13,33)-(13,35)
(17,4)-(25,55)
(17,15)-(25,52)
(18,3)-(25,52)
(18,3)-(25,52)
(18,3)-(25,52)
(18,3)-(25,52)
(19,14)-(19,15)
(21,15)-(21,18)
(21,15)-(21,40)
(21,20)-(21,40)
(21,27)-(21,31)
(21,27)-(21,40)
(22,17)-(22,20)
(22,17)-(22,42)
(23,26)-(23,71)
(24,22)-(24,32)
(24,22)-(24,38)
(24,34)-(24,35)
(24,34)-(24,38)
*)
