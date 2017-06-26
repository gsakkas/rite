
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
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> sin (pi *. (evalhelper p1 x y))
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y))
    | Average (p1,p2) -> ((evalhelper p1 x y) +. (evalhelper p2 x y)) /. 2.0
    | Times (p1,p2) -> p1 *. p2
    | Thresh (p1,p2,p3,p4) ->
        if (evalhelper p1 x y) < (evalhelper p2 x y)
        then evalhelper p3 x y
        else evalhelper p4 x y in
  evalhelper e x y;;


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
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> sin (pi *. (evalhelper p1 x y))
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y))
    | Average (p1,p2) -> ((evalhelper p1 x y) +. (evalhelper p2 x y)) /. 2.0
    | Times (p1,p2) -> (evalhelper p1 x y) *. (evalhelper p2 x y)
    | Thresh (p1,p2,p3,p4) ->
        if (evalhelper p1 x y) < (evalhelper p2 x y)
        then evalhelper p3 x y
        else evalhelper p4 x y in
  evalhelper e x y;;

*)

(* changed spans
(21,23)-(21,25)
(21,29)-(21,31)
(23,8)-(25,30)
*)

(* type error slice
(15,4)-(25,30)
(21,23)-(21,25)
(21,23)-(21,31)
(21,29)-(21,31)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(26,18)
(14,2)-(26,18)
(14,21)-(25,30)
(14,23)-(25,30)
(14,25)-(25,30)
(15,4)-(25,30)
(15,10)-(15,11)
(16,15)-(16,16)
(17,15)-(17,16)
(18,17)-(18,48)
(18,17)-(18,20)
(18,21)-(18,48)
(18,22)-(18,24)
(18,28)-(18,47)
(18,29)-(18,39)
(18,40)-(18,42)
(18,43)-(18,44)
(18,45)-(18,46)
(19,19)-(19,50)
(19,19)-(19,22)
(19,23)-(19,50)
(19,24)-(19,26)
(19,30)-(19,49)
(19,31)-(19,41)
(19,42)-(19,44)
(19,45)-(19,46)
(19,47)-(19,48)
(20,25)-(20,76)
(20,25)-(20,69)
(20,26)-(20,45)
(20,27)-(20,37)
(20,38)-(20,40)
(20,41)-(20,42)
(20,43)-(20,44)
(20,49)-(20,68)
(20,50)-(20,60)
(20,61)-(20,63)
(20,64)-(20,65)
(20,66)-(20,67)
(20,73)-(20,76)
(21,23)-(21,31)
(21,23)-(21,25)
(21,29)-(21,31)
(23,8)-(25,30)
(23,11)-(23,52)
(23,11)-(23,30)
(23,12)-(23,22)
(23,23)-(23,25)
(23,26)-(23,27)
(23,28)-(23,29)
(23,33)-(23,52)
(23,34)-(23,44)
(23,45)-(23,47)
(23,48)-(23,49)
(23,50)-(23,51)
(24,13)-(24,30)
(24,13)-(24,23)
(24,24)-(24,26)
(24,27)-(24,28)
(24,29)-(24,30)
(25,13)-(25,30)
(25,13)-(25,23)
(25,24)-(25,26)
(25,27)-(25,28)
(25,29)-(25,30)
(26,2)-(26,18)
(26,2)-(26,12)
(26,13)-(26,14)
(26,15)-(26,16)
(26,17)-(26,18)
*)
