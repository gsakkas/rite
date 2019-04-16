
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
(18,29)-(18,44)
evalhelper p1 x y
AppG (fromList [VarG])

(19,20)-(19,33)
cos (pi *. evalhelper p1 x y)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(14,3)-(20,19)
(14,22)-(19,33)
(14,24)-(19,33)
(18,22)-(18,45)
(18,29)-(18,44)
(18,30)-(18,40)
(20,3)-(20,13)
(20,3)-(20,19)
*)
