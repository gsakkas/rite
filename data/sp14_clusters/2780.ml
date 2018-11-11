
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
  | Cosine e1 -> cos (pi *. e1)
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
(18,28)-(18,30)
eval
VarG

(18,28)-(18,30)
eval (e1 , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(18,28)-(18,30)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(19,23)-(19,46)
x
VarG

(19,24)-(19,33)
y
VarG

(19,24)-(19,33)
eval (e2 , x , y) +. eval (e3 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(19,24)-(19,33)
(eval (e2 , x , y) +. eval (e3 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(19,30)-(19,32)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(19,36)-(19,45)
x
VarG

(19,36)-(19,45)
y
VarG

(19,42)-(19,44)
(e3 , x , y)
TupleG [VarG,VarG,VarG]

(20,21)-(20,30)
y
VarG

(20,21)-(20,30)
eval (e4 , x , y) *. eval (e5 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(20,21)-(20,30)
2.0
LitG

(20,21)-(20,42)
x
VarG

(20,27)-(20,29)
(e4 , x , y)
TupleG [VarG,VarG,VarG]

(20,33)-(20,42)
x
VarG

(20,33)-(20,42)
y
VarG

(20,39)-(20,41)
(e5 , x , y)
TupleG [VarG,VarG,VarG]

(22,6)-(22,56)
x
VarG

(22,6)-(22,56)
y
VarG

(22,15)-(22,17)
(e6 , x , y)
TupleG [VarG,VarG,VarG]

(22,21)-(22,30)
x
VarG

(22,21)-(22,30)
y
VarG

(22,27)-(22,29)
(e7 , x , y)
TupleG [VarG,VarG,VarG]

(22,36)-(22,43)
x
VarG

(22,36)-(22,43)
y
VarG

(22,41)-(22,43)
(e8 , x , y)
TupleG [VarG,VarG,VarG]

(22,49)-(22,56)
x
VarG

(22,49)-(22,56)
y
VarG

(22,54)-(22,56)
(e9 , x , y)
TupleG [VarG,VarG,VarG]

*)
