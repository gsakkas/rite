
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | Average (x',y') -> (x +. y) /. 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | Average (x',y') -> (x +. y) /. 2.0;;

*)

(* changed spans
(11,70)-(11,71)
2.0
LitG

*)

(* type error slice
(11,58)-(11,71)
(11,70)-(11,71)
*)
