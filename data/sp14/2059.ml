
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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) * (eval (b, x, y))) / 2
  | Cosine a -> int_of_float cos (pi * (float_of_int (eval (a, x, y))))
  | Sine a -> sin (pi * (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;


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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) *. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi ** (eval (a, x, y)))
  | Sine a -> sin (pi ** (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;

*)

(* changed spans
(16,19)-(16,54)
(17,21)-(17,58)
(17,21)-(17,62)
(17,22)-(17,38)
(17,61)-(17,62)
(18,16)-(18,28)
(18,16)-(18,71)
(18,29)-(18,32)
(18,33)-(18,71)
(18,34)-(18,36)
(18,40)-(18,52)
(18,53)-(18,69)
(19,18)-(19,41)
(19,19)-(19,21)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(18,16)-(18,28)
(18,16)-(18,71)
(18,33)-(18,71)
(18,34)-(18,36)
(18,39)-(18,70)
(18,40)-(18,52)
(19,14)-(19,17)
(19,14)-(19,41)
(19,18)-(19,41)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(21,14)
(14,2)-(21,14)
(14,8)-(14,9)
(15,24)-(15,38)
(15,24)-(15,28)
(15,29)-(15,38)
(15,30)-(15,31)
(15,33)-(15,34)
(15,36)-(15,37)
(16,19)-(16,54)
(16,19)-(16,35)
(16,20)-(16,24)
(16,25)-(16,34)
(16,26)-(16,27)
(16,29)-(16,30)
(16,32)-(16,33)
(16,38)-(16,54)
(16,39)-(16,43)
(16,44)-(16,53)
(16,45)-(16,46)
(16,48)-(16,49)
(16,51)-(16,52)
(17,21)-(17,62)
(17,21)-(17,58)
(17,22)-(17,38)
(17,23)-(17,27)
(17,28)-(17,37)
(17,29)-(17,30)
(17,32)-(17,33)
(17,35)-(17,36)
(17,41)-(17,57)
(17,42)-(17,46)
(17,47)-(17,56)
(17,48)-(17,49)
(17,51)-(17,52)
(17,54)-(17,55)
(17,61)-(17,62)
(18,16)-(18,71)
(18,16)-(18,28)
(18,29)-(18,32)
(18,33)-(18,71)
(18,34)-(18,36)
(18,39)-(18,70)
(18,40)-(18,52)
(18,53)-(18,69)
(18,54)-(18,58)
(18,59)-(18,68)
(18,60)-(18,61)
(18,63)-(18,64)
(18,66)-(18,67)
(19,14)-(19,41)
(19,14)-(19,17)
(19,18)-(19,41)
(19,19)-(19,21)
(19,24)-(19,40)
(19,25)-(19,29)
(19,30)-(19,39)
(19,31)-(19,32)
(19,34)-(19,35)
(19,37)-(19,38)
(20,13)-(20,14)
(21,13)-(21,14)
*)
