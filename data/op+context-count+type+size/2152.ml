
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
(11,15)-(20,57)
(15,21)-(15,28)
(15,26)-(15,28)
(16,18)-(16,30)
(16,23)-(16,30)
(16,28)-(16,30)
(17,26)-(17,33)
(17,26)-(17,45)
(17,26)-(17,51)
(17,31)-(17,33)
(17,38)-(17,45)
(17,43)-(17,45)
(17,50)-(17,51)
(18,23)-(18,27)
(18,23)-(18,30)
(18,23)-(18,42)
(18,28)-(18,30)
(18,35)-(18,39)
(18,35)-(18,42)
(18,40)-(18,42)
(20,7)-(20,57)
(20,11)-(20,15)
(20,11)-(20,18)
(20,11)-(20,30)
(20,16)-(20,18)
(20,23)-(20,27)
(20,23)-(20,30)
(20,28)-(20,30)
(20,37)-(20,41)
(20,37)-(20,44)
(20,42)-(20,44)
(20,50)-(20,54)
(20,50)-(20,57)
(20,55)-(20,57)
*)

(* type error slice
(11,4)-(20,59)
(11,15)-(20,57)
(12,3)-(20,57)
(12,9)-(12,10)
(13,14)-(13,15)
(14,14)-(14,15)
(15,16)-(15,19)
(15,16)-(15,28)
(15,21)-(15,25)
(15,21)-(15,28)
(15,26)-(15,28)
(17,26)-(17,30)
(17,26)-(17,33)
(17,26)-(17,45)
(17,26)-(17,51)
(17,31)-(17,33)
(17,38)-(17,42)
(17,38)-(17,45)
(17,43)-(17,45)
(18,23)-(18,27)
(18,23)-(18,30)
(18,23)-(18,42)
(18,28)-(18,30)
(18,35)-(18,39)
(18,35)-(18,42)
(18,40)-(18,42)
*)
