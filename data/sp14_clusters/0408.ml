
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sigmoid of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Sigmoid a -> 1. /. (1. - (exp ((-1) *. a)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sigmoid of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Sigmoid a -> 1. /. (1. -. (exp ((-1.) *. (eval (a, x, y)))))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(20,23)-(20,47)
1.0 -. exp ((- 1.0) *. eval (a , x , y))
BopG LitG (AppG [EmptyG])

(20,35)-(20,39)
(- 1.0)
UopG LitG

(20,43)-(20,44)
eval
VarG

(20,43)-(20,44)
eval (a , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(20,43)-(20,44)
1.0
LitG

(20,43)-(20,44)
(a , x , y)
TupleG [VarG,VarG,VarG]

(21,21)-(21,65)
x
VarG

(21,21)-(21,65)
y
VarG

*)
