
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
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2
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
(23,68)-(23,69)
(24,22)-(24,32)
(24,22)-(24,53)
(24,35)-(24,42)
(24,35)-(24,53)
(24,40)-(24,42)
(24,46)-(24,53)
(24,51)-(24,53)
(25,29)-(25,40)
(25,29)-(25,56)
(25,42)-(25,44)
(25,42)-(25,56)
(25,46)-(25,48)
(25,50)-(25,52)
(25,54)-(25,56)
*)

(* type error slice
(11,4)-(11,70)
(11,18)-(11,67)
(11,39)-(11,67)
(13,4)-(13,42)
(13,17)-(13,39)
(13,26)-(13,39)
(18,3)-(25,56)
(18,3)-(25,56)
(18,3)-(25,56)
(18,3)-(25,56)
(18,3)-(25,56)
(21,16)-(21,19)
(21,16)-(21,42)
(21,28)-(21,32)
(21,28)-(21,42)
(21,34)-(21,42)
(23,26)-(23,69)
(23,68)-(23,69)
(24,22)-(24,32)
(24,22)-(24,53)
(24,35)-(24,39)
(24,35)-(24,42)
(24,40)-(24,42)
(24,46)-(24,50)
(24,46)-(24,53)
(24,51)-(24,53)
(25,29)-(25,40)
(25,29)-(25,56)
*)
