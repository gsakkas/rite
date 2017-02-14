
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
  | Average (x',y') -> ((eval (VarX, x', y)) + (eval (VarY, x, y'))) / 2;;


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
(12,2)-(15,72)
(13,13)-(13,14)
(15,23)-(15,68)
(15,23)-(15,72)
(15,24)-(15,44)
(15,25)-(15,29)
(15,30)-(15,43)
(15,47)-(15,67)
(15,71)-(15,72)
*)

(* type error slice
(11,3)-(15,74)
(11,14)-(15,72)
(12,2)-(15,72)
(12,2)-(15,72)
(12,2)-(15,72)
(13,13)-(13,14)
(15,23)-(15,68)
(15,23)-(15,72)
(15,24)-(15,44)
(15,25)-(15,29)
(15,30)-(15,43)
(15,37)-(15,39)
(15,47)-(15,67)
(15,48)-(15,52)
(15,53)-(15,66)
(15,60)-(15,61)
*)
