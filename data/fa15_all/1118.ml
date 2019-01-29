
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Average (x',y') -> (x' + y') / 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | Average (x',y') -> (x +. y) /. 2.0;;

*)

(* changed spans
(12,2)-(12,75)
match e with
| Average (x' , y') -> (x +. y) /. 2.0
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG)])

(12,26)-(12,27)
x +. y
BopG VarG VarG

(12,26)-(12,27)
(x +. y) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(12,74)-(12,75)
2.0
LitG

*)
