
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
  | Sine e -> sin (pi *. e)
  | Cosine e -> cos (pi *. e)
  | Average (e1,e2) -> ((eval (e, x, y)) +. (eval (e, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e, x, y)) *. (eval (e, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e, x, y)) < (eval (e, x, y))
      then eval (e, x, y)
      else eval (e, x, y);;


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
  | Average (e1,e2) -> ((eval (e, x, y)) +. (eval (e, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e, x, y)) *. (eval (e, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e, x, y)) < (eval (e, x, y))
      then eval (e, x, y)
      else eval (e, x, y);;

*)

(* changed spans
(17,25)-(17,26)
eval
VarG

(17,25)-(17,26)
eval (e , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(17,25)-(17,26)
(e , x , y)
TupleG [VarG,VarG,VarG]

(18,16)-(18,29)
x
VarG

(18,16)-(18,29)
y
VarG

(18,27)-(18,28)
eval
VarG

(18,27)-(18,28)
eval (e , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(18,27)-(18,28)
(e , x , y)
TupleG [VarG,VarG,VarG]

(19,23)-(19,67)
x
VarG

(19,23)-(19,67)
y
VarG

*)
