
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
(20,28)-(20,67)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(13,4)-(21,21)
(13,15)-(21,19)
(14,22)-(20,76)
(14,24)-(20,76)
(14,26)-(20,76)
(15,5)-(20,76)
(15,5)-(20,76)
(15,5)-(20,76)
(15,5)-(20,76)
(15,5)-(20,76)
(15,5)-(20,76)
(15,5)-(20,76)
(15,5)-(20,76)
(15,5)-(20,76)
(15,5)-(20,76)
(15,5)-(20,76)
(15,11)-(15,12)
(16,16)-(16,17)
(17,16)-(17,17)
(18,18)-(18,21)
(18,18)-(18,47)
(18,23)-(18,25)
(18,23)-(18,47)
(18,23)-(18,47)
(18,30)-(18,40)
(18,30)-(18,47)
(18,30)-(18,47)
(18,30)-(18,47)
(18,30)-(18,47)
(18,41)-(18,43)
(18,44)-(18,45)
(18,46)-(18,47)
(19,20)-(19,23)
(19,20)-(19,49)
(19,25)-(19,27)
(19,25)-(19,49)
(19,32)-(19,42)
(19,32)-(19,49)
(19,32)-(19,49)
(19,32)-(19,49)
(19,43)-(19,45)
(19,46)-(19,47)
(19,48)-(19,49)
(20,28)-(20,38)
(20,28)-(20,45)
(20,28)-(20,45)
(20,28)-(20,45)
(20,28)-(20,67)
(20,28)-(20,67)
(20,28)-(20,67)
(20,28)-(20,76)
(20,39)-(20,41)
(20,42)-(20,43)
(20,44)-(20,45)
(20,50)-(20,60)
(20,50)-(20,67)
(20,50)-(20,67)
(20,50)-(20,67)
(20,61)-(20,63)
(20,64)-(20,65)
(20,66)-(20,67)
(20,73)-(20,76)
(21,14)-(21,15)
(21,16)-(21,17)
(21,18)-(21,19)
*)
