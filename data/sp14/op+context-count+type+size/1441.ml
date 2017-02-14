
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
(17,20)-(17,26)
(17,25)-(17,26)
(18,28)-(18,29)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(14,3)-(18,29)
(14,3)-(18,29)
(17,15)-(17,18)
(17,15)-(17,26)
(17,20)-(17,22)
(17,20)-(17,26)
(17,20)-(17,26)
(17,20)-(17,26)
(17,25)-(17,26)
(18,22)-(18,29)
(18,28)-(18,29)
*)
