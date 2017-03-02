
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
  | Sine e' -> sin (pi *. (eval e'))
  | Cosine e' -> cos (pi *. (eval e'))
  | Average (x',y') -> (x +. y) /. 2.0
  | Times (x',y') -> x *. y;;


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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (x',y') -> (x +. y) /. 2.0
  | Times (x',y') -> x *. y;;

*)

(* changed spans
(15,32)-(15,34)
(16,17)-(16,38)
(16,34)-(16,36)
(17,23)-(17,38)
*)

(* type error slice
(13,3)-(18,29)
(13,14)-(18,27)
(14,2)-(18,27)
(15,26)-(15,35)
(15,27)-(15,31)
(15,32)-(15,34)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(18,27)
(14,2)-(18,27)
(14,8)-(14,9)
(15,15)-(15,36)
(15,15)-(15,18)
(15,19)-(15,36)
(15,20)-(15,22)
(15,26)-(15,35)
(15,27)-(15,31)
(15,32)-(15,34)
(16,17)-(16,38)
(16,17)-(16,20)
(16,21)-(16,38)
(16,22)-(16,24)
(16,28)-(16,37)
(16,29)-(16,33)
(16,34)-(16,36)
(17,23)-(17,38)
(17,23)-(17,31)
(17,24)-(17,25)
(17,29)-(17,30)
(17,35)-(17,38)
(18,21)-(18,27)
(18,21)-(18,22)
(18,26)-(18,27)
*)
