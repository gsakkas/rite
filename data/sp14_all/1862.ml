
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
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(18,35)-(18,37)
(e' , x , y)
TupleG (fromList [VarG])

(19,24)-(19,52)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(20,28)-(20,30)
(e1 , x , y)
TupleG (fromList [VarG])

(20,41)-(20,43)
(e2 , x , y)
TupleG (fromList [VarG])

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
(14,3)-(22,57)
(17,16)-(17,19)
(17,16)-(17,45)
(17,27)-(17,44)
(17,28)-(17,32)
(17,33)-(17,43)
(18,29)-(18,38)
(18,30)-(18,34)
(18,35)-(18,37)
(19,24)-(19,48)
(19,24)-(19,52)
(19,25)-(19,34)
(19,26)-(19,30)
(19,31)-(19,33)
(19,38)-(19,47)
(19,39)-(19,43)
(19,44)-(19,46)
(20,22)-(20,31)
(20,23)-(20,27)
(20,28)-(20,30)
(20,35)-(20,44)
(20,36)-(20,40)
(20,41)-(20,43)
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
