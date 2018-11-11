
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) -> if e1 > e2 then e3 else - e3;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e3, x, y)
      else (-1.0) *. (eval (e3, x, y));;

*)

(* changed spans
(30,27)-(30,29)
eval
VarG

(30,27)-(30,29)
eval (e1 , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(30,27)-(30,29)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(30,32)-(30,34)
x
VarG

(30,32)-(30,34)
y
VarG

(30,32)-(30,34)
eval
VarG

(30,32)-(30,34)
eval (e2 , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(30,32)-(30,34)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(30,40)-(30,42)
x
VarG

(30,40)-(30,42)
y
VarG

(30,40)-(30,42)
eval
VarG

(30,40)-(30,42)
eval (e3 , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(30,40)-(30,42)
(e3 , x , y)
TupleG [VarG,VarG,VarG]

(30,48)-(30,52)
x
VarG

(30,48)-(30,52)
y
VarG

(30,48)-(30,52)
(- 1.0) *. eval (e3 , x , y)
BopG (UopG EmptyG) (AppG [EmptyG])

(30,50)-(30,52)
eval
VarG

(30,50)-(30,52)
eval (e3 , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(30,50)-(30,52)
1.0
LitG

(30,50)-(30,52)
(e3 , x , y)
TupleG [VarG,VarG,VarG]

*)
