
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Zero;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Zero  -> 0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Zero;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Zero  -> 0.0;;

*)

(* changed spans
(26,13)-(26,14)
*)

(* type error slice
(15,2)-(26,14)
(15,2)-(26,14)
(18,15)-(18,18)
(18,15)-(18,44)
(26,13)-(26,14)
*)

(* all spans
(12,9)-(12,26)
(12,9)-(12,12)
(12,16)-(12,26)
(12,17)-(12,21)
(12,22)-(12,25)
(14,14)-(26,14)
(15,2)-(26,14)
(15,8)-(15,9)
(16,13)-(16,14)
(17,13)-(17,14)
(18,15)-(18,44)
(18,15)-(18,18)
(18,19)-(18,44)
(18,20)-(18,22)
(18,26)-(18,43)
(18,27)-(18,31)
(18,32)-(18,42)
(18,33)-(18,35)
(18,37)-(18,38)
(18,40)-(18,41)
(19,17)-(19,46)
(19,17)-(19,20)
(19,21)-(19,46)
(19,22)-(19,24)
(19,28)-(19,45)
(19,29)-(19,33)
(19,34)-(19,44)
(19,35)-(19,37)
(19,39)-(19,40)
(19,42)-(19,43)
(20,23)-(20,70)
(20,23)-(20,63)
(20,24)-(20,41)
(20,25)-(20,29)
(20,30)-(20,40)
(20,31)-(20,33)
(20,35)-(20,36)
(20,38)-(20,39)
(20,45)-(20,62)
(20,46)-(20,50)
(20,51)-(20,61)
(20,52)-(20,54)
(20,56)-(20,57)
(20,59)-(20,60)
(20,67)-(20,70)
(21,21)-(21,59)
(21,21)-(21,38)
(21,22)-(21,26)
(21,27)-(21,37)
(21,28)-(21,30)
(21,32)-(21,33)
(21,35)-(21,36)
(21,42)-(21,59)
(21,43)-(21,47)
(21,48)-(21,58)
(21,49)-(21,51)
(21,53)-(21,54)
(21,56)-(21,57)
(23,6)-(25,26)
(23,9)-(23,46)
(23,9)-(23,26)
(23,10)-(23,14)
(23,15)-(23,25)
(23,16)-(23,18)
(23,20)-(23,21)
(23,23)-(23,24)
(23,29)-(23,46)
(23,30)-(23,34)
(23,35)-(23,45)
(23,36)-(23,38)
(23,40)-(23,41)
(23,43)-(23,44)
(24,11)-(24,26)
(24,11)-(24,15)
(24,16)-(24,26)
(24,17)-(24,19)
(24,21)-(24,22)
(24,24)-(24,25)
(25,11)-(25,26)
(25,11)-(25,15)
(25,16)-(25,26)
(25,17)-(25,19)
(25,21)-(25,22)
(25,24)-(25,25)
(26,13)-(26,14)
*)
