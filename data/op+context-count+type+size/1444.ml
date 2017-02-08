
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
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> cos (eval (a, x, y))
  | Average (a,b) -> ((eval (a, x, y)), (eval (b, x, y))) / 2;;


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
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> cos (eval (a, x, y))
  | Average (a,b) -> (eval (a, x, y)) +. (eval (b, x, y));;

*)

(* changed spans
(17,24)-(17,55)
(17,24)-(17,62)
(17,61)-(17,62)
*)

(* type error slice
(12,3)-(17,62)
(12,3)-(17,62)
(15,15)-(15,18)
(15,15)-(15,33)
(17,24)-(17,55)
(17,24)-(17,62)
(17,24)-(17,62)
*)
