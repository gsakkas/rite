
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
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval a))
  | Cosine a -> cos (pi *. (eval a))
  | Average (a,b) -> ((eval a) +. (eval b)) / 2
  | Times (a,b) -> (eval a) *. (eval b)
  | Thresh (a,b,c,d) -> if (eval a) < (eval b) then eval c else eval d;;


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
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(17,32)-(17,33)
(18,17)-(18,35)
(18,34)-(18,35)
(19,24)-(19,42)
(19,24)-(19,48)
(19,29)-(19,30)
(19,36)-(19,42)
(19,41)-(19,42)
(19,47)-(19,48)
(20,21)-(20,39)
(20,26)-(20,27)
(20,33)-(20,39)
(20,38)-(20,39)
(21,29)-(21,33)
(21,29)-(21,35)
(21,29)-(21,46)
(21,34)-(21,35)
(21,40)-(21,44)
(21,40)-(21,46)
(21,45)-(21,46)
(21,53)-(21,57)
(21,53)-(21,59)
(21,58)-(21,59)
(21,65)-(21,69)
(21,65)-(21,71)
(21,70)-(21,71)
*)

(* type error slice
(13,4)-(21,73)
(13,15)-(21,71)
(14,3)-(21,71)
(14,9)-(14,10)
(15,14)-(15,15)
(16,14)-(16,15)
(17,15)-(17,18)
(17,15)-(17,33)
(17,20)-(17,33)
(17,27)-(17,31)
(17,27)-(17,33)
(17,32)-(17,33)
(19,24)-(19,42)
(19,24)-(19,48)
*)
