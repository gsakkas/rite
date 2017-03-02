
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
  | Sine a -> sin (pi *. VarX)
  | Cosine a -> cos (pi *. VarY);;


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
(17,25)-(17,29)
(18,27)-(18,31)
*)

(* type error slice
(17,18)-(17,30)
(17,25)-(17,29)
(18,20)-(18,32)
(18,27)-(18,31)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(18,32)
(14,2)-(18,32)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,14)-(17,30)
(17,14)-(17,17)
(17,18)-(17,30)
(17,19)-(17,21)
(17,25)-(17,29)
(18,16)-(18,32)
(18,16)-(18,19)
(18,20)-(18,32)
(18,21)-(18,23)
(18,27)-(18,31)
*)
