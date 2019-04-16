
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
  | VarY  -> x
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval e1) +. (eval e2)) /. 2
  | Times (e1,e2) -> (eval e1) *. (eval e2);;


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
  | VarY  -> x
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y));;

*)

(* changed spans
(19,31)-(19,33)
(e1 , x , y)
TupleG (fromList [VarG])

(19,44)-(19,46)
(e2 , x , y)
TupleG (fromList [VarG])

(19,52)-(19,53)
2.0
LitG

(20,28)-(20,30)
(e1 , x , y)
TupleG (fromList [VarG])

(20,41)-(20,43)
(e2 , x , y)
TupleG (fromList [VarG])

*)

(* type error slice
(14,3)-(20,44)
(17,27)-(17,44)
(17,28)-(17,32)
(17,33)-(17,43)
(19,24)-(19,53)
(19,25)-(19,34)
(19,26)-(19,30)
(19,31)-(19,33)
(19,38)-(19,47)
(19,39)-(19,43)
(19,44)-(19,46)
(19,52)-(19,53)
(20,22)-(20,31)
(20,23)-(20,27)
(20,28)-(20,30)
(20,35)-(20,44)
(20,36)-(20,40)
(20,41)-(20,43)
*)
