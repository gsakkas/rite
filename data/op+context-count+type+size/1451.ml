
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
  | Cosine a -> cos (pi *. a);;


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
(18,28)-(18,29)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(13,4)-(18,32)
(13,15)-(18,29)
(14,3)-(18,29)
(14,3)-(18,29)
(14,3)-(18,29)
(14,3)-(18,29)
(14,3)-(18,29)
(14,3)-(18,29)
(14,9)-(14,10)
(15,14)-(15,15)
(16,14)-(16,15)
(17,15)-(17,18)
(17,15)-(17,27)
(17,20)-(17,22)
(17,20)-(17,27)
(17,20)-(17,27)
(17,26)-(17,27)
(18,17)-(18,20)
(18,22)-(18,24)
(18,22)-(18,29)
(18,28)-(18,29)
*)
