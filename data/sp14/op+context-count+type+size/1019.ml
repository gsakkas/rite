
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
(15,13)-(15,25)
(15,13)-(15,27)
(16,13)-(16,25)
(16,13)-(16,27)
(17,19)-(17,43)
(18,21)-(18,45)
(19,23)-(19,62)
(19,23)-(19,66)
(19,24)-(19,41)
(19,65)-(19,66)
(20,21)-(20,38)
(20,21)-(20,58)
(22,6)-(22,67)
(22,9)-(22,46)
(22,20)-(22,21)
(22,29)-(22,46)
(22,52)-(22,67)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(14,2)-(22,67)
(14,2)-(22,67)
(14,2)-(22,67)
(14,2)-(22,67)
(15,13)-(15,25)
(15,13)-(15,27)
(17,15)-(17,18)
(17,15)-(17,43)
(17,19)-(17,43)
(17,19)-(17,43)
(17,19)-(17,43)
(17,20)-(17,22)
(17,25)-(17,42)
(17,26)-(17,30)
(18,17)-(18,20)
(18,17)-(18,45)
(18,21)-(18,45)
(18,21)-(18,45)
(18,22)-(18,24)
(19,23)-(19,66)
(20,21)-(20,58)
(22,6)-(22,67)
(22,6)-(22,67)
(22,6)-(22,67)
(22,52)-(22,56)
(22,52)-(22,67)
*)
