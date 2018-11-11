
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e0 -> sin (eval e0)
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
(11,14)-(20,56)
atan 1.0
AppG VarG [LitG]

(11,14)-(20,56)
4.0 *. atan 1.0
BopG LitG (AppG EmptyG [EmptyG])

(15,19)-(15,28)
pi *. eval (e0 , x , y)
BopG VarG (AppG EmptyG [EmptyG])

(15,25)-(15,27)
(e0 , x , y)
TupleG [VarG,VarG,VarG]

(16,21)-(16,30)
pi *. eval (e1 , x , y)
BopG VarG (AppG EmptyG [EmptyG])

(16,27)-(16,29)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(17,24)-(17,33)
eval (e2 , x , y) +. eval (e3 , x , y)
BopG (AppG EmptyG [EmptyG]) (AppG EmptyG [EmptyG])

(17,24)-(17,33)
(eval (e2 , x , y) +. eval (e3 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(17,30)-(17,32)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(17,42)-(17,44)
(e3 , x , y)
TupleG [VarG,VarG,VarG]

(18,21)-(18,30)
eval (e4 , x , y) *. eval (e5 , x , y)
BopG (AppG EmptyG [EmptyG]) (AppG EmptyG [EmptyG])

(18,27)-(18,29)
(e4 , x , y)
TupleG [VarG,VarG,VarG]

(18,39)-(18,41)
(e5 , x , y)
TupleG [VarG,VarG,VarG]

(20,15)-(20,17)
(e6 , x , y)
TupleG [VarG,VarG,VarG]

(20,27)-(20,29)
(e7 , x , y)
TupleG [VarG,VarG,VarG]

(20,41)-(20,43)
(e8 , x , y)
TupleG [VarG,VarG,VarG]

(20,54)-(20,56)
(e9 , x , y)
TupleG [VarG,VarG,VarG]

*)
