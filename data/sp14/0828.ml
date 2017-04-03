
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
  | Cosine a -> cos ((eval (a, x, y)) *. pi)
  | Average (a,b) -> (eval (a, x, y)) +. ((eval (b, x, y)) /. 2)
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
  | Cosine a -> cos ((eval (a, x, y)) *. pi)
  | Average (a,b) -> (eval (a, x, y)) +. ((eval (b, x, y)) /. 2.)
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;

*)

(* changed spans
(21,62)-(21,63)
*)

(* type error slice
(21,41)-(21,64)
(21,62)-(21,63)
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
(19,14)-(19,42)
(19,14)-(19,17)
(19,18)-(19,42)
(19,19)-(19,35)
(19,20)-(19,24)
(19,25)-(19,34)
(19,26)-(19,27)
(19,29)-(19,30)
(19,32)-(19,33)
(19,39)-(19,41)
(20,16)-(20,44)
(20,16)-(20,19)
(20,20)-(20,44)
(20,21)-(20,37)
(20,22)-(20,26)
(20,27)-(20,36)
(20,28)-(20,29)
(20,31)-(20,32)
(20,34)-(20,35)
(20,41)-(20,43)
(21,21)-(21,64)
(21,21)-(21,37)
(21,22)-(21,26)
(21,27)-(21,36)
(21,28)-(21,29)
(21,31)-(21,32)
(21,34)-(21,35)
(21,41)-(21,64)
(21,42)-(21,58)
(21,43)-(21,47)
(21,48)-(21,57)
(21,49)-(21,50)
(21,52)-(21,53)
(21,55)-(21,56)
(21,62)-(21,63)
(22,19)-(22,20)
(23,24)-(23,25)
*)
