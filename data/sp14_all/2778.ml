
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
(e0 , x , y)
TupleG (fromList [VarG])

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
(13,4)-(22,59)
(13,15)-(22,57)
(14,3)-(22,57)
(17,16)-(17,19)
(17,16)-(17,37)
(17,20)-(17,37)
(17,27)-(17,36)
(17,28)-(17,32)
(17,33)-(17,35)
(19,24)-(19,47)
(19,24)-(19,51)
(19,25)-(19,34)
(19,26)-(19,30)
(19,37)-(19,46)
(19,38)-(19,42)
(20,22)-(20,31)
(20,22)-(20,43)
(20,23)-(20,27)
(20,34)-(20,43)
(20,35)-(20,39)
*)
