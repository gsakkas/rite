
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
  | Sine expr -> sin (pi * (eval (expr, x, y)))
  | Cosine expr -> cos (pi * (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) + (eval (expr2, x, y))) / 2
  | Times (expr1,expr2) -> (eval (expr1, x, y)) * (eval (expr2, x, y));;


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
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2.0
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y));;

*)

(* changed spans
(17,21)-(17,47)
(18,23)-(18,49)
(20,6)-(20,51)
(20,6)-(20,55)
(20,7)-(20,27)
(20,54)-(20,55)
(21,27)-(21,47)
(21,27)-(21,70)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(17,17)-(17,20)
(17,17)-(17,47)
(17,21)-(17,47)
(17,21)-(17,47)
(17,22)-(17,24)
(18,19)-(18,22)
(18,19)-(18,49)
(18,23)-(18,49)
(18,23)-(18,49)
(18,24)-(18,26)
*)
