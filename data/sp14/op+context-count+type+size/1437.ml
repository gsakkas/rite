
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> buildX ()
  | VarY  -> buildY ()
  | Sine a -> sin (pi *. VarX)
  | Cosine a -> cos (pi *. y);;


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
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. x)
  | Cosine a -> cos (pi *. y);;

*)

(* changed spans
(11,12)-(11,21)
(11,17)-(11,21)
(13,12)-(13,21)
(13,17)-(13,21)
(19,14)-(19,20)
(19,14)-(19,23)
(19,21)-(19,23)
(20,14)-(20,20)
(20,14)-(20,23)
(20,21)-(20,23)
(21,15)-(21,30)
(22,17)-(22,29)
*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(11,17)-(11,21)
(18,3)-(22,29)
(18,3)-(22,29)
(18,3)-(22,29)
(19,14)-(19,20)
(19,14)-(19,23)
(21,15)-(21,18)
(21,15)-(21,30)
(21,20)-(21,30)
(21,26)-(21,30)
(22,17)-(22,20)
(22,17)-(22,29)
*)
