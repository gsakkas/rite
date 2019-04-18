
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
  | Sine e -> sin (pi * (eval e))
  | Cosine e -> cos (pi * (eval e))
  | Average (e1,e2) -> ((eval e1) + (eval e2)) / 2
  | Times (e1,e2) -> (eval e1) * (eval e2)
  | Thresh (e1,e2,e1less,e2less) ->
      if (eval e1) < (eval e2) then eval e1less else eval e2less;;


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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e1less,e2less) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e1less, x, y)
      else eval (e2less, x, y);;

*)

(* changed spans
(17,19)-(17,34)
pi *. eval (e , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,21)-(18,36)
pi *. eval (e , x , y)
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

(22,42)-(22,48)
(e1less , x , y)
TupleG (fromList [VarG])

(22,59)-(22,65)
(e2less , x , y)
TupleG (fromList [VarG])

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(14,3)-(22,65)
(17,15)-(17,18)
(17,15)-(17,34)
(17,19)-(17,34)
(17,20)-(17,22)
(18,17)-(18,20)
(18,17)-(18,36)
(18,21)-(18,36)
(18,22)-(18,24)
(19,24)-(19,51)
*)
