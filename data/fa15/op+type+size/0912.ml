
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | OneOver of expr
  | OneOverAvg of expr* expr* expr;;

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
      else eval (e4, x, y)
  | OneOver e ->
      if (eval (e, x, y)) > 1.0 then 1.0 /. (eval (e, x, y)) else 1.0 / 3.0
  | OneOverAvg (e1,e2,e3) ->
      if
        (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y))) > 1.0
      then
        1.0 /.
          (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)))
      else (-1.0) / 3.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | OneOver of expr
  | OneOverAvg of expr* expr* expr;;

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
      else eval (e4, x, y)
  | OneOver e ->
      if (eval (e, x, y)) > 1.0 then 1.0 /. (eval (e, x, y)) else 1.0 /. 3.0
  | OneOverAvg (e1,e2,e3) ->
      if
        (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y))) > 1.0
      then
        1.0 /.
          (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)))
      else (-1.0) /. 3.0;;

*)

(* changed spans
(28,66)-(28,75)
(35,11)-(35,23)
*)

(* type error slice
(28,6)-(28,75)
(28,6)-(28,75)
(28,37)-(28,60)
(28,66)-(28,69)
(28,66)-(28,75)
(28,66)-(28,75)
(28,66)-(28,75)
(28,72)-(28,75)
(30,6)-(35,23)
(30,6)-(35,23)
(33,8)-(34,73)
(35,11)-(35,17)
(35,11)-(35,23)
(35,11)-(35,23)
(35,13)-(35,16)
(35,20)-(35,23)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(35,23)
(16,2)-(35,23)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,15)-(19,44)
(19,15)-(19,18)
(19,19)-(19,44)
(19,20)-(19,22)
(19,26)-(19,43)
(19,27)-(19,31)
(19,32)-(19,42)
(19,33)-(19,35)
(19,37)-(19,38)
(19,40)-(19,41)
(20,17)-(20,46)
(20,17)-(20,20)
(20,21)-(20,46)
(20,22)-(20,24)
(20,28)-(20,45)
(20,29)-(20,33)
(20,34)-(20,44)
(20,35)-(20,37)
(20,39)-(20,40)
(20,42)-(20,43)
(21,23)-(21,70)
(21,23)-(21,63)
(21,24)-(21,41)
(21,25)-(21,29)
(21,30)-(21,40)
(21,31)-(21,33)
(21,35)-(21,36)
(21,38)-(21,39)
(21,45)-(21,62)
(21,46)-(21,50)
(21,51)-(21,61)
(21,52)-(21,54)
(21,56)-(21,57)
(21,59)-(21,60)
(21,67)-(21,70)
(22,21)-(22,59)
(22,21)-(22,38)
(22,22)-(22,26)
(22,27)-(22,37)
(22,28)-(22,30)
(22,32)-(22,33)
(22,35)-(22,36)
(22,42)-(22,59)
(22,43)-(22,47)
(22,48)-(22,58)
(22,49)-(22,51)
(22,53)-(22,54)
(22,56)-(22,57)
(24,6)-(26,26)
(24,9)-(24,46)
(24,9)-(24,26)
(24,10)-(24,14)
(24,15)-(24,25)
(24,16)-(24,18)
(24,20)-(24,21)
(24,23)-(24,24)
(24,29)-(24,46)
(24,30)-(24,34)
(24,35)-(24,45)
(24,36)-(24,38)
(24,40)-(24,41)
(24,43)-(24,44)
(25,11)-(25,26)
(25,11)-(25,15)
(25,16)-(25,26)
(25,17)-(25,19)
(25,21)-(25,22)
(25,24)-(25,25)
(26,11)-(26,26)
(26,11)-(26,15)
(26,16)-(26,26)
(26,17)-(26,19)
(26,21)-(26,22)
(26,24)-(26,25)
(28,6)-(28,75)
(28,9)-(28,31)
(28,9)-(28,25)
(28,10)-(28,14)
(28,15)-(28,24)
(28,16)-(28,17)
(28,19)-(28,20)
(28,22)-(28,23)
(28,28)-(28,31)
(28,37)-(28,60)
(28,37)-(28,40)
(28,44)-(28,60)
(28,45)-(28,49)
(28,50)-(28,59)
(28,51)-(28,52)
(28,54)-(28,55)
(28,57)-(28,58)
(28,66)-(28,75)
(28,66)-(28,69)
(28,72)-(28,75)
(30,6)-(35,23)
(31,8)-(31,77)
(31,8)-(31,71)
(31,9)-(31,49)
(31,10)-(31,27)
(31,11)-(31,15)
(31,16)-(31,26)
(31,17)-(31,19)
(31,21)-(31,22)
(31,24)-(31,25)
(31,31)-(31,48)
(31,32)-(31,36)
(31,37)-(31,47)
(31,38)-(31,40)
(31,42)-(31,43)
(31,45)-(31,46)
(31,53)-(31,70)
(31,54)-(31,58)
(31,59)-(31,69)
(31,60)-(31,62)
(31,64)-(31,65)
(31,67)-(31,68)
(31,74)-(31,77)
(33,8)-(34,73)
(33,8)-(33,11)
(34,10)-(34,73)
(34,11)-(34,51)
(34,12)-(34,29)
(34,13)-(34,17)
(34,18)-(34,28)
(34,19)-(34,21)
(34,23)-(34,24)
(34,26)-(34,27)
(34,33)-(34,50)
(34,34)-(34,38)
(34,39)-(34,49)
(34,40)-(34,42)
(34,44)-(34,45)
(34,47)-(34,48)
(34,55)-(34,72)
(34,56)-(34,60)
(34,61)-(34,71)
(34,62)-(34,64)
(34,66)-(34,67)
(34,69)-(34,70)
(35,11)-(35,23)
(35,11)-(35,17)
(35,13)-(35,16)
(35,20)-(35,23)
*)
