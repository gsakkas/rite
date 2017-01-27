
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
    | Sine p1 -> sin (pi *. (evalhelper p1))
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
(18,30)-(18,43)
(19,20)-(19,45)
(19,32)-(19,45)
(20,3)-(20,19)
*)

(* type error slice
(14,3)-(20,19)
(14,22)-(19,45)
(14,24)-(19,45)
(14,26)-(19,45)
(15,5)-(19,45)
(15,11)-(15,12)
(16,16)-(16,17)
(17,16)-(17,17)
(18,18)-(18,21)
(18,18)-(18,43)
(18,23)-(18,43)
(18,30)-(18,40)
(18,30)-(18,43)
(18,41)-(18,43)
(20,3)-(20,13)
(20,3)-(20,19)
(20,14)-(20,15)
(20,16)-(20,17)
(20,18)-(20,19)
*)
