
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> pi * x
  | Cosine e -> pi * y
  | Average (e1,e2) -> buildAverage (e1, e2);;


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
  | Sine e -> pi *. x
  | Cosine e -> pi *. y
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y));;

*)

(* changed spans
(16,2)-(21,44)
match e with
| VarX -> x
| VarY -> y
| Sine e -> pi *. x
| Cosine e -> pi *. y
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,BopG EmptyG EmptyG)])

(19,14)-(19,20)
pi *. x
BopG VarG VarG

(20,16)-(20,22)
pi *. y
BopG VarG VarG

(21,23)-(21,44)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(21,23)-(21,44)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(21,36)-(21,44)
eval
VarG

(21,37)-(21,39)
(e1 , x , y)
TupleG (fromList [VarG])

(21,41)-(21,43)
x
VarG

(21,41)-(21,43)
y
VarG

(21,41)-(21,43)
eval
VarG

(21,41)-(21,43)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(21,41)-(21,43)
(e2 , x , y)
TupleG (fromList [VarG])

*)
