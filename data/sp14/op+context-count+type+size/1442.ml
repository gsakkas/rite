
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
(17,18)-(17,33)
(17,30)-(17,31)
(18,27)-(18,28)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(14,2)-(18,29)
(17,14)-(17,17)
(17,14)-(17,33)
(17,18)-(17,33)
(17,18)-(17,33)
(17,26)-(17,28)
(18,20)-(18,29)
(18,27)-(18,28)
*)
