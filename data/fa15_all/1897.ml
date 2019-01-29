
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
  | Average (e1,e2) -> ((eval e1) +. (eval e2)) /. 2
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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e, x, y)) +. (eval (e, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e, x, y)) *. (eval (e, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e, x, y)) < (eval (e, x, y))
      then eval (e, x, y)
      else eval (e, x, y);;

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
(e , x , y)
TupleG (fromList [VarG])

(19,37)-(19,46)
e
VarG

(19,37)-(19,46)
x
VarG

(19,37)-(19,46)
y
VarG

(19,51)-(19,52)
(e , x , y)
TupleG (fromList [VarG])

(20,21)-(20,43)
e
VarG

(20,21)-(20,43)
x
VarG

(20,21)-(20,43)
y
VarG

(20,21)-(20,43)
2.0
LitG

(20,27)-(20,29)
(e , x , y)
TupleG (fromList [VarG])

(20,34)-(20,43)
e
VarG

(20,34)-(20,43)
x
VarG

(20,34)-(20,43)
y
VarG

(20,40)-(20,42)
(e , x , y)
TupleG (fromList [VarG])

(22,6)-(22,56)
e
VarG

(22,6)-(22,56)
x
VarG

(22,6)-(22,56)
y
VarG

(22,15)-(22,17)
(e , x , y)
TupleG (fromList [VarG])

(22,21)-(22,30)
e
VarG

(22,21)-(22,30)
x
VarG

(22,21)-(22,30)
y
VarG

(22,27)-(22,29)
(e , x , y)
TupleG (fromList [VarG])

(22,36)-(22,43)
e
VarG

(22,36)-(22,43)
x
VarG

(22,36)-(22,43)
y
VarG

(22,41)-(22,43)
(e , x , y)
TupleG (fromList [VarG])

(22,49)-(22,56)
e
VarG

(22,49)-(22,56)
x
VarG

(22,49)-(22,56)
y
VarG

(22,54)-(22,56)
(e , x , y)
TupleG (fromList [VarG])

*)
