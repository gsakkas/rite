
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
  | Sine u -> pi *. (eval (u, x, y))
  | Cosine u -> cos (pi *. (eval u))
  | Average (u,v) -> ((eval u) +. (eval v)) /. 2
  | Times (u,v) -> (eval u) *. (eval v)
  | Thresh (s,t,u,v) -> if (eval s) < (eval t) then eval u else eval v;;


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
  | Sine u -> pi *. (eval (u, x, y))
  | Cosine u -> cos (pi *. (eval (u, x, y)))
  | Average (u,v) -> ((eval (u, x, y)) +. (eval (v, x, y))) /. 2.0
  | Times (u,v) -> (eval (u, x, y)) *. (eval (v, x, y))
  | Thresh (s,t,u,v) ->
      if (eval (s, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (v, x, y);;

*)

(* changed spans
(18,33)-(18,34)
(u , x , y)
TupleG (fromList [VarG])

(19,21)-(19,48)
x
VarG

(19,21)-(19,48)
y
VarG

(19,28)-(19,29)
(u , x , y)
TupleG (fromList [VarG])

(19,34)-(19,42)
x
VarG

(19,34)-(19,42)
y
VarG

(19,40)-(19,41)
(v , x , y)
TupleG (fromList [VarG])

(19,47)-(19,48)
x
VarG

(20,19)-(20,39)
y
VarG

(20,19)-(20,39)
2.0
LitG

(20,25)-(20,26)
(u , x , y)
TupleG (fromList [VarG])

(20,31)-(20,39)
x
VarG

(20,31)-(20,39)
y
VarG

(20,37)-(20,38)
(v , x , y)
TupleG (fromList [VarG])

(21,24)-(21,70)
x
VarG

(21,24)-(21,70)
y
VarG

(21,33)-(21,34)
(s , x , y)
TupleG (fromList [VarG])

(21,38)-(21,46)
x
VarG

(21,38)-(21,46)
y
VarG

(21,44)-(21,45)
(t , x , y)
TupleG (fromList [VarG])

(21,52)-(21,58)
x
VarG

(21,52)-(21,58)
y
VarG

(21,57)-(21,58)
(u , x , y)
TupleG (fromList [VarG])

(21,64)-(21,70)
x
VarG

(21,64)-(21,70)
y
VarG

(21,69)-(21,70)
(v , x , y)
TupleG (fromList [VarG])

*)
