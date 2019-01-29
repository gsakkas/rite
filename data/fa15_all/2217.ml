
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
  | Sine x -> sin (pi *. (eval x))
  | Cosine x -> cos (pi *. (eval x))
  | Average (x1,x2) -> ((eval x1) +. (eval x2)) /. 2.;;


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
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.;;

*)

(* changed spans
(14,2)-(19,53)
match e with
| VarX -> x
| VarY -> y
| Sine x1 -> sin (pi *. eval (x1 , x , y))
| Cosine x1 -> cos (pi *. eval (x1 , x , y))
| Average (x1 , x2) -> (eval (x1 , x , y) +. eval (x2 , x , y)) /. 2.0
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG)])

(17,31)-(17,32)
x1
VarG

(17,31)-(17,32)
(x1 , x , y)
TupleG (fromList [VarG])

(18,16)-(18,36)
y
VarG

(18,33)-(18,34)
x1
VarG

(18,33)-(18,34)
(x1 , x , y)
TupleG (fromList [VarG])

(19,23)-(19,53)
y
VarG

(19,30)-(19,32)
(x1 , x , y)
TupleG (fromList [VarG])

(19,37)-(19,46)
x
VarG

(19,37)-(19,46)
y
VarG

(19,43)-(19,45)
(x2 , x , y)
TupleG (fromList [VarG])

(19,51)-(19,53)
x
VarG

(19,51)-(19,53)
y
VarG

*)
