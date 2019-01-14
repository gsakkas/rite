
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval e))
  | Cosine e -> cos * (pi *. (eval (e, x, y)))
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
(23,31)-(23,32)
(e , x , y)
TupleG (fromList [VarG])

(24,16)-(24,19)
y
VarG

(24,16)-(24,19)
cos (pi *. eval (e , x , y))
AppG (fromList [BopG EmptyG EmptyG])

(24,16)-(24,46)
x
VarG

(25,23)-(25,42)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(25,23)-(25,42)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(25,36)-(25,42)
eval
VarG

(25,37)-(25,38)
e1
VarG

(25,37)-(25,38)
(e1 , x , y)
TupleG (fromList [VarG])

(26,32)-(26,38)
eval
VarG

(26,33)-(26,34)
e2
VarG

(26,33)-(26,34)
(e2 , x , y)
TupleG (fromList [VarG])

(27,28)-(27,52)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(27,28)-(27,52)
2.0
LitG

(27,40)-(27,52)
eval
VarG

(27,41)-(27,42)
e1
VarG

(27,41)-(27,42)
(e1 , x , y)
TupleG (fromList [VarG])

(27,47)-(27,48)
eval
VarG

(27,47)-(27,48)
e2
VarG

(27,47)-(27,48)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,47)-(27,48)
(e2 , x , y)
TupleG (fromList [VarG])

*)
