
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
(15,33)-(15,35)
(16,18)-(16,37)
(16,35)-(16,37)
(17,25)-(17,39)
(18,22)-(18,23)
(18,27)-(18,28)
*)

(* type error slice
(13,4)-(18,30)
(13,15)-(18,28)
(14,3)-(18,28)
(14,9)-(14,10)
(15,16)-(15,19)
(15,16)-(15,35)
(15,21)-(15,35)
(15,28)-(15,32)
(15,28)-(15,35)
(15,33)-(15,35)
(17,25)-(17,26)
(17,25)-(17,31)
(17,30)-(17,31)
*)
