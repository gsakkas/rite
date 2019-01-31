
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
  | Sine e -> sin (pi *. (eval e))
  | Cosine e -> cos (pi *. (eval e))
  | Average (e1,e2) -> ((eval e1) +. (eval e2)) /. 2;;


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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0;;

*)

(* changed spans
(17,31)-(17,32)
(e , x , y)
TupleG (fromList [VarG])

(18,16)-(18,36)
x
VarG

(18,16)-(18,36)
y
VarG

(18,33)-(18,34)
(e , x , y)
TupleG (fromList [VarG])

(19,23)-(19,52)
x
VarG

(19,23)-(19,52)
y
VarG

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

*)
