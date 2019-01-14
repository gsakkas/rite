
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval e))
  | Cosine e -> buildCosine (eval (e, x, y))
  | Average (e1,e2) -> buildAverage (x, y)
  | Times (e1,e2) -> buildTimes (x, y)
  | Thresh (e1,e2,e3,e4) -> buildThresh (x, y, x, y);;


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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(25,31)-(25,32)
(e , x , y)
TupleG (fromList [VarG])

(26,16)-(26,27)
cos
VarG

(26,16)-(26,44)
x
VarG

(26,16)-(26,44)
y
VarG

(26,28)-(26,44)
pi
VarG

(26,28)-(26,44)
pi *. eval (e , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(27,23)-(27,42)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(27,23)-(27,42)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(27,36)-(27,42)
eval
VarG

(27,37)-(27,38)
e1
VarG

(27,37)-(27,38)
(e1 , x , y)
TupleG (fromList [VarG])

(28,32)-(28,38)
eval
VarG

(28,33)-(28,34)
e2
VarG

(28,33)-(28,34)
(e2 , x , y)
TupleG (fromList [VarG])

(29,28)-(29,52)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(29,28)-(29,52)
2.0
LitG

(29,40)-(29,52)
eval
VarG

(29,41)-(29,42)
e1
VarG

(29,41)-(29,42)
(e1 , x , y)
TupleG (fromList [VarG])

(29,47)-(29,48)
eval
VarG

(29,47)-(29,48)
e2
VarG

(29,47)-(29,48)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(29,47)-(29,48)
(e2 , x , y)
TupleG (fromList [VarG])

*)
