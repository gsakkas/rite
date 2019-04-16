
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
(14,3)-(22,57)
(17,16)-(17,19)
(17,16)-(17,45)
(17,27)-(17,44)
(17,28)-(17,32)
(17,33)-(17,43)
(19,24)-(19,51)
(19,25)-(19,34)
(19,26)-(19,30)
(19,31)-(19,33)
(19,37)-(19,46)
(19,38)-(19,42)
(19,43)-(19,45)
(20,22)-(20,31)
(20,22)-(20,43)
(20,23)-(20,27)
(20,28)-(20,30)
(20,34)-(20,43)
(20,35)-(20,39)
(20,40)-(20,42)
(22,10)-(22,19)
(22,11)-(22,15)
(22,16)-(22,18)
(22,22)-(22,31)
(22,23)-(22,27)
(22,28)-(22,30)
(22,37)-(22,41)
(22,37)-(22,44)
(22,42)-(22,44)
(22,50)-(22,54)
(22,50)-(22,57)
(22,55)-(22,57)
*)
