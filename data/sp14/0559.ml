
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
  | VarX  -> float_of_int x
  | VarY  -> float_of_int y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) ->
      (float_of_int ((eval (e1, x, y)) + (eval (e2, x, y)))) / 2;;


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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.;;

*)

(* changed spans
(15,14)-(15,28)
x
VarG

(16,14)-(16,28)
y
VarG

(20,7)-(20,65)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(14,3)-(20,65)
(15,14)-(15,26)
(15,14)-(15,28)
(17,19)-(17,43)
(17,26)-(17,42)
(17,27)-(17,31)
(20,7)-(20,61)
(20,7)-(20,65)
(20,8)-(20,20)
(20,21)-(20,60)
(20,22)-(20,39)
(20,23)-(20,27)
(20,42)-(20,59)
(20,43)-(20,47)
*)
