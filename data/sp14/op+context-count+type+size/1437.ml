
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
(11,11)-(11,20)
(11,16)-(11,20)
(13,11)-(13,20)
(13,16)-(13,20)
(19,13)-(19,19)
(19,13)-(19,22)
(19,20)-(19,22)
(20,13)-(20,19)
(20,13)-(20,22)
(20,20)-(20,22)
(21,14)-(21,30)
(22,16)-(22,29)
*)

(* type error slice
(11,3)-(11,22)
(11,11)-(11,20)
(11,16)-(11,20)
(18,2)-(22,29)
(18,2)-(22,29)
(18,2)-(22,29)
(19,13)-(19,19)
(19,13)-(19,22)
(21,14)-(21,17)
(21,14)-(21,30)
(21,18)-(21,30)
(21,25)-(21,29)
(22,16)-(22,19)
(22,16)-(22,29)
*)
