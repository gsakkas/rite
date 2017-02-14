
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
    | Sine p1 -> evalhelper (buildSine p1) x y
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
(16,2)-(22,18)
(20,17)-(20,46)
(20,28)-(20,42)
(20,29)-(20,38)
(21,19)-(21,29)
(21,19)-(21,48)
(21,30)-(21,41)
*)

(* type error slice
(11,3)-(11,30)
(11,16)-(11,28)
(13,3)-(13,26)
(13,14)-(13,24)
(13,18)-(13,24)
(20,17)-(20,27)
(20,17)-(20,46)
(20,28)-(20,42)
(20,29)-(20,38)
(21,19)-(21,29)
(21,19)-(21,48)
(21,30)-(21,41)
*)
