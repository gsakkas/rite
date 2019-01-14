
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) -> buildThresh (e1, e2, e3, e4);;


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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(23,28)-(23,56)
eval (e1 , x , y) < eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(23,28)-(23,56)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(23,40)-(23,56)
eval
VarG

(23,41)-(23,43)
(e1 , x , y)
TupleG (fromList [VarG])

(23,45)-(23,47)
x
VarG

(23,45)-(23,47)
y
VarG

(23,45)-(23,47)
eval
VarG

(23,45)-(23,47)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,45)-(23,47)
(e2 , x , y)
TupleG (fromList [VarG])

(23,49)-(23,51)
x
VarG

(23,49)-(23,51)
y
VarG

(23,49)-(23,51)
eval
VarG

(23,49)-(23,51)
eval (e3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,49)-(23,51)
(e3 , x , y)
TupleG (fromList [VarG])

(23,53)-(23,55)
x
VarG

(23,53)-(23,55)
y
VarG

(23,53)-(23,55)
eval
VarG

(23,53)-(23,55)
eval (e4 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,53)-(23,55)
(e4 , x , y)
TupleG (fromList [VarG])

*)
