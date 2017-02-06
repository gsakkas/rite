
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
  | Sine ex -> sin (pi *. (eval ex x y));;


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
  | Sine ex -> sin (pi *. (eval (ex, x, y)));;

*)

(* changed spans
(17,28)-(17,39)
(17,33)-(17,35)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(13,4)-(17,43)
(13,15)-(17,39)
(14,3)-(17,39)
(14,3)-(17,39)
(14,3)-(17,39)
(14,3)-(17,39)
(14,3)-(17,39)
(14,3)-(17,39)
(14,3)-(17,39)
(14,3)-(17,39)
(14,9)-(14,10)
(15,14)-(15,15)
(16,14)-(16,15)
(17,16)-(17,19)
(17,16)-(17,39)
(17,21)-(17,23)
(17,21)-(17,39)
(17,21)-(17,39)
(17,28)-(17,32)
(17,28)-(17,39)
(17,28)-(17,39)
(17,28)-(17,39)
(17,28)-(17,39)
(17,33)-(17,35)
(17,36)-(17,37)
(17,38)-(17,39)
*)
