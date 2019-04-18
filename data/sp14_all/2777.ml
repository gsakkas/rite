
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
(17,20)-(17,36)
pi *. eval (e0 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,22)-(18,31)
pi *. eval (e1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,24)-(19,51)
(eval (e2 , x , y) +. eval (e3 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(20,22)-(20,43)
eval (e4 , x , y) *. eval (e5 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(22,16)-(22,18)
(e6 , x , y)
TupleG (fromList [VarG])

(22,28)-(22,30)
(e7 , x , y)
TupleG (fromList [VarG])

(22,42)-(22,44)
(e8 , x , y)
TupleG (fromList [VarG])

(22,55)-(22,57)
(e9 , x , y)
TupleG (fromList [VarG])

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(14,3)-(22,57)
(17,16)-(17,19)
(17,16)-(17,36)
(17,20)-(17,36)
(17,21)-(17,23)
(17,26)-(17,35)
(17,27)-(17,31)
(18,18)-(18,21)
(18,18)-(18,31)
(18,22)-(18,31)
(18,23)-(18,27)
(19,24)-(19,51)
*)
