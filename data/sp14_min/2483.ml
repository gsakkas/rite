
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
(18,22)-(18,44)
pi *. evalhelper p1 x y
BopG VarG (AppG [EmptyG,EmptyG,EmptyG])

(19,20)-(19,33)
cos (pi *. evalhelper p1 x y)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(15,5)-(19,33)
(18,18)-(18,21)
(18,18)-(18,44)
(18,22)-(18,44)
(18,23)-(18,25)
(18,28)-(18,43)
(18,29)-(18,39)
(19,20)-(19,30)
(19,20)-(19,33)
(20,3)-(20,13)
(20,3)-(20,19)
*)
