
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
(17,23)-(17,45)
(18,25)-(18,47)
(20,9)-(20,26)
(20,9)-(20,49)
(20,9)-(20,56)
(20,55)-(20,56)
(21,29)-(21,46)
(21,29)-(21,69)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(17,18)-(17,21)
(17,18)-(17,45)
(17,23)-(17,25)
(17,23)-(17,45)
(17,23)-(17,45)
(18,20)-(18,23)
(18,20)-(18,47)
(18,25)-(18,27)
(18,25)-(18,47)
(18,25)-(18,47)
*)
