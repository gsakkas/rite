
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
  | VarX  -> 1.0
  | VarY  -> 1.0
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
(15,14)-(15,17)
x
VarG

(16,14)-(16,17)
y
VarG

(17,20)-(17,44)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(13,4)-(17,46)
(13,15)-(17,44)
(14,3)-(17,44)
(15,14)-(15,17)
(17,16)-(17,19)
(17,16)-(17,44)
(17,20)-(17,44)
(17,21)-(17,23)
(17,26)-(17,43)
(17,27)-(17,31)
*)
