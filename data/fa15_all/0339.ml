
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | MyExpr1 of expr* expr* expr
  | MyExpr2 of expr;;

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
      else eval (e4, x, y)
  | MyExpr1 (e1,e2,e3) -> ((sqrt e1) *. (sqrt e2)) *. e3
  | MyExpr2 e -> e *. 0.5;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | MyExpr1 of expr* expr* expr
  | MyExpr2 of expr;;

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
      else eval (e4, x, y)
  | MyExpr1 (e1,e2,e3) ->
      ((sqrt (eval (e1, x, y))) *. (sqrt (eval (e2, x, y)))) *.
        (eval (e3, x, y))
  | MyExpr2 e -> (eval (e, x, y)) *. 0.5;;

*)

(* changed spans
(27,33)-(27,35)
eval
VarG

(27,33)-(27,35)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,33)-(27,35)
(e1 , x , y)
TupleG (fromList [VarG])

(27,40)-(27,49)
x
VarG

(27,40)-(27,49)
y
VarG

(27,46)-(27,48)
eval
VarG

(27,46)-(27,48)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,46)-(27,48)
(e2 , x , y)
TupleG (fromList [VarG])

(27,54)-(27,56)
x
VarG

(27,54)-(27,56)
y
VarG

(27,54)-(27,56)
eval
VarG

(27,54)-(27,56)
eval (e3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,54)-(27,56)
(e3 , x , y)
TupleG (fromList [VarG])

(28,17)-(28,18)
eval
VarG

(28,17)-(28,18)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,17)-(28,18)
(e , x , y)
TupleG (fromList [VarG])

(28,17)-(28,25)
x
VarG

(28,17)-(28,25)
y
VarG

(28,22)-(28,25)
x
VarG

(28,22)-(28,25)
y
VarG

*)
