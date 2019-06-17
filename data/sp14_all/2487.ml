
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
(16,16)-(16,23)
x
VarG

(17,16)-(17,23)
y
VarG

(18,29)-(18,44)
evalhelper p1 x y
AppG [VarG,VarG,VarG]

(19,31)-(19,46)
evalhelper p1 x y
AppG [VarG,VarG,VarG]

*)

(* type error slice
(14,3)-(20,19)
(14,22)-(19,47)
(14,24)-(19,47)
(18,22)-(18,45)
(18,29)-(18,44)
(18,30)-(18,40)
(20,3)-(20,13)
(20,3)-(20,19)
*)
