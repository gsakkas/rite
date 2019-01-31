
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Uncreative of expr* expr* expr
  | Creative of expr;;

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
  | Uncreative (e1,e2,e3) ->
      (((((eval (e1, x, y)) / 2) * (eval (e2, x, y))) / 3) *
         (eval (e3, x, y)))
        / 4
  | Creative e1 -> (-1) * (eval e1);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Uncreative of expr* expr* expr
  | Creative of expr;;

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
  | Uncreative (e1,e2,e3) ->
      (((((eval (e1, x, y)) /. 2.0) *. (eval (e2, x, y))) /. 3.0) *.
         (eval (e3, x, y)))
        /. 4.0
  | Creative e1 -> (-1.0) *. (eval (e1, x, y));;

*)

(* changed spans
(28,9)-(28,32)
((((eval (e1 , x , y) /. 2.0) *. eval (e2 , x , y)) /. 3.0) *. eval (e3 , x , y)) /. 4.0
BopG (BopG EmptyG EmptyG) LitG

(28,10)-(28,27)
(((eval (e1 , x , y) /. 2.0) *. eval (e2 , x , y)) /. 3.0) *. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(28,10)-(28,27)
((eval (e1 , x , y) /. 2.0) *. eval (e2 , x , y)) /. 3.0
BopG (BopG EmptyG EmptyG) LitG

(28,10)-(28,27)
(eval (e1 , x , y) /. 2.0) *. eval (e2 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(28,10)-(28,27)
eval (e1 , x , y) /. 2.0
BopG (AppG (fromList [EmptyG])) LitG

(28,30)-(28,31)
2.0
LitG

(28,56)-(28,57)
3.0
LitG

(31,19)-(31,23)
4.0
LitG

(31,26)-(31,35)
(- 1.0) *. eval (e1 , x , y)
BopG (UopG EmptyG) (AppG (fromList [EmptyG]))

(31,26)-(31,35)
(- 1.0)
UopG LitG

(31,26)-(31,35)
1.0
LitG

(31,32)-(31,34)
(e1 , x , y)
TupleG (fromList [VarG])

*)
