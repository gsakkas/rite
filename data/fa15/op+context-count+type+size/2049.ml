
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> buildX ()
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) -> buildThresh (a, b, a_less, b_less);;


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
  | buildX -> x
  | buildY -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) -> 0.0;;

*)

(* changed spans
(11,17)-(11,67)
(11,38)-(11,67)
(11,46)-(11,47)
(11,49)-(11,50)
(11,52)-(11,58)
(11,60)-(11,66)
(13,11)-(13,20)
(13,16)-(13,20)
(18,2)-(25,68)
(19,13)-(19,19)
(19,13)-(19,22)
(19,20)-(19,22)
(24,48)-(24,58)
(25,34)-(25,68)
*)

(* type error slice
(13,3)-(13,22)
(13,11)-(13,20)
(13,16)-(13,20)
(17,3)-(25,70)
(17,14)-(25,68)
(18,2)-(25,68)
(18,2)-(25,68)
(18,2)-(25,68)
(18,2)-(25,68)
(18,2)-(25,68)
(19,13)-(19,19)
(19,13)-(19,22)
(21,14)-(21,17)
(21,14)-(21,42)
(21,18)-(21,42)
(21,25)-(21,41)
(21,26)-(21,30)
(22,16)-(22,19)
(22,16)-(22,44)
(23,23)-(23,70)
(24,21)-(24,59)
*)

(* all spans
(11,17)-(11,67)
(11,38)-(11,67)
(11,46)-(11,47)
(11,49)-(11,50)
(11,52)-(11,58)
(11,60)-(11,66)
(13,11)-(13,20)
(13,16)-(13,20)
(15,9)-(15,26)
(15,9)-(15,12)
(15,16)-(15,26)
(15,17)-(15,21)
(15,22)-(15,25)
(17,14)-(25,68)
(18,2)-(25,68)
(18,8)-(18,9)
(19,13)-(19,22)
(19,13)-(19,19)
(19,20)-(19,22)
(20,13)-(20,14)
(21,14)-(21,42)
(21,14)-(21,17)
(21,18)-(21,42)
(21,19)-(21,21)
(21,25)-(21,41)
(21,26)-(21,30)
(21,31)-(21,40)
(21,32)-(21,33)
(21,35)-(21,36)
(21,38)-(21,39)
(22,16)-(22,44)
(22,16)-(22,19)
(22,20)-(22,44)
(22,21)-(22,23)
(22,27)-(22,43)
(22,28)-(22,32)
(22,33)-(22,42)
(22,34)-(22,35)
(22,37)-(22,38)
(22,40)-(22,41)
(23,23)-(23,70)
(23,23)-(23,63)
(23,24)-(23,41)
(23,25)-(23,29)
(23,30)-(23,40)
(23,31)-(23,33)
(23,35)-(23,36)
(23,38)-(23,39)
(23,45)-(23,62)
(23,46)-(23,50)
(23,51)-(23,61)
(23,52)-(23,54)
(23,56)-(23,57)
(23,59)-(23,60)
(23,67)-(23,70)
(24,21)-(24,59)
(24,21)-(24,38)
(24,22)-(24,26)
(24,27)-(24,37)
(24,28)-(24,30)
(24,32)-(24,33)
(24,35)-(24,36)
(24,42)-(24,59)
(24,43)-(24,47)
(24,48)-(24,58)
(24,49)-(24,51)
(24,53)-(24,54)
(24,56)-(24,57)
(25,34)-(25,68)
(25,34)-(25,45)
(25,46)-(25,68)
(25,47)-(25,48)
(25,50)-(25,51)
(25,53)-(25,59)
(25,61)-(25,67)
*)