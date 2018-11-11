
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
  | Thresh (w,x,y,z) -> if (eval w) < (eval x) then eval y else eval z
  | Times (x,y) -> (eval x) * (eval y)
  | Average (x,y) -> ((eval x) * (eval y)) / 2
  | Cosine x -> cos (pi * (eval x))
  | Sine x -> sin (pi * (eval x))
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
(14,2)-(21,14)
match e with
| Thresh (w , t , u , z) -> if eval (w , x , y) < eval (t , x , y)
                            then eval (u , x , y)
                            else eval (z , x , y)
| Times (t , u) -> eval (t , x , y) *. eval (u , x , y)
| Average (t , u) -> (eval (t , x , y) *. eval (u , x , y)) /. 2.0
| Cosine t -> cos (pi *. eval (t , x , y))
| Sine t -> sin (pi *. eval (t , x , y))
| VarX -> x
| VarY -> y
CaseG VarG [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,VarG),(Nothing,VarG)]

(15,33)-(15,34)
(w , x , y)
TupleG [VarG,VarG,VarG]

(15,38)-(15,46)
x
VarG

(15,38)-(15,46)
y
VarG

(15,44)-(15,45)
t
VarG

(15,44)-(15,45)
(t , x , y)
TupleG [VarG,VarG,VarG]

(15,52)-(15,58)
y
VarG

(15,57)-(15,58)
u
VarG

(15,57)-(15,58)
x
VarG

(15,57)-(15,58)
(u , x , y)
TupleG [VarG,VarG,VarG]

(15,69)-(15,70)
(z , x , y)
TupleG [VarG,VarG,VarG]

(16,19)-(16,27)
y
VarG

(16,19)-(16,27)
eval (t , x , y) *. eval (u , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(16,19)-(16,38)
x
VarG

(16,25)-(16,26)
t
VarG

(16,25)-(16,26)
(t , x , y)
TupleG [VarG,VarG,VarG]

(16,30)-(16,38)
y
VarG

(16,36)-(16,37)
u
VarG

(16,36)-(16,37)
x
VarG

(16,36)-(16,37)
(u , x , y)
TupleG [VarG,VarG,VarG]

(17,21)-(17,42)
(eval (t , x , y) *. eval (u , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(17,22)-(17,30)
eval (t , x , y) *. eval (u , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(17,28)-(17,29)
t
VarG

(17,28)-(17,29)
(t , x , y)
TupleG [VarG,VarG,VarG]

(17,33)-(17,41)
y
VarG

(17,39)-(17,40)
u
VarG

(17,39)-(17,40)
x
VarG

(17,39)-(17,40)
(u , x , y)
TupleG [VarG,VarG,VarG]

(17,45)-(17,46)
2.0
LitG

(18,20)-(18,35)
pi *. eval (t , x , y)
BopG VarG (AppG [EmptyG])

(18,32)-(18,33)
t
VarG

(18,32)-(18,33)
(t , x , y)
TupleG [VarG,VarG,VarG]

(19,14)-(19,33)
y
VarG

(19,18)-(19,33)
pi *. eval (t , x , y)
BopG VarG (AppG [EmptyG])

(19,30)-(19,31)
t
VarG

(19,30)-(19,31)
(t , x , y)
TupleG [VarG,VarG,VarG]

(20,13)-(20,14)
y
VarG

*)
