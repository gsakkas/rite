
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
(16,20)-(16,60)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(17,22)-(17,64)
(eval (a , x , y) *. eval (b , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(18,21)-(18,59)
pi ** eval (a , x , y)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(19,19)-(19,42)
pi ** eval (a , x , y)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(16,20)-(16,36)
(16,20)-(16,60)
(16,21)-(16,25)
(16,44)-(16,60)
(16,45)-(16,49)
(17,22)-(17,60)
(17,23)-(17,27)
(17,45)-(17,49)
(18,17)-(18,20)
(18,17)-(18,59)
(18,21)-(18,59)
(18,27)-(18,58)
(18,28)-(18,40)
(19,15)-(19,18)
(19,15)-(19,42)
(19,19)-(19,42)
*)
