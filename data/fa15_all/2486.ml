
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
  | VarY  -> x
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval e1) +. (eval e2)) /. 2
  | Times (e1,e2) -> (eval e1) *. (eval e2);;


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
  | VarY  -> x
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y));;

*)

(* changed spans
(19,30)-(19,32)
(e1 , x , y)
TupleG (fromList [VarG])

(19,37)-(19,46)
x
VarG

(19,37)-(19,46)
y
VarG

(19,43)-(19,45)
(e2 , x , y)
TupleG (fromList [VarG])

(19,51)-(19,52)
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
TupleG (fromList [VarG])

(20,34)-(20,43)
x
VarG

(20,34)-(20,43)
y
VarG

(20,40)-(20,42)
(e2 , x , y)
TupleG (fromList [VarG])

*)
