
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
(19,21)-(19,41)
*)

(* type error slice
(13,4)-(13,29)
(13,10)-(13,26)
(15,15)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,9)-(16,10)
(17,14)-(17,15)
(18,14)-(18,15)
(19,15)-(19,18)
(19,15)-(19,41)
(19,15)-(19,41)
(19,21)-(19,25)
(19,21)-(19,34)
(19,21)-(19,34)
(19,21)-(19,41)
(19,21)-(19,41)
(19,21)-(19,41)
(19,27)-(19,28)
(19,27)-(19,34)
(19,30)-(19,31)
(19,33)-(19,34)
(19,39)-(19,41)
(20,17)-(20,18)
(21,22)-(21,23)
(22,20)-(22,21)
(23,25)-(23,26)
*)
