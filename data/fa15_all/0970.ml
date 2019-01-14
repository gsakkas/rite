
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

let buildX () = VarX;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> buildX ()
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
(21,16)-(21,20)
4.0 *. atan 1.0
BopG LitG (AppG (fromList [EmptyG]))

(23,14)-(32,55)
atan
VarG

(23,14)-(32,55)
atan 1.0
AppG (fromList [LitG])

(23,14)-(32,55)
4.0
LitG

(23,14)-(32,55)
1.0
LitG

(24,2)-(32,55)
match e with
| buildX -> x
| buildY -> y
| Sine e -> sin (pi *. eval (e , x , y))
| Cosine e -> cos (pi *. eval (e , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> 0.0
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

(26,21)-(26,23)
x
VarG

(27,14)-(27,23)
sin
VarG

(27,14)-(27,40)
y
VarG

(27,24)-(27,40)
pi
VarG

(27,24)-(27,40)
pi *. eval (e , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(28,16)-(28,27)
cos
VarG

(28,28)-(28,44)
pi
VarG

(28,28)-(28,44)
pi *. eval (e , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(29,36)-(29,74)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(29,37)-(29,54)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(30,32)-(30,70)
2.0
LitG

(30,33)-(30,50)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(32,51)-(32,52)
0.0
LitG

*)
