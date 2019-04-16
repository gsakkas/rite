
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
(17,29)-(17,44)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,31)-(18,46)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,29)-(19,71)
eval (expr , x , y) +. eval (expr1 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(20,27)-(20,42)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(20,46)-(20,62)
eval (expr1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,10)-(22,25)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,28)-(22,44)
eval (expr1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,12)-(23,26)
eval (expr2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(24,12)-(24,26)
eval (expr3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(13,4)-(24,28)
(13,15)-(24,26)
(14,3)-(24,26)
(17,29)-(17,44)
(17,30)-(17,34)
(17,35)-(17,39)
(19,29)-(19,71)
(19,70)-(19,71)
*)
