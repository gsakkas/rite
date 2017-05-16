
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
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2;;


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
(19,63)-(19,64)
*)

(* type error slice
(19,21)-(19,64)
(19,63)-(19,64)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(19,64)
(14,2)-(19,64)
(14,8)-(14,9)
(15,12)-(15,13)
(16,12)-(16,13)
(17,14)-(17,42)
(17,14)-(17,17)
(17,18)-(17,42)
(17,19)-(17,21)
(17,25)-(17,41)
(17,26)-(17,30)
(17,31)-(17,40)
(17,32)-(17,33)
(17,35)-(17,36)
(17,38)-(17,39)
(18,16)-(18,44)
(18,16)-(18,19)
(18,20)-(18,44)
(18,21)-(18,23)
(18,27)-(18,43)
(18,28)-(18,32)
(18,33)-(18,42)
(18,34)-(18,35)
(18,37)-(18,38)
(18,40)-(18,41)
(19,21)-(19,64)
(19,21)-(19,59)
(19,22)-(19,38)
(19,23)-(19,27)
(19,28)-(19,37)
(19,29)-(19,30)
(19,32)-(19,33)
(19,35)-(19,36)
(19,42)-(19,58)
(19,43)-(19,47)
(19,48)-(19,57)
(19,49)-(19,50)
(19,52)-(19,53)
(19,55)-(19,56)
(19,63)-(19,64)
*)
