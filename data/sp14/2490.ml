
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
    | Average (p1,p2) -> ((evalhelper p1 x y) * (evalhelper p2 x y)) /. 2.0 in
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
    | Average (p1,p2) -> ((evalhelper p1 x y) *. (evalhelper p2 x y)) /. 2.0 in
  evalhelper e x y;;

*)

(* changed spans
(20,25)-(20,68)
*)

(* type error slice
(18,21)-(18,48)
(18,28)-(18,47)
(18,29)-(18,39)
(20,25)-(20,68)
(20,25)-(20,75)
(20,26)-(20,45)
(20,27)-(20,37)
(20,48)-(20,67)
(20,49)-(20,59)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(21,18)
(14,2)-(21,18)
(14,21)-(20,75)
(14,23)-(20,75)
(14,25)-(20,75)
(15,4)-(20,75)
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
(20,25)-(20,75)
(20,25)-(20,68)
(20,26)-(20,45)
(20,27)-(20,37)
(20,38)-(20,40)
(20,41)-(20,42)
(20,43)-(20,44)
(20,48)-(20,67)
(20,49)-(20,59)
(20,60)-(20,62)
(20,63)-(20,64)
(20,65)-(20,66)
(20,72)-(20,75)
(21,2)-(21,18)
(21,2)-(21,12)
(21,13)-(21,14)
(21,15)-(21,16)
(21,17)-(21,18)
*)
