
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let rec eval (e,x,y) =
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> evalhelper buildSine p1 x y
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
(20,18)-(20,45)
sin (pi *. evalhelper p1 x y)
AppG [BopG EmptyG EmptyG]

(21,20)-(21,49)
cos (pi *. evalhelper p1 x y)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(16,3)-(22,19)
(16,22)-(21,49)
(16,24)-(21,49)
(16,26)-(21,49)
(17,5)-(21,49)
(21,20)-(21,30)
(21,20)-(21,49)
*)
