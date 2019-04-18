
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
(17,20)-(17,36)
pi *. eval (e' , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,22)-(18,38)
pi *. eval (e' , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,24)-(19,51)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(20,22)-(20,43)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(22,16)-(22,18)
(e1 , x , y)
TupleG (fromList [VarG])

(22,28)-(22,30)
(e2 , x , y)
TupleG (fromList [VarG])

(22,42)-(22,44)
(e3 , x , y)
TupleG (fromList [VarG])

(22,55)-(22,57)
(e4 , x , y)
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
(18,18)-(18,21)
(18,18)-(18,38)
(18,22)-(18,38)
(18,23)-(18,25)
(19,24)-(19,51)
*)
