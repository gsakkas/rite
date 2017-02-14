
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
(16,15)-(16,20)
(16,15)-(16,22)
(17,15)-(17,20)
(17,15)-(17,22)
(18,28)-(18,43)
(19,19)-(19,46)
(19,30)-(19,45)
(20,2)-(20,18)
*)

(* type error slice
(14,2)-(20,18)
(14,21)-(19,46)
(14,23)-(19,46)
(18,21)-(18,44)
(18,28)-(18,43)
(18,29)-(18,39)
(20,2)-(20,12)
(20,2)-(20,18)
*)
