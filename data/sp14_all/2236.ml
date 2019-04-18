
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
  | Thresh (w,t,u,z) -> if (eval w) < (eval t) then eval u else eval z
  | Times (t,u) -> (eval t) * (eval u)
  | Average (t,u) -> ((eval t) * (eval u)) / 2
  | Cosine t -> cos (pi * (eval t))
  | Sine t -> sin (pi * (eval t))
  | VarX  -> x
  | VarY  -> y;;


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
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | Times (t,u) -> (eval (t, x, y)) *. (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) *. (eval (u, x, y))) /. 2.0
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(15,34)-(15,35)
(w , x , y)
TupleG (fromList [VarG])

(15,45)-(15,46)
(t , x , y)
TupleG (fromList [VarG])

(15,58)-(15,59)
(u , x , y)
TupleG (fromList [VarG])

(15,70)-(15,71)
(z , x , y)
TupleG (fromList [VarG])

(16,20)-(16,39)
eval (t , x , y) *. eval (u , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(17,22)-(17,47)
(eval (t , x , y) *. eval (u , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(18,21)-(18,36)
pi *. eval (t , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,19)-(19,34)
pi *. eval (t , x , y)
BopG VarG (AppG (fromList [EmptyG]))

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(13,4)-(21,17)
(13,15)-(21,15)
(14,3)-(21,15)
(15,28)-(15,36)
(15,29)-(15,33)
(15,34)-(15,35)
(18,17)-(18,20)
(18,17)-(18,36)
(18,21)-(18,36)
(18,22)-(18,24)
(19,15)-(19,18)
(19,15)-(19,34)
(19,19)-(19,34)
(19,20)-(19,22)
*)
