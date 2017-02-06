
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
*)

(* type error slice
(11,4)-(11,73)
(11,15)-(11,71)
(11,30)-(11,31)
(11,59)-(11,60)
(11,59)-(11,71)
(11,64)-(11,65)
(11,70)-(11,71)
*)
