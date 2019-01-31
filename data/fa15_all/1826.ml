
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Quarter of expr;;

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
  | Square e -> e *. e
  | Quarter e -> e /. 4.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Quarter of expr;;

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
  | Square e -> (eval (e, x, y)) *. (eval (e, x, y))
  | Quarter e -> (eval (e, x, y)) /. 4.0;;

*)

(* changed spans
(27,16)-(27,17)
eval
VarG

(27,16)-(27,17)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,16)-(27,17)
(e , x , y)
TupleG (fromList [VarG])

(27,21)-(27,22)
x
VarG

(27,21)-(27,22)
y
VarG

(27,21)-(27,22)
eval
VarG

(27,21)-(27,22)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,21)-(27,22)
(e , x , y)
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
