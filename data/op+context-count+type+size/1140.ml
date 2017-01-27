
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
  | VarX  -> float_of_int x
  | VarY  -> float_of_int y
  | Sine e1 -> sin (pi * (eval (e1, x, y)))
  | Cosine e1 -> cos (pi * (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) + (eval (e1, x, y))) / 2
  | Times (e1,e2) -> (eval (e1, x, y)) * (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y)) then eval (e3, x, y);;


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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e1, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) when (eval (e1, x, y)) < (eval (e2, x, y)) ->
      eval (e3, x, y);;

*)

(* changed spans
(15,14)-(15,26)
(15,14)-(15,28)
(16,14)-(16,26)
(16,14)-(16,28)
(17,21)-(17,41)
(18,23)-(18,43)
(19,26)-(19,40)
(19,26)-(19,60)
(19,26)-(19,67)
(19,66)-(19,67)
(20,23)-(20,37)
(20,23)-(20,57)
(22,7)-(22,67)
(22,11)-(22,45)
(22,31)-(22,45)
(22,53)-(22,67)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(13,4)-(22,70)
(13,15)-(22,67)
(14,3)-(22,67)
(14,9)-(14,10)
(15,14)-(15,26)
(15,14)-(15,28)
(15,27)-(15,28)
(16,14)-(16,26)
(16,14)-(16,28)
(16,27)-(16,28)
(17,16)-(17,19)
(17,16)-(17,41)
(17,21)-(17,23)
(17,21)-(17,41)
(17,27)-(17,31)
(17,27)-(17,41)
(17,33)-(17,35)
(17,33)-(17,41)
(17,37)-(17,38)
(17,40)-(17,41)
(18,18)-(18,21)
(18,18)-(18,43)
(18,23)-(18,25)
(18,23)-(18,43)
(19,26)-(19,67)
(20,23)-(20,57)
(22,7)-(22,67)
(22,53)-(22,57)
(22,53)-(22,67)
(22,59)-(22,61)
(22,59)-(22,67)
(22,63)-(22,64)
(22,66)-(22,67)
*)
