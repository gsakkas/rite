
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
    | Sine p1 -> sin (pi * (evalhelper p1))
    | Cosine p1 -> evalhelper p1 in
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
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y)) in
  evalhelper e x y;;

*)

(* changed spans
(18,21)-(18,43)
(18,27)-(18,42)
(19,19)-(19,29)
(19,19)-(19,32)
(20,2)-(20,18)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(15,4)-(19,32)
(18,17)-(18,20)
(18,17)-(18,43)
(18,21)-(18,43)
(18,22)-(18,24)
(18,27)-(18,42)
(18,28)-(18,38)
(19,19)-(19,29)
(19,19)-(19,32)
(20,2)-(20,12)
(20,2)-(20,18)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(20,18)
(14,2)-(20,18)
(14,21)-(19,32)
(14,23)-(19,32)
(14,25)-(19,32)
(15,4)-(19,32)
(15,10)-(15,11)
(16,15)-(16,16)
(17,15)-(17,16)
(18,17)-(18,43)
(18,17)-(18,20)
(18,21)-(18,43)
(18,22)-(18,24)
(18,27)-(18,42)
(18,28)-(18,38)
(18,39)-(18,41)
(19,19)-(19,32)
(19,19)-(19,29)
(19,30)-(19,32)
(20,2)-(20,18)
(20,2)-(20,12)
(20,13)-(20,14)
(20,15)-(20,16)
(20,17)-(20,18)
*)
