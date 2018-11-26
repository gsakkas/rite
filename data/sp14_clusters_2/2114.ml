
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
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin s1
  | Average (a1,a2) -> (eval (VarX, x, y)) +. (eval (VarY, x, y));;


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
  match e with
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin (eval (s1, x, y))
  | Average (a1,a2) -> (eval (VarX, x, y)) +. (eval (VarY, x, y));;

*)

(* changed spans
(15,19)-(15,21)
eval
VarG

(15,19)-(15,21)
eval (s1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(15,19)-(15,21)
(s1 , x , y)
TupleG (fromList [VarG])

(16,23)-(16,65)
x
VarG

(16,23)-(16,65)
y
VarG

*)
