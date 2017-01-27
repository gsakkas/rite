
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
  | Sine e' -> sin (pi *. (eval e'))
  | Cosine e' -> cos (pi *. (eval e'))
  | Average (e1,e2) -> ((eval e1) +. (eval e2)) / 2
  | Times (e1,e2) -> (eval e1) *. (eval e2)
  | Thresh (e1,e2,e3,e4) ->
      if (eval e1) < (eval e2) then eval e3 else eval e4;;


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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(14,3)-(22,57)
(17,33)-(17,35)
(18,18)-(18,21)
(18,18)-(18,37)
(18,23)-(18,25)
(18,23)-(18,37)
(18,30)-(18,34)
(18,30)-(18,37)
(19,26)-(19,46)
(19,26)-(19,52)
(19,31)-(19,33)
(19,39)-(19,46)
(19,44)-(19,46)
(19,51)-(19,52)
(20,23)-(20,43)
(20,28)-(20,30)
(20,36)-(20,43)
(20,41)-(20,43)
(22,7)-(22,57)
(22,16)-(22,18)
(22,23)-(22,27)
(22,23)-(22,30)
(22,28)-(22,30)
(22,37)-(22,41)
(22,42)-(22,44)
(22,50)-(22,54)
(22,55)-(22,57)
*)

(* type error slice
(13,4)-(22,59)
(13,15)-(22,57)
(14,3)-(22,57)
(14,9)-(14,10)
(15,14)-(15,15)
(16,14)-(16,15)
(17,16)-(17,19)
(17,16)-(17,35)
(17,21)-(17,35)
(17,28)-(17,32)
(17,28)-(17,35)
(17,33)-(17,35)
(19,26)-(19,46)
(19,26)-(19,52)
*)
