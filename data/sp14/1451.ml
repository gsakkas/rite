
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
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2;;


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
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0;;

*)

(* changed spans
(17,64)-(17,65)
2.0
LitG

*)

(* type error slice
(17,22)-(17,65)
(17,64)-(17,65)
*)
