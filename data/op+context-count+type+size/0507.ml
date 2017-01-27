
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
    | Average (p1,p2) -> ((evalhelper p1 x y) * (evalhelper p2 x y)) / 2 in
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
(20,28)-(20,45)
(20,28)-(20,67)
(20,28)-(20,73)
(20,72)-(20,73)
*)

(* type error slice
(15,5)-(20,73)
(16,16)-(16,17)
(18,30)-(18,40)
(18,30)-(18,47)
(18,41)-(18,43)
(18,44)-(18,45)
(18,46)-(18,47)
(20,28)-(20,38)
(20,28)-(20,45)
(20,28)-(20,67)
(20,28)-(20,73)
(20,39)-(20,41)
(20,42)-(20,43)
(20,44)-(20,45)
(20,50)-(20,60)
(20,50)-(20,67)
(20,61)-(20,63)
(20,64)-(20,65)
(20,66)-(20,67)
*)
