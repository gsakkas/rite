
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
  | Sine a -> sin (Times (pi, a))
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
(17,19)-(17,34)
pi *. x
BopG VarG VarG

(18,28)-(18,29)
y
VarG

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(14,3)-(18,30)
(17,15)-(17,18)
(17,15)-(17,34)
(17,19)-(17,34)
(17,27)-(17,29)
(18,21)-(18,30)
(18,28)-(18,29)
*)
