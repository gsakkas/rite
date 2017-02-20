
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
    | VarX  -> float x
    | VarY  -> float y
    | Sine p1 -> sin (pi *. (evalhelper p1 x y))
    | Cosine p1 -> cos (pi *. (evalhelper p1)) in
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
(16,15)-(16,20)
(16,15)-(16,22)
(17,15)-(17,20)
(17,15)-(17,22)
(19,30)-(19,45)
(20,2)-(20,18)
*)

(* type error slice
(18,28)-(18,47)
(18,29)-(18,39)
(19,23)-(19,46)
(19,30)-(19,45)
(19,31)-(19,41)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(20,18)
(14,2)-(20,18)
(14,21)-(19,46)
(14,23)-(19,46)
(14,25)-(19,46)
(15,4)-(19,46)
(15,10)-(15,11)
(16,15)-(16,22)
(16,15)-(16,20)
(16,21)-(16,22)
(17,15)-(17,22)
(17,15)-(17,20)
(17,21)-(17,22)
(18,17)-(18,48)
(18,17)-(18,20)
(18,21)-(18,48)
(18,22)-(18,24)
(18,28)-(18,47)
(18,29)-(18,39)
(18,40)-(18,42)
(18,43)-(18,44)
(18,45)-(18,46)
(19,19)-(19,46)
(19,19)-(19,22)
(19,23)-(19,46)
(19,24)-(19,26)
(19,30)-(19,45)
(19,31)-(19,41)
(19,42)-(19,44)
(20,2)-(20,18)
(20,2)-(20,12)
(20,13)-(20,14)
(20,15)-(20,16)
(20,17)-(20,18)
*)
