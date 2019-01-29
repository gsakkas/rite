
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
  | Sine e' -> sin (pi *. (eval e' x y))
  | Cosine e' -> cos (pi *. (eval e' x y))
  | Average (e1,e2) -> ((eval e1 x y) +. (eval e2 x y)) / 2
  | Times (e1,e2) -> (eval e1 x y) *. (eval e2 x y)
  | Thresh (e1,e2,e3,e4) ->
      if (eval e1 x y) < (eval e2 x y) then eval e3 x y else eval e4 x y;;


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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(14,2)-(22,72)
match e with
| VarX -> x
| VarY -> y
| Sine e' -> sin (pi *. eval (e' , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) -> if eval (e1 , x , y) < eval (e2 , x , y)
                                then eval (e3 , x , y)
                                else eval (e4 , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(18,34)-(18,36)
(e' , x , y)
TupleG (fromList [VarG])

(19,23)-(19,59)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

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

(19,58)-(19,59)
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

(22,9)-(22,22)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,15)-(22,17)
(e1 , x , y)
TupleG (fromList [VarG])

(22,25)-(22,38)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,31)-(22,33)
(e2 , x , y)
TupleG (fromList [VarG])

(22,44)-(22,55)
eval (e3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,49)-(22,51)
(e3 , x , y)
TupleG (fromList [VarG])

(22,61)-(22,72)
eval (e4 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,66)-(22,68)
(e4 , x , y)
TupleG (fromList [VarG])

*)
