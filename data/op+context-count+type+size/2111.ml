
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
(17,30)-(17,43)
(17,35)-(17,39)
(18,32)-(18,45)
(18,37)-(18,41)
(19,31)-(19,44)
(19,31)-(19,71)
(19,36)-(19,40)
(19,50)-(19,64)
(19,55)-(19,60)
(19,70)-(19,71)
(20,28)-(20,41)
(20,33)-(20,37)
(20,47)-(20,61)
(20,52)-(20,57)
(22,11)-(22,24)
(22,16)-(22,20)
(22,29)-(22,43)
(22,34)-(22,39)
(23,12)-(23,26)
(23,17)-(23,22)
(24,12)-(24,16)
(24,12)-(24,26)
(24,17)-(24,22)
(24,23)-(24,24)
(24,25)-(24,26)
*)

(* type error slice
(13,4)-(24,28)
(13,15)-(24,26)
(14,3)-(24,26)
(14,9)-(14,10)
(15,14)-(15,15)
(16,14)-(16,15)
(17,18)-(17,21)
(17,18)-(17,43)
(17,23)-(17,43)
(17,30)-(17,34)
(17,30)-(17,43)
(17,35)-(17,39)
(17,40)-(17,41)
(17,42)-(17,43)
(19,31)-(19,71)
(19,70)-(19,71)
*)
