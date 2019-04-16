
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
(20,22)-(20,35)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(20,39)-(20,52)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,16)-(22,23)
(a , x , y)
TupleG (fromList [VarG])

(22,33)-(22,40)
(b , x , y)
TupleG (fromList [VarG])

(23,17)-(23,29)
(a_less , x , y)
TupleG (fromList [VarG])

(24,17)-(24,29)
(b_less , x , y)
TupleG (fromList [VarG])

*)

(* type error slice
(17,20)-(17,45)
(17,27)-(17,44)
(17,28)-(17,32)
(20,22)-(20,35)
(20,23)-(20,27)
(20,39)-(20,52)
(20,40)-(20,44)
*)
