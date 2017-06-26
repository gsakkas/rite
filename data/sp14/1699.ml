
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
  | Sine a -> sin ((eval (a, x, y)) * pi)
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
(19,18)-(19,41)
*)

(* type error slice
(13,3)-(13,28)
(13,9)-(13,26)
(19,14)-(19,17)
(19,14)-(19,41)
(19,18)-(19,41)
(19,38)-(19,40)
*)

(* all spans
(11,8)-(11,14)
(11,9)-(11,10)
(11,12)-(11,13)
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(23,25)
(16,2)-(23,25)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,14)-(19,41)
(19,14)-(19,17)
(19,18)-(19,41)
(19,19)-(19,35)
(19,20)-(19,24)
(19,25)-(19,34)
(19,26)-(19,27)
(19,29)-(19,30)
(19,32)-(19,33)
(19,38)-(19,40)
(20,16)-(20,17)
(21,21)-(21,22)
(22,19)-(22,20)
(23,24)-(23,25)
*)
