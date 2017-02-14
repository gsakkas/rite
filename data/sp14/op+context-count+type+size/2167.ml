
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
  | Sine e0 -> sin (pi * (eval e0))
  | Cosine e1 -> cos (eval e1)
  | Average (e2,e3) -> ((eval e2) + (eval e3)) / 2
  | Times (e4,e5) -> (eval e4) * (eval e5)
  | Thresh (e6,e7,e8,e9) ->
      if (eval e6) < (eval e7) then eval e8 else eval e9;;


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
  | Sine e0 -> sin (pi *. (eval (e0, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e2,e3) -> ((eval (e2, x, y)) +. (eval (e3, x, y))) /. 2.0
  | Times (e4,e5) -> (eval (e4, x, y)) *. (eval (e5, x, y))
  | Thresh (e6,e7,e8,e9) ->
      if (eval (e6, x, y)) < (eval (e7, x, y))
      then eval (e8, x, y)
      else eval (e9, x, y);;

*)

(* changed spans
(17,19)-(17,35)
(17,31)-(17,33)
(18,17)-(18,30)
(18,21)-(18,30)
(18,27)-(18,29)
(19,23)-(19,46)
(19,23)-(19,50)
(19,24)-(19,33)
(19,30)-(19,32)
(19,36)-(19,45)
(19,42)-(19,44)
(19,49)-(19,50)
(20,21)-(20,30)
(20,21)-(20,42)
(20,27)-(20,29)
(20,33)-(20,42)
(20,34)-(20,38)
(20,39)-(20,41)
(22,9)-(22,18)
(22,9)-(22,30)
(22,10)-(22,14)
(22,15)-(22,17)
(22,21)-(22,30)
(22,22)-(22,26)
(22,27)-(22,29)
(22,36)-(22,40)
(22,36)-(22,43)
(22,41)-(22,43)
(22,49)-(22,53)
(22,49)-(22,56)
(22,54)-(22,56)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(14,2)-(22,56)
(14,2)-(22,56)
(17,15)-(17,18)
(17,15)-(17,35)
(17,19)-(17,35)
(17,19)-(17,35)
(17,19)-(17,35)
(17,20)-(17,22)
(17,25)-(17,34)
(17,26)-(17,30)
(18,17)-(18,20)
(18,17)-(18,30)
(18,21)-(18,30)
(18,22)-(18,26)
(19,23)-(19,50)
*)
