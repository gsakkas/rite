
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
  | VarX  -> x *. 1.0
  | VarY  -> y *. 1.0
  | Sine e1 -> sin (pi * (eval (e1, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin (eval (e1, x, y));;

*)

(* changed spans
(11,9)-(11,12)
(11,9)-(11,26)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(15,13)-(15,21)
(15,18)-(15,21)
(16,13)-(16,21)
(16,18)-(16,21)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(13,3)-(17,45)
(13,14)-(17,43)
(14,2)-(17,43)
(15,13)-(15,21)
(17,15)-(17,18)
(17,15)-(17,43)
(17,19)-(17,43)
(17,19)-(17,43)
(17,19)-(17,43)
(17,20)-(17,22)
(17,25)-(17,42)
(17,26)-(17,30)
*)
