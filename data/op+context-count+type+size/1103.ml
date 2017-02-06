
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

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)));;

*)

(* changed spans
(17,21)-(17,41)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(13,15)-(17,41)
(14,3)-(17,41)
(14,3)-(17,41)
(14,3)-(17,41)
(14,3)-(17,41)
(14,3)-(17,41)
(14,3)-(17,41)
(14,9)-(14,10)
(15,14)-(15,15)
(16,14)-(16,15)
(17,16)-(17,19)
(17,16)-(17,41)
(17,16)-(17,41)
(17,21)-(17,23)
(17,21)-(17,41)
(17,21)-(17,41)
(17,21)-(17,41)
(17,27)-(17,31)
(17,27)-(17,41)
(17,27)-(17,41)
(17,33)-(17,35)
(17,33)-(17,41)
(17,37)-(17,38)
(17,40)-(17,41)
*)
