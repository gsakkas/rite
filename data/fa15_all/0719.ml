
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
  | Sine expr -> sin (pi *. (eval expr x y))
  | Cosine expr -> cos (pi *. (eval expr x y))
  | Average (expr,expr1) -> ((eval expr x y) +. (eval expr1 x y)) /. 2
  | Times (expr,expr1) -> (eval expr x y) *. (eval expr1 x y)
  | Thresh (expr,expr1,expr2,expr3) ->
      if (eval expr x y) < (eval expr1 x y)
      then eval expr2 x y
      else eval expr3 x y;;


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
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr,expr1) -> (eval (expr, x, y)) +. (eval (expr1, x, y))
  | Times (expr,expr1) -> (eval (expr, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr,expr1,expr2,expr3) ->
      if (eval (expr, x, y)) < (eval (expr1, x, y))
      then eval (expr2, x, y)
      else eval (expr3, x, y);;

*)

(* changed spans
(17,28)-(17,43)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(17,34)-(17,38)
(expr , x , y)
TupleG (fromList [VarG])

(18,30)-(18,45)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,36)-(18,40)
(expr , x , y)
TupleG (fromList [VarG])

(19,29)-(19,44)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,35)-(19,39)
(expr , x , y)
TupleG (fromList [VarG])

(19,48)-(19,64)
eval (expr1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,54)-(19,59)
(expr1 , x , y)
TupleG (fromList [VarG])

(20,26)-(20,41)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(20,32)-(20,36)
(expr , x , y)
TupleG (fromList [VarG])

(20,45)-(20,61)
eval (expr1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(20,51)-(20,56)
(expr1 , x , y)
TupleG (fromList [VarG])

(22,9)-(22,24)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,15)-(22,19)
(expr , x , y)
TupleG (fromList [VarG])

(22,27)-(22,43)
eval (expr1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,33)-(22,38)
(expr1 , x , y)
TupleG (fromList [VarG])

(23,11)-(23,25)
eval (expr2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,16)-(23,21)
(expr2 , x , y)
TupleG (fromList [VarG])

(24,11)-(24,25)
eval (expr3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(24,16)-(24,21)
(expr3 , x , y)
TupleG (fromList [VarG])

*)
