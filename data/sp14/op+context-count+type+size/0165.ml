
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
  | Average (x',y') -> ((eval x' y) + (eval x y')) / 2;;


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
(12,2)-(15,54)
(13,13)-(13,14)
(15,23)-(15,50)
(15,23)-(15,54)
(15,24)-(15,35)
(15,25)-(15,29)
(15,30)-(15,32)
(15,33)-(15,34)
(15,38)-(15,49)
(15,53)-(15,54)
*)

(* type error slice
(11,3)-(15,56)
(11,14)-(15,54)
(12,2)-(15,54)
(12,2)-(15,54)
(12,2)-(15,54)
(13,13)-(13,14)
(15,23)-(15,54)
(15,24)-(15,35)
(15,25)-(15,29)
(15,30)-(15,32)
(15,38)-(15,49)
(15,39)-(15,43)
(15,44)-(15,45)
*)
