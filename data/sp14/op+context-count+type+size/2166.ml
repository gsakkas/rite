
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
  | Sine e0 -> sin (pi *. (eval e0))
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
(17,33)-(17,35)
(18,18)-(18,30)
(18,23)-(18,30)
(18,28)-(18,30)
(19,26)-(19,33)
(19,26)-(19,45)
(19,26)-(19,51)
(19,31)-(19,33)
(19,38)-(19,45)
(19,43)-(19,45)
(19,50)-(19,51)
(20,23)-(20,30)
(20,23)-(20,42)
(20,28)-(20,30)
(20,35)-(20,39)
(20,35)-(20,42)
(20,40)-(20,42)
(22,11)-(22,15)
(22,11)-(22,18)
(22,11)-(22,30)
(22,16)-(22,18)
(22,23)-(22,27)
(22,23)-(22,30)
(22,28)-(22,30)
(22,37)-(22,41)
(22,37)-(22,44)
(22,42)-(22,44)
(22,50)-(22,54)
(22,50)-(22,57)
(22,55)-(22,57)
*)

(* type error slice
(13,4)-(22,59)
(13,15)-(22,57)
(14,3)-(22,57)
(14,3)-(22,57)
(14,3)-(22,57)
(14,3)-(22,57)
(17,16)-(17,19)
(17,16)-(17,35)
(17,21)-(17,35)
(17,28)-(17,32)
(17,28)-(17,35)
(17,33)-(17,35)
(19,26)-(19,30)
(19,26)-(19,33)
(19,26)-(19,45)
(19,26)-(19,45)
(19,26)-(19,51)
(19,38)-(19,42)
(19,38)-(19,45)
(20,23)-(20,27)
(20,23)-(20,30)
(20,23)-(20,42)
(20,23)-(20,42)
(20,23)-(20,42)
(20,35)-(20,39)
(20,35)-(20,42)
*)
