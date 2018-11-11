
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
  | Sine e -> pi *. e
  | Cosine e -> pi *. e
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;


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
  | Sine e -> pi *. (eval (e, x, y))
  | Cosine e -> pi *. (eval (e, x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(17,20)-(17,21)
eval
VarG

(17,20)-(17,21)
eval (e , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(17,20)-(17,21)
(e , x , y)
TupleG [VarG,VarG,VarG]

(18,16)-(18,23)
x
VarG

(18,16)-(18,23)
y
VarG

(18,22)-(18,23)
eval
VarG

(18,22)-(18,23)
eval (e , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(18,22)-(18,23)
(e , x , y)
TupleG [VarG,VarG,VarG]

(19,23)-(19,70)
x
VarG

(19,23)-(19,70)
y
VarG

*)
