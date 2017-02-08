
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
(15,16)-(15,19)
(15,16)-(15,35)
(15,21)-(15,25)
(15,21)-(15,35)
(17,46)-(17,50)
(17,46)-(17,60)
(17,46)-(17,66)
*)
