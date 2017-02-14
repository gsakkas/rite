
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Average (x',y') -> (x' + y') / 2;;


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
(12,2)-(12,75)
(12,26)-(12,27)
(12,62)-(12,71)
(12,62)-(12,75)
(12,63)-(12,65)
(12,68)-(12,70)
(12,74)-(12,75)
*)

(* type error slice
(12,2)-(12,75)
(12,2)-(12,75)
(12,62)-(12,71)
(12,62)-(12,71)
(12,63)-(12,65)
(12,68)-(12,70)
*)
