
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
  | Sine e1 -> sin (pi * (eval (e1, x, y)))
  | Cosine e1 -> cos (pi * (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e1, x, y))) /. 2
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
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
(16,1)-(16,1)
eval (e1 , x , y) < eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(17,20)-(17,44)
pi *. eval (e1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,22)-(18,46)
pi *. eval (e1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,68)-(19,69)
2.0
LitG

(22,7)-(22,68)
eval (e3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(17,16)-(17,19)
(17,16)-(17,44)
(17,20)-(17,44)
(17,21)-(17,23)
(17,26)-(17,43)
(17,27)-(17,31)
(18,18)-(18,21)
(18,18)-(18,46)
(18,22)-(18,46)
(18,23)-(18,25)
(19,24)-(19,64)
(19,24)-(19,69)
(19,25)-(19,42)
(19,26)-(19,30)
(19,46)-(19,63)
(19,47)-(19,51)
(19,68)-(19,69)
(20,22)-(20,39)
(20,22)-(20,60)
(20,23)-(20,27)
(20,43)-(20,60)
(20,44)-(20,48)
(22,7)-(22,68)
(22,53)-(22,57)
(22,53)-(22,68)
(22,68)-(22,68)
*)
