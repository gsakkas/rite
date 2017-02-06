
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval x1) +. (eval x2)) /. 2.;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.;;

*)

(* changed spans
(19,31)-(19,33)
(19,39)-(19,46)
(19,44)-(19,46)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(13,15)-(19,54)
(14,3)-(19,54)
(14,3)-(19,54)
(14,3)-(19,54)
(14,3)-(19,54)
(14,3)-(19,54)
(14,3)-(19,54)
(14,3)-(19,54)
(14,3)-(19,54)
(14,3)-(19,54)
(14,3)-(19,54)
(14,3)-(19,54)
(14,9)-(14,10)
(15,14)-(15,15)
(16,14)-(16,15)
(17,16)-(17,19)
(17,16)-(17,42)
(17,21)-(17,23)
(17,21)-(17,42)
(17,21)-(17,42)
(17,28)-(17,32)
(17,28)-(17,42)
(17,28)-(17,42)
(17,34)-(17,36)
(17,34)-(17,42)
(17,38)-(17,39)
(17,41)-(17,42)
(18,18)-(18,21)
(18,18)-(18,44)
(18,23)-(18,25)
(18,23)-(18,44)
(18,30)-(18,34)
(18,30)-(18,44)
(18,30)-(18,44)
(18,36)-(18,38)
(18,36)-(18,44)
(18,40)-(18,41)
(18,43)-(18,44)
(19,26)-(19,30)
(19,26)-(19,33)
(19,26)-(19,33)
(19,31)-(19,33)
(19,39)-(19,43)
(19,39)-(19,46)
(19,39)-(19,46)
(19,44)-(19,46)
*)
