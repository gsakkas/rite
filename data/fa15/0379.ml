
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
  | varX -> x
  | varY -> y
  | Sine t -> sin (pi *. t)
  | Cosine t -> cos (pi *. t)
  | Average (t,s) -> (t +. s) /. 2;;


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
  | varX -> x
  | varY -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0;;

*)

(* changed spans
(17,25)-(17,26)
(18,16)-(18,29)
(18,27)-(18,28)
(19,21)-(19,34)
(19,22)-(19,23)
(19,27)-(19,28)
(19,33)-(19,34)
*)

(* type error slice
(14,2)-(19,34)
(17,18)-(17,27)
(17,25)-(17,26)
(18,20)-(18,29)
(18,27)-(18,28)
(19,21)-(19,29)
(19,21)-(19,34)
(19,22)-(19,23)
(19,27)-(19,28)
(19,33)-(19,34)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(19,34)
(14,2)-(19,34)
(14,8)-(14,9)
(15,12)-(15,13)
(16,12)-(16,13)
(17,14)-(17,27)
(17,14)-(17,17)
(17,18)-(17,27)
(17,19)-(17,21)
(17,25)-(17,26)
(18,16)-(18,29)
(18,16)-(18,19)
(18,20)-(18,29)
(18,21)-(18,23)
(18,27)-(18,28)
(19,21)-(19,34)
(19,21)-(19,29)
(19,22)-(19,23)
(19,27)-(19,28)
(19,33)-(19,34)
*)
