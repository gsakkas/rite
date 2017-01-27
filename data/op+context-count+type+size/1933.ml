
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
  | Cosine a -> cos pi
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
(16,21)-(16,53)
(17,24)-(17,37)
(17,24)-(17,56)
(17,24)-(17,63)
(17,62)-(17,63)
(18,21)-(18,23)
(19,15)-(19,18)
(19,15)-(19,39)
(19,20)-(19,22)
(19,20)-(19,39)
(20,14)-(20,15)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(14,3)-(21,15)
(15,25)-(15,29)
(15,25)-(15,38)
(15,31)-(15,32)
(15,31)-(15,38)
(15,34)-(15,35)
(15,37)-(15,38)
(16,21)-(16,25)
(16,21)-(16,34)
(16,27)-(16,28)
(16,27)-(16,34)
(16,30)-(16,31)
(16,33)-(16,34)
(18,17)-(18,20)
(18,17)-(18,23)
(18,21)-(18,23)
(19,15)-(19,18)
(19,15)-(19,39)
(19,20)-(19,22)
(19,20)-(19,39)
*)
