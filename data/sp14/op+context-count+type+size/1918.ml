
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
  | Sine expr -> sin (pi *. (eval expr x y))
  | Cosine expr -> cos (pi *. (eval expr x y))
  | Average (expr,expr1) -> ((eval expr x y) +. (eval expr1 x y)) /. 2
  | Times (expr,expr1) -> (eval expr x y) *. (eval expr1 x y)
  | Thresh (expr,expr1,expr2,expr3) ->
      if (eval expr x y) < (eval expr1 x y)
      then eval expr2 x y
      else eval expr3 x y;;


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
  | Average (expr,expr1) -> (eval (expr, x, y)) +. (eval (expr1, x, y))
  | Times (expr,expr1) -> (eval (expr, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr,expr1,expr2,expr3) ->
      if (eval (expr, x, y)) < (eval (expr1, x, y))
      then eval (expr2, x, y)
      else eval (expr3, x, y);;

*)

(* changed spans
(17,28)-(17,43)
(17,34)-(17,38)
(18,30)-(18,45)
(18,36)-(18,40)
(19,28)-(19,70)
(19,29)-(19,44)
(19,35)-(19,39)
(19,48)-(19,64)
(19,54)-(19,59)
(19,69)-(19,70)
(20,26)-(20,41)
(20,32)-(20,36)
(20,45)-(20,61)
(20,51)-(20,56)
(22,9)-(22,24)
(22,15)-(22,19)
(22,27)-(22,43)
(22,33)-(22,38)
(23,11)-(23,25)
(23,16)-(23,21)
(24,11)-(24,15)
(24,11)-(24,25)
(24,16)-(24,21)
(24,22)-(24,23)
(24,24)-(24,25)
*)

(* type error slice
(13,3)-(24,27)
(13,14)-(24,25)
(14,2)-(24,25)
(17,28)-(17,43)
(17,29)-(17,33)
(17,34)-(17,38)
(19,28)-(19,70)
(19,69)-(19,70)
*)
