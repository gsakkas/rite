
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
  | VarX  -> float x
  | VarY  -> float y
  | Sine a -> sin (pi * (eval (a, x, y)))
  | Cosine a -> cos (pi * (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) + (eval (b, x, y))) / 2
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(15,14)-(15,21)
x
VarG

(16,14)-(16,21)
y
VarG

(17,19)-(17,42)
pi *. eval (a , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,21)-(18,44)
pi *. eval (a , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,22)-(19,63)
(eval (a , x , y) +. eval (b , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(20,20)-(20,55)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(13,4)-(24,28)
(13,15)-(24,26)
(14,3)-(24,26)
(15,14)-(15,19)
(15,14)-(15,21)
(17,15)-(17,18)
(17,15)-(17,42)
(17,19)-(17,42)
(17,20)-(17,22)
(17,25)-(17,41)
(17,26)-(17,30)
(18,17)-(18,20)
(18,17)-(18,44)
(18,21)-(18,44)
(18,22)-(18,24)
(19,22)-(19,63)
(20,20)-(20,55)
(22,7)-(24,26)
(24,12)-(24,16)
(24,12)-(24,26)
*)
