
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
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,14)-(22,18)
(20,17)-(20,27)
(20,17)-(20,44)
(20,28)-(20,37)
(21,19)-(21,29)
(21,19)-(21,48)
(21,30)-(21,41)
*)

(* type error slice
(16,2)-(22,18)
(16,21)-(21,48)
(16,23)-(21,48)
(16,25)-(21,48)
(17,4)-(21,48)
(21,19)-(21,29)
(21,19)-(21,48)
*)

(* all spans
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,14)-(22,18)
(16,2)-(22,18)
(16,21)-(21,48)
(16,23)-(21,48)
(16,25)-(21,48)
(17,4)-(21,48)
(17,10)-(17,11)
(18,15)-(18,16)
(19,15)-(19,16)
(20,17)-(20,44)
(20,17)-(20,27)
(20,28)-(20,37)
(20,38)-(20,40)
(20,41)-(20,42)
(20,43)-(20,44)
(21,19)-(21,48)
(21,19)-(21,29)
(21,30)-(21,41)
(21,42)-(21,44)
(21,45)-(21,46)
(21,47)-(21,48)
(22,2)-(22,18)
(22,2)-(22,12)
(22,13)-(22,14)
(22,15)-(22,16)
(22,17)-(22,18)
*)
