
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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2
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
(23,67)-(23,68)
(24,21)-(24,31)
(24,21)-(24,38)
(24,32)-(24,38)
(24,33)-(24,34)
(25,28)-(25,39)
(25,40)-(25,52)
(25,41)-(25,42)
(25,47)-(25,48)
*)

(* type error slice
(13,3)-(13,41)
(13,16)-(13,39)
(13,25)-(13,39)
(13,32)-(13,34)
(17,3)-(25,54)
(17,14)-(25,52)
(18,2)-(25,52)
(18,2)-(25,52)
(18,2)-(25,52)
(18,2)-(25,52)
(19,13)-(19,14)
(21,14)-(21,17)
(21,14)-(21,42)
(21,18)-(21,42)
(21,25)-(21,41)
(21,26)-(21,30)
(22,16)-(22,19)
(22,16)-(22,44)
(23,23)-(23,68)
(23,23)-(23,68)
(23,67)-(23,68)
(24,21)-(24,31)
(24,21)-(24,38)
(24,32)-(24,38)
(24,33)-(24,34)
*)
