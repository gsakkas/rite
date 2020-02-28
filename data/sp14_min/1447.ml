
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
  | Sine a -> sin (eval (e, x, a))
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
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> cos (pi *. y);;

*)

(* changed spans
(17,26)-(17,27)
a
VarG

(17,32)-(17,33)
y
VarG

*)

(* type error slice
(13,4)-(18,32)
(13,15)-(18,30)
(14,3)-(18,30)
(17,19)-(17,35)
(17,20)-(17,24)
(17,25)-(17,34)
(17,32)-(17,33)
(18,21)-(18,30)
(18,28)-(18,29)
*)
