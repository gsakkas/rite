
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let rec eval (e,x,y) =
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> evalhelper Sine p1 x y
    | Cosine p1 -> evalhelper buildCosine p1 x y in
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
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(13,14)-(20,18)
(18,17)-(18,27)
(18,17)-(18,39)
(18,28)-(18,32)
(19,19)-(19,29)
(19,19)-(19,48)
(19,30)-(19,41)
*)

(* type error slice
(11,3)-(11,30)
(11,16)-(11,28)
(14,2)-(20,18)
(14,21)-(19,48)
(14,23)-(19,48)
(14,25)-(19,48)
(15,4)-(19,48)
(18,17)-(18,27)
(18,17)-(18,39)
(18,28)-(18,32)
(19,19)-(19,29)
(19,19)-(19,48)
(19,30)-(19,41)
*)

(* all spans
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(13,14)-(20,18)
(14,2)-(20,18)
(14,21)-(19,48)
(14,23)-(19,48)
(14,25)-(19,48)
(15,4)-(19,48)
(15,10)-(15,11)
(16,15)-(16,16)
(17,15)-(17,16)
(18,17)-(18,39)
(18,17)-(18,27)
(18,28)-(18,32)
(18,33)-(18,35)
(18,36)-(18,37)
(18,38)-(18,39)
(19,19)-(19,48)
(19,19)-(19,29)
(19,30)-(19,41)
(19,42)-(19,44)
(19,45)-(19,46)
(19,47)-(19,48)
(20,2)-(20,18)
(20,2)-(20,12)
(20,13)-(20,14)
(20,15)-(20,16)
(20,17)-(20,18)
*)
