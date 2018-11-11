
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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) ( *. ) (eval (b, x, y))
  | Average (a,b) -> (eval (a, x, y) ( *. ) eval (b, x, y)) / 2
  | Cosine a -> cos (pi * (float_of_int (eval (a, x, y))))
  | Sine a -> sin (pi * (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;


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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) *. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi ** (eval (a, x, y)))
  | Sine a -> sin (pi ** (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;

*)

(* changed spans
(16,19)-(16,59)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(17,21)-(17,59)
(eval (a , x , y) *. eval (b , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(17,22)-(17,26)
eval (a , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(17,22)-(17,26)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(17,37)-(17,43)
eval (b , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(17,62)-(17,63)
2.0
LitG

(18,20)-(18,58)
pi ** eval (a , x , y)
AppG [VarG,AppG [EmptyG]]

(18,21)-(18,23)
(**)
VarG

(19,18)-(19,41)
pi ** eval (a , x , y)
AppG [VarG,AppG [EmptyG]]

(19,19)-(19,21)
(**)
VarG

*)
