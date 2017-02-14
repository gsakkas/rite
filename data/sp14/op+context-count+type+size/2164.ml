
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e0 -> sin (eval e0)
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
(11,14)-(20,56)
(15,19)-(15,28)
(15,25)-(15,27)
(16,17)-(16,30)
(16,21)-(16,30)
(16,27)-(16,29)
(17,23)-(17,46)
(17,23)-(17,50)
(17,24)-(17,33)
(17,30)-(17,32)
(17,36)-(17,45)
(17,42)-(17,44)
(17,49)-(17,50)
(18,21)-(18,30)
(18,21)-(18,42)
(18,22)-(18,26)
(18,27)-(18,29)
(18,33)-(18,42)
(18,34)-(18,38)
(18,39)-(18,41)
(20,6)-(20,56)
(20,9)-(20,18)
(20,9)-(20,30)
(20,10)-(20,14)
(20,15)-(20,17)
(20,21)-(20,30)
(20,22)-(20,26)
(20,27)-(20,29)
(20,36)-(20,40)
(20,36)-(20,43)
(20,41)-(20,43)
(20,49)-(20,53)
(20,49)-(20,56)
(20,54)-(20,56)
*)

(* type error slice
(11,3)-(20,58)
(11,14)-(20,56)
(12,2)-(20,56)
(12,2)-(20,56)
(12,2)-(20,56)
(12,2)-(20,56)
(15,15)-(15,18)
(15,15)-(15,28)
(15,19)-(15,28)
(15,20)-(15,24)
(15,25)-(15,27)
(17,23)-(17,46)
(17,23)-(17,46)
(17,23)-(17,50)
(17,24)-(17,33)
(17,25)-(17,29)
(17,36)-(17,45)
(17,37)-(17,41)
(18,21)-(18,30)
(18,21)-(18,42)
(18,21)-(18,42)
(18,21)-(18,42)
(18,22)-(18,26)
(18,33)-(18,42)
(18,34)-(18,38)
*)
