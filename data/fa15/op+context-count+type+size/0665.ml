
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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi * (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) + (eval (e2, x, y))) / 2
  | Times (e1,e2) -> buildTimes ((eval e1), (eval e2))
  | Thresh (e1,e2,e3,e4) -> buildThresh (e1, e2, e3, e4);;


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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(11,17)-(11,67)
(11,38)-(11,67)
(11,46)-(11,47)
(11,49)-(11,50)
(11,52)-(11,58)
(11,60)-(11,66)
(13,16)-(13,39)
(13,25)-(13,39)
(13,32)-(13,34)
(13,36)-(13,38)
(22,21)-(22,45)
(23,23)-(23,62)
(23,23)-(23,66)
(23,24)-(23,41)
(23,65)-(23,66)
(24,21)-(24,31)
(24,21)-(24,54)
(24,32)-(24,54)
(24,33)-(24,42)
(24,39)-(24,41)
(24,44)-(24,53)
(24,50)-(24,52)
(25,28)-(25,39)
(25,28)-(25,56)
(25,40)-(25,56)
(25,41)-(25,43)
(25,45)-(25,47)
(25,49)-(25,51)
(25,53)-(25,55)
*)

(* type error slice
(15,3)-(15,28)
(15,9)-(15,26)
(21,19)-(21,44)
(21,26)-(21,43)
(21,27)-(21,31)
(22,17)-(22,20)
(22,17)-(22,45)
(22,21)-(22,45)
(22,21)-(22,45)
(22,21)-(22,45)
(22,22)-(22,24)
(22,27)-(22,44)
(22,28)-(22,32)
(23,23)-(23,62)
(23,23)-(23,62)
(23,24)-(23,41)
(23,25)-(23,29)
(23,44)-(23,61)
(23,45)-(23,49)
*)
