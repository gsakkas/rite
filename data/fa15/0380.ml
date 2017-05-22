
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
  | Sine t -> sin (pi *. (eval t x y))
  | Cosine t -> cos (pi *. (eval t x y))
  | Average (t,s) -> ((eval t x y) +. (eval s x y)) /. 2;;


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
(17,25)-(17,37)
(17,31)-(17,32)
(18,27)-(18,39)
(18,33)-(18,34)
(19,22)-(19,34)
(19,28)-(19,29)
(19,38)-(19,50)
(19,44)-(19,45)
(19,55)-(19,56)
*)

(* type error slice
(13,3)-(19,58)
(13,14)-(19,56)
(14,2)-(19,56)
(17,25)-(17,37)
(17,26)-(17,30)
(17,31)-(17,32)
(19,21)-(19,56)
(19,55)-(19,56)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(19,56)
(14,2)-(19,56)
(14,8)-(14,9)
(15,12)-(15,13)
(16,12)-(16,13)
(17,14)-(17,38)
(17,14)-(17,17)
(17,18)-(17,38)
(17,19)-(17,21)
(17,25)-(17,37)
(17,26)-(17,30)
(17,31)-(17,32)
(17,33)-(17,34)
(17,35)-(17,36)
(18,16)-(18,40)
(18,16)-(18,19)
(18,20)-(18,40)
(18,21)-(18,23)
(18,27)-(18,39)
(18,28)-(18,32)
(18,33)-(18,34)
(18,35)-(18,36)
(18,37)-(18,38)
(19,21)-(19,56)
(19,21)-(19,51)
(19,22)-(19,34)
(19,23)-(19,27)
(19,28)-(19,29)
(19,30)-(19,31)
(19,32)-(19,33)
(19,38)-(19,50)
(19,39)-(19,43)
(19,44)-(19,45)
(19,46)-(19,47)
(19,48)-(19,49)
(19,55)-(19,56)
*)
