
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
  | VarY  -> x
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval e1) +. (eval e2)) /. 2
  | Times (e1,e2) -> (eval e1) *. (eval e2);;


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
  | VarY  -> x
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y));;

*)

(* changed spans
(19,30)-(19,32)
(19,37)-(19,46)
(19,43)-(19,45)
(19,51)-(19,52)
(20,21)-(20,43)
(20,22)-(20,26)
(20,27)-(20,29)
(20,35)-(20,39)
(20,40)-(20,42)
*)

(* type error slice
(14,2)-(20,43)
(14,2)-(20,43)
(14,2)-(20,43)
(14,2)-(20,43)
(17,26)-(17,43)
(17,27)-(17,31)
(17,32)-(17,42)
(19,23)-(19,52)
(19,24)-(19,33)
(19,25)-(19,29)
(19,30)-(19,32)
(19,37)-(19,46)
(19,38)-(19,42)
(19,43)-(19,45)
(19,51)-(19,52)
(20,21)-(20,30)
(20,22)-(20,26)
(20,27)-(20,29)
(20,34)-(20,43)
(20,35)-(20,39)
(20,40)-(20,42)
*)
