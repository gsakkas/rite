
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
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) * (eval (b, x, y))) / 2
  | Cosine a -> cos pi
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
(16,20)-(16,55)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(17,22)-(17,63)
(eval (a , x , y) *. eval (b , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(18,21)-(18,23)
pi ** eval (a , x , y)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(19,19)-(19,42)
pi ** eval (a , x , y)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(14,3)-(21,15)
(15,25)-(15,29)
(15,25)-(15,39)
(16,20)-(16,36)
(16,20)-(16,55)
(16,21)-(16,25)
(18,17)-(18,20)
(18,17)-(18,23)
(19,15)-(19,18)
(19,15)-(19,42)
(19,19)-(19,42)
(19,20)-(19,22)
*)
