
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
(13,14)-(21,25)
(17,18)-(17,41)
(17,38)-(17,40)
*)

(* type error slice
(17,14)-(17,17)
(17,14)-(17,41)
(17,18)-(17,41)
(17,38)-(17,40)
*)

(* all spans
(11,8)-(11,14)
(11,9)-(11,10)
(11,12)-(11,13)
(13,14)-(21,25)
(14,2)-(21,25)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,14)-(17,41)
(17,14)-(17,17)
(17,18)-(17,41)
(17,19)-(17,35)
(17,20)-(17,24)
(17,25)-(17,34)
(17,26)-(17,27)
(17,29)-(17,30)
(17,32)-(17,33)
(17,38)-(17,40)
(18,16)-(18,17)
(19,21)-(19,22)
(20,19)-(20,20)
(21,24)-(21,25)
*)
