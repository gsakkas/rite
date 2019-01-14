
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

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec eval (e,x,y) =
  match e with
  | buildX -> buildX ()
  | buildY -> buildY ()
  | Sine e -> buildSine (eval (e, x, y))
  | Cosine e -> buildCosine (eval (e, x, y))
  | Average (e1,e2) -> buildAverage ((eval (e1, x, y)), (eval (e2, x, y)))
  | Times (e1,e2) -> buildTimes ((eval (e1, x, y)), (eval (e2, x, y)))
  | Thresh (a,b,a_less,b_less) ->
      buildThresh (a, b, a_less, (eval (b_less, x, y)));;


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
  | buildX -> x
  | buildY -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) -> 0.0;;

*)

(* changed spans
(19,36)-(19,38)
4.0 *. atan 1.0
BopG LitG (AppG (fromList [EmptyG]))

(21,14)-(30,55)
atan
VarG

(21,14)-(30,55)
atan 1.0
AppG (fromList [LitG])

(21,14)-(30,55)
4.0
LitG

(21,14)-(30,55)
1.0
LitG

(24,21)-(24,23)
x
VarG

(25,14)-(25,23)
sin
VarG

(25,14)-(25,40)
y
VarG

(25,24)-(25,40)
pi
VarG

(25,24)-(25,40)
pi *. eval (e , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(26,16)-(26,27)
cos
VarG

(26,28)-(26,44)
pi
VarG

(26,28)-(26,44)
pi *. eval (e , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(27,36)-(27,74)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(27,37)-(27,54)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(28,32)-(28,70)
2.0
LitG

(28,33)-(28,50)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(30,51)-(30,52)
0.0
LitG

*)
