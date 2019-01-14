
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
  | Sine e' -> sin (pi *. (eval (e' x y)))
  | Cosine e' -> cos (pi *. (eval e' x y))
  | Average (e1,e2) -> ((eval e1 x y) +. (eval e2 x y)) /. 2
  | Times (e1,e2) -> (eval e1 x y) *. (eval e2 x y)
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a x y)) < (eval (b x y))
      then eval (a_less x y)
      else eval (b_less x y);;


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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y);;

*)

(* changed spans
(17,32)-(17,40)
(e' , x , y)
TupleG (fromList [VarG])

(18,28)-(18,41)
eval (e' , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,34)-(18,36)
(e' , x , y)
TupleG (fromList [VarG])

(19,24)-(19,37)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,30)-(19,32)
(e1 , x , y)
TupleG (fromList [VarG])

(19,41)-(19,54)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,47)-(19,49)
(e2 , x , y)
TupleG (fromList [VarG])

(19,59)-(19,60)
2.0
LitG

(20,21)-(20,34)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(20,27)-(20,29)
(e1 , x , y)
TupleG (fromList [VarG])

(20,38)-(20,51)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(20,44)-(20,46)
(e2 , x , y)
TupleG (fromList [VarG])

(22,15)-(22,22)
(a , x , y)
TupleG (fromList [VarG])

(22,32)-(22,39)
(b , x , y)
TupleG (fromList [VarG])

(23,16)-(23,28)
(a_less , x , y)
TupleG (fromList [VarG])

(24,16)-(24,28)
(b_less , x , y)
TupleG (fromList [VarG])

*)
