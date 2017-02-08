
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
(12,3)-(12,76)
(12,27)-(12,28)
(12,64)-(12,66)
(12,64)-(12,71)
(12,64)-(12,76)
(12,69)-(12,71)
(12,75)-(12,76)
*)

(* type error slice
(12,3)-(12,76)
(12,3)-(12,76)
(12,64)-(12,66)
(12,64)-(12,71)
(12,64)-(12,71)
(12,69)-(12,71)
*)
