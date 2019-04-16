
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
  | Sine x -> sin (eval (pi *. x))
  | Cosine x -> cos (pi *. (eval x))
  | Average (x1,x2) -> ((eval x1) +. (eval x2)) /. 2.;;


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
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.;;

*)

(* changed spans
(14,3)-(19,54)
match e with
| VarX -> x
| VarY -> y
| Sine x1 -> sin (pi *. eval (x1 , x , y))
| Cosine x1 -> cos (pi *. eval (x1 , x , y))
| Average (x1 , x2) -> (eval (x1 , x , y) +. eval (x2 , x , y)) /. 2.0
CaseG VarG (fromList [(ConPatG Nothing,Nothing,VarG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG)])

*)

(* type error slice
(13,4)-(19,56)
(13,15)-(19,54)
(14,3)-(19,54)
(17,19)-(17,35)
(17,20)-(17,24)
(17,25)-(17,34)
(17,32)-(17,33)
(18,28)-(18,36)
(18,29)-(18,33)
(18,34)-(18,35)
(19,25)-(19,34)
(19,26)-(19,30)
(19,31)-(19,33)
(19,38)-(19,47)
(19,39)-(19,43)
(19,44)-(19,46)
*)
