
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Root of expr
  | Average of expr* expr
  | Times of expr* expr
  | Pivot of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x2 -> cos (pi *. (eval (x2, x, y)))
  | Root x3 -> sqrt (eval (x3, x, y))
  | Average (x4,x5) -> ((eval (x4, x, y)) +. (eval (x5, x, y))) /. 2.
  | Times (x6,x7) -> (eval (x6, x, y)) *. (eval (x7, x, y))
  | Thresh (x8,x9,x10,x11) ->
      if (eval (x8, x, y)) < (eval (x9, x, y))
      then eval (x10, x, y)
      else eval (x11, x, y)
  | Pivot (x12,x13,x14) ->
      if (eval (x12, x, y)) < 0 then eval (x13, x, y) else eval (x14, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Root of expr
  | Average of expr* expr
  | Times of expr* expr
  | Pivot of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x2 -> cos (pi *. (eval (x2, x, y)))
  | Root x3 -> sqrt (eval (x3, x, y))
  | Average (x4,x5) -> ((eval (x4, x, y)) +. (eval (x5, x, y))) /. 2.
  | Times (x6,x7) -> (eval (x6, x, y)) *. (eval (x7, x, y))
  | Thresh (x8,x9,x10,x11) ->
      if (eval (x8, x, y)) < (eval (x9, x, y))
      then eval (x10, x, y)
      else eval (x11, x, y)
  | Pivot (x12,x13,x14) ->
      if (eval (x12, x, y)) < 0. then eval (x13, x, y) else eval (x14, x, y);;

*)

(* changed spans
(29,30)-(29,31)
*)

(* type error slice
(19,19)-(19,44)
(19,26)-(19,43)
(19,27)-(19,31)
(29,9)-(29,27)
(29,9)-(29,31)
(29,10)-(29,14)
(29,30)-(29,31)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(29,75)
(16,2)-(29,75)
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
(21,15)-(21,37)
(21,15)-(21,19)
(21,20)-(21,37)
(21,21)-(21,25)
(21,26)-(21,36)
(21,27)-(21,29)
(21,31)-(21,32)
(21,34)-(21,35)
(22,23)-(22,69)
(22,23)-(22,63)
(22,24)-(22,41)
(22,25)-(22,29)
(22,30)-(22,40)
(22,31)-(22,33)
(22,35)-(22,36)
(22,38)-(22,39)
(22,45)-(22,62)
(22,46)-(22,50)
(22,51)-(22,61)
(22,52)-(22,54)
(22,56)-(22,57)
(22,59)-(22,60)
(22,67)-(22,69)
(23,21)-(23,59)
(23,21)-(23,38)
(23,22)-(23,26)
(23,27)-(23,37)
(23,28)-(23,30)
(23,32)-(23,33)
(23,35)-(23,36)
(23,42)-(23,59)
(23,43)-(23,47)
(23,48)-(23,58)
(23,49)-(23,51)
(23,53)-(23,54)
(23,56)-(23,57)
(25,6)-(27,27)
(25,9)-(25,46)
(25,9)-(25,26)
(25,10)-(25,14)
(25,15)-(25,25)
(25,16)-(25,18)
(25,20)-(25,21)
(25,23)-(25,24)
(25,29)-(25,46)
(25,30)-(25,34)
(25,35)-(25,45)
(25,36)-(25,38)
(25,40)-(25,41)
(25,43)-(25,44)
(26,11)-(26,27)
(26,11)-(26,15)
(26,16)-(26,27)
(26,17)-(26,20)
(26,22)-(26,23)
(26,25)-(26,26)
(27,11)-(27,27)
(27,11)-(27,15)
(27,16)-(27,27)
(27,17)-(27,20)
(27,22)-(27,23)
(27,25)-(27,26)
(29,6)-(29,75)
(29,9)-(29,31)
(29,9)-(29,27)
(29,10)-(29,14)
(29,15)-(29,26)
(29,16)-(29,19)
(29,21)-(29,22)
(29,24)-(29,25)
(29,30)-(29,31)
(29,37)-(29,53)
(29,37)-(29,41)
(29,42)-(29,53)
(29,43)-(29,46)
(29,48)-(29,49)
(29,51)-(29,52)
(29,59)-(29,75)
(29,59)-(29,63)
(29,64)-(29,75)
(29,65)-(29,68)
(29,70)-(29,71)
(29,73)-(29,74)
*)
