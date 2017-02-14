
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
(18,21)-(18,22)
(18,26)-(18,27)
*)

(* type error slice
(13,3)-(18,29)
(13,14)-(18,27)
(14,2)-(18,27)
(15,26)-(15,35)
(15,27)-(15,31)
(15,32)-(15,34)
*)
