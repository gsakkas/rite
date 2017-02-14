
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
  | Average (e1,e2) -> ((eval (e1, x, y)) + (eval (e2, x, y))) / 2;;


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
  | Average (e1,e2) -> (eval (e1, x, y)) +. (eval (e2, x, y));;

*)

(* changed spans
(17,23)-(17,62)
(17,23)-(17,66)
(17,65)-(17,66)
*)

(* type error slice
(15,15)-(15,18)
(15,15)-(15,36)
(15,19)-(15,36)
(15,20)-(15,24)
(17,23)-(17,62)
(17,23)-(17,62)
(17,24)-(17,41)
(17,25)-(17,29)
(17,44)-(17,61)
(17,45)-(17,49)
*)
