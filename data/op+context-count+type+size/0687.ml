
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin ((eval (a, x, y)) * 2.)
  | Cosine a -> x
  | Average (a,b) -> x
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin ((eval (a, x, y)) *. pi)
  | Cosine a -> x
  | Average (a,b) -> x
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;

*)

(* changed spans
(13,15)-(21,26)
(17,21)-(17,41)
(17,39)-(17,41)
*)

(* type error slice
(13,15)-(21,26)
(14,3)-(21,26)
(14,3)-(21,26)
(14,3)-(21,26)
(14,9)-(14,10)
(15,14)-(15,15)
(16,14)-(16,15)
(17,15)-(17,18)
(17,15)-(17,41)
(17,15)-(17,41)
(17,21)-(17,25)
(17,21)-(17,34)
(17,21)-(17,34)
(17,21)-(17,41)
(17,21)-(17,41)
(17,21)-(17,41)
(17,27)-(17,28)
(17,27)-(17,34)
(17,30)-(17,31)
(17,33)-(17,34)
(17,39)-(17,41)
(18,17)-(18,18)
(19,22)-(19,23)
(20,20)-(20,21)
(21,25)-(21,26)
*)
