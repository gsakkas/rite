
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
  | Sine e' -> sin (pi * (eval e'))
  | Cosine e' -> cos (pi * (eval e'))
  | Average (e1,e2) -> ((eval e1) + (eval e2)) / 2
  | Times (e1,e2) -> (eval e1) * (eval e2)
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
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(17,21)-(17,34)
(17,32)-(17,34)
(18,18)-(18,36)
(18,23)-(18,36)
(18,34)-(18,36)
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
(11,4)-(11,29)
(11,10)-(11,26)
(14,3)-(22,57)
(14,3)-(22,57)
(17,16)-(17,19)
(17,16)-(17,34)
(17,21)-(17,23)
(17,21)-(17,34)
(17,21)-(17,34)
(18,18)-(18,21)
(18,18)-(18,36)
(18,23)-(18,25)
(18,23)-(18,36)
(18,23)-(18,36)
(19,26)-(19,51)
*)
