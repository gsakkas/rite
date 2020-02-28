
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> 1.0
  | VarY  -> 1.0
  | Sine e1 -> sin (2 * (eval (e1, x, y)));;


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
(13,14)-(13,17)
x
VarG

(14,14)-(14,17)
y
VarG

(15,20)-(15,43)
eval (e1 , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

*)

(* type error slice
(11,4)-(15,45)
(11,15)-(15,43)
(12,3)-(15,43)
(13,14)-(13,17)
(15,16)-(15,19)
(15,16)-(15,43)
(15,20)-(15,43)
(15,25)-(15,42)
(15,26)-(15,30)
*)
