
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
  | Average (e1,e2) -> ((eval (e1, x, y)) + (eval (e2, x, y))) /. 2;;


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
(19,24)-(19,63)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(19,67)-(19,68)
2.0
LitG

*)

(* type error slice
(17,19)-(17,43)
(17,26)-(17,42)
(17,27)-(17,31)
(19,24)-(19,63)
(19,24)-(19,68)
(19,25)-(19,42)
(19,26)-(19,30)
(19,45)-(19,62)
(19,46)-(19,50)
(19,67)-(19,68)
*)
