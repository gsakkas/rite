
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin ((eval e1), x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin (eval (e1, x, y));;

*)

(* changed spans
(12,59)-(12,76)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(11,4)-(12,78)
(11,15)-(12,76)
(12,3)-(12,76)
(12,55)-(12,58)
(12,55)-(12,76)
(12,59)-(12,76)
(12,60)-(12,69)
(12,61)-(12,65)
(12,66)-(12,68)
*)
