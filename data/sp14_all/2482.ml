
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
(18,18)-(18,40)
sin (pi *. evalhelper p1 x y)
AppG [BopG EmptyG EmptyG]

(19,20)-(19,49)
cos (pi *. evalhelper p1 x y)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(11,4)-(11,31)
(11,17)-(11,29)
(14,3)-(20,19)
(14,22)-(19,49)
(14,24)-(19,49)
(14,26)-(19,49)
(15,5)-(19,49)
(18,18)-(18,28)
(18,18)-(18,40)
(18,29)-(18,33)
(19,20)-(19,30)
(19,20)-(19,49)
(19,31)-(19,42)
*)
