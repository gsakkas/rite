
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
  | Sine a -> sin (pi *. (eval a))
  | Cosine a -> cos (pi *. (eval a))
  | Average (a,b) -> ((eval a) +. (eval b)) / 2
  | Times (a,b) -> (eval a) *. (eval b)
  | Thresh (a,b,c,d) -> if (eval a) < (eval b) then eval c else eval d;;


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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(17,31)-(17,32)
(a , x , y)
TupleG [VarG,VarG,VarG]

(18,16)-(18,36)
x
VarG

(18,16)-(18,36)
y
VarG

(18,33)-(18,34)
(a , x , y)
TupleG [VarG,VarG,VarG]

(19,21)-(19,43)
y
VarG

(19,21)-(19,43)
(eval (a , x , y) +. eval (b , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(19,21)-(19,47)
x
VarG

(19,28)-(19,29)
(a , x , y)
TupleG [VarG,VarG,VarG]

(19,34)-(19,42)
x
VarG

(19,34)-(19,42)
y
VarG

(19,40)-(19,41)
(b , x , y)
TupleG [VarG,VarG,VarG]

(19,46)-(19,47)
x
VarG

(20,19)-(20,39)
y
VarG

(20,19)-(20,39)
2.0
LitG

(20,25)-(20,26)
(a , x , y)
TupleG [VarG,VarG,VarG]

(20,31)-(20,39)
x
VarG

(20,31)-(20,39)
y
VarG

(20,37)-(20,38)
(b , x , y)
TupleG [VarG,VarG,VarG]

(21,24)-(21,70)
x
VarG

(21,24)-(21,70)
y
VarG

(21,33)-(21,34)
(a , x , y)
TupleG [VarG,VarG,VarG]

(21,38)-(21,46)
x
VarG

(21,38)-(21,46)
y
VarG

(21,44)-(21,45)
(b , x , y)
TupleG [VarG,VarG,VarG]

(21,52)-(21,58)
x
VarG

(21,52)-(21,58)
y
VarG

(21,57)-(21,58)
(c , x , y)
TupleG [VarG,VarG,VarG]

(21,64)-(21,70)
x
VarG

(21,64)-(21,70)
y
VarG

(21,69)-(21,70)
(d , x , y)
TupleG [VarG,VarG,VarG]

*)
