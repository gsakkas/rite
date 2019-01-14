
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
  | Thresh (w,t,u,z) -> if (eval w) < (eval t) then eval u else eval z
  | Times (t,u) -> (eval t) * (eval u)
  | Average (t,u) -> ((eval t) * (eval u)) / 2
  | Cosine t -> cos (pi * (eval t))
  | Sine t -> sin (pi * (eval t))
  | VarX  -> x
  | VarY  -> y;;


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
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | Times (t,u) -> (eval (t, x, y)) *. (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) *. (eval (u, x, y))) /. 2.0
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(15,33)-(15,34)
(w , x , y)
TupleG (fromList [VarG])

(15,38)-(15,46)
x
VarG

(15,38)-(15,46)
y
VarG

(15,44)-(15,45)
(t , x , y)
TupleG (fromList [VarG])

(15,52)-(15,58)
x
VarG

(15,52)-(15,58)
y
VarG

(15,57)-(15,58)
(u , x , y)
TupleG (fromList [VarG])

(15,64)-(15,70)
x
VarG

(15,64)-(15,70)
y
VarG

(15,69)-(15,70)
(z , x , y)
TupleG (fromList [VarG])

(16,19)-(16,27)
y
VarG

(16,19)-(16,27)
eval (t , x , y) *. eval (u , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(16,19)-(16,38)
x
VarG

(16,25)-(16,26)
(t , x , y)
TupleG (fromList [VarG])

(16,30)-(16,38)
x
VarG

(16,30)-(16,38)
y
VarG

(16,36)-(16,37)
(u , x , y)
TupleG (fromList [VarG])

(17,21)-(17,42)
x
VarG

(17,22)-(17,30)
y
VarG

(17,22)-(17,30)
eval (t , x , y) *. eval (u , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(17,22)-(17,30)
(eval (t , x , y) *. eval (u , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(17,28)-(17,29)
(t , x , y)
TupleG (fromList [VarG])

(17,33)-(17,41)
x
VarG

(17,33)-(17,41)
y
VarG

(17,39)-(17,40)
(u , x , y)
TupleG (fromList [VarG])

(17,45)-(17,46)
x
VarG

(18,16)-(18,35)
y
VarG

(18,16)-(18,35)
2.0
LitG

(18,20)-(18,35)
pi *. eval (t , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,32)-(18,33)
(t , x , y)
TupleG (fromList [VarG])

(19,14)-(19,33)
x
VarG

(19,14)-(19,33)
y
VarG

(19,18)-(19,33)
pi *. eval (t , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,30)-(19,31)
(t , x , y)
TupleG (fromList [VarG])

*)
