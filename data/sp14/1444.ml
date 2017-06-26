
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
  | Sine a -> sin (pi * a)
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
(17,18)-(17,26)
(17,24)-(17,25)
(18,27)-(18,28)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(14,2)-(18,29)
(17,14)-(17,17)
(17,14)-(17,26)
(17,18)-(17,26)
(17,19)-(17,21)
(17,24)-(17,25)
(18,20)-(18,29)
(18,27)-(18,28)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(18,29)
(14,2)-(18,29)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,14)-(17,26)
(17,14)-(17,17)
(17,18)-(17,26)
(17,19)-(17,21)
(17,24)-(17,25)
(18,16)-(18,29)
(18,16)-(18,19)
(18,20)-(18,29)
(18,21)-(18,23)
(18,27)-(18,28)
*)
