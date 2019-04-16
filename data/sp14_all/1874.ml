
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      if (eval e1) > (eval e2) then eval e3 else - (eval e3);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e3, x, y)
      else (-1.0) *. (eval (e3, x, y));;

*)

(* changed spans
(31,16)-(31,18)
(e1 , x , y)
TupleG (fromList [VarG])

(31,28)-(31,30)
(e2 , x , y)
TupleG (fromList [VarG])

(31,42)-(31,44)
(e3 , x , y)
TupleG (fromList [VarG])

(31,50)-(31,61)
(- 1.0) *. eval (e3 , x , y)
BopG (UopG EmptyG) (AppG (fromList [EmptyG]))

*)

(* type error slice
(16,3)-(31,61)
(19,16)-(19,19)
(19,16)-(19,45)
(19,27)-(19,44)
(19,28)-(19,32)
(19,33)-(19,43)
(31,7)-(31,61)
(31,10)-(31,19)
(31,11)-(31,15)
(31,16)-(31,18)
(31,22)-(31,31)
(31,23)-(31,27)
(31,28)-(31,30)
(31,37)-(31,41)
(31,37)-(31,44)
(31,42)-(31,44)
(31,50)-(31,61)
(31,52)-(31,61)
(31,53)-(31,57)
(31,58)-(31,60)
*)
