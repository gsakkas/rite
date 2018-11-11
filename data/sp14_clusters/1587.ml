
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
  | Average (e1,e2) -> ((e1 * 1.00) +. (e2 * 1.00)) /. 2.0;;


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
(14,2)-(19,58)
match e with
| VarX -> x
| VarY -> y
| Sine e -> pi *. x
| Cosine e -> pi *. y
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
CaseG VarG [(Nothing,VarG),(Nothing,VarG),(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG)]

(19,24)-(19,35)
eval (e1 , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(19,25)-(19,27)
eval
VarG

(19,25)-(19,27)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(19,39)-(19,50)
x
VarG

(19,40)-(19,42)
y
VarG

(19,40)-(19,42)
eval
VarG

(19,40)-(19,42)
eval (e2 , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(19,40)-(19,42)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(19,45)-(19,49)
x
VarG

(19,55)-(19,58)
y
VarG

*)
