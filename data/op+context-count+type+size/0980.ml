
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (eval (e1, x, y))
  | Cosine e1 -> cos (eval (e1, x, y))
  | Average (e1,e2) -> (eval (e1, x, y)) + ((eval (e2, x, y)) / 2);;


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
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (eval (e1, x, y))
  | Cosine e1 -> cos (eval (e1, x, y))
  | Average (e1,e2) -> (eval (e1, x, y)) +. ((eval (e2, x, y)) /. 2.0);;

*)

(* changed spans
(17,25)-(17,66)
(17,46)-(17,66)
(17,65)-(17,66)
*)

(* type error slice
(12,3)-(17,66)
(13,14)-(13,15)
(15,21)-(15,25)
(15,21)-(15,35)
(15,27)-(15,29)
(15,27)-(15,35)
(15,31)-(15,32)
(15,34)-(15,35)
(17,25)-(17,29)
(17,25)-(17,39)
(17,25)-(17,66)
(17,31)-(17,33)
(17,31)-(17,39)
(17,35)-(17,36)
(17,38)-(17,39)
(17,46)-(17,50)
(17,46)-(17,60)
(17,46)-(17,66)
(17,52)-(17,54)
(17,52)-(17,60)
(17,56)-(17,57)
(17,59)-(17,60)
*)
