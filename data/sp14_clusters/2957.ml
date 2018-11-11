
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
  | Sine e' -> sin (pi *. (eval e'))
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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(14,2)-(22,56)
match e with
| VarX -> x
| VarY -> y
| Sine e' -> sin (pi *. eval (e' , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) -> if eval (e1 , x , y) < eval (e2 , x , y)
                                then eval (e3 , x , y)
                                else eval (e4 , x , y)
CaseG VarG [(Nothing,VarG),(Nothing,VarG),(Nothing,AppG [EmptyG]),(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)]

(18,29)-(18,33)
(e' , x , y)
TupleG [VarG,VarG,VarG]

(19,23)-(19,47)
y
VarG

(19,23)-(19,47)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(19,23)-(19,51)
x
VarG

(19,30)-(19,32)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(19,37)-(19,46)
x
VarG

(19,37)-(19,46)
y
VarG

(19,43)-(19,45)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(19,50)-(19,51)
x
VarG

(20,21)-(20,43)
y
VarG

(20,21)-(20,43)
2.0
LitG

(20,27)-(20,29)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(20,34)-(20,43)
x
VarG

(20,34)-(20,43)
y
VarG

(20,40)-(20,42)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(22,6)-(22,56)
x
VarG

(22,6)-(22,56)
y
VarG

(22,15)-(22,17)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(22,21)-(22,30)
x
VarG

(22,21)-(22,30)
y
VarG

(22,27)-(22,29)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(22,36)-(22,43)
x
VarG

(22,36)-(22,43)
y
VarG

(22,41)-(22,43)
(e3 , x , y)
TupleG [VarG,VarG,VarG]

(22,49)-(22,56)
x
VarG

(22,49)-(22,56)
y
VarG

(22,54)-(22,56)
(e4 , x , y)
TupleG [VarG,VarG,VarG]

*)
