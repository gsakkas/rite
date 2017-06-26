
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SumInts of expr
  | Power of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2.0
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y))
  | Thresh (expr1,expr2,expr3,expr4) ->
      if (eval (expr1, x, y)) < (eval (expr2, x, y))
      then eval (expr3, x, y)
      else eval (expr4, x, y)
  | SumInts expr -> ((eval (expr, x, y)) *. ((eval (expr, x, y)) +. 1.0)) / 2
  | Power (expr1,expr2,expr3) ->
      (eval expr1) ** (abs ((eval (expr1, x, y)) +. (eval (expr2, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SumInts of expr
  | Power of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2.0
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y))
  | Thresh (expr1,expr2,expr3,expr4) ->
      if (eval (expr1, x, y)) < (eval (expr2, x, y))
      then eval (expr3, x, y)
      else eval (expr4, x, y)
  | SumInts expr ->
      ((eval (expr, x, y)) *. ((eval (expr, x, y)) +. 1.0)) /. 2.0
  | Power (expr1,expr2,expr3) ->
      (eval (expr1, x, y)) **
        (abs_float ((eval (expr2, x, y)) +. (eval (expr3, x, y))));;

*)

(* changed spans
(28,20)-(28,77)
(28,76)-(28,77)
(30,12)-(30,17)
(30,22)-(30,74)
(30,23)-(30,26)
(30,35)-(30,40)
(30,59)-(30,64)
*)

(* type error slice
(16,2)-(30,74)
(19,17)-(19,20)
(19,17)-(19,48)
(19,28)-(19,47)
(19,29)-(19,33)
(19,34)-(19,46)
(28,20)-(28,73)
(28,20)-(28,77)
(30,6)-(30,18)
(30,7)-(30,11)
(30,12)-(30,17)
(30,22)-(30,74)
(30,23)-(30,26)
(30,27)-(30,73)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(30,74)
(16,2)-(30,74)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,17)-(19,48)
(19,17)-(19,20)
(19,21)-(19,48)
(19,22)-(19,24)
(19,28)-(19,47)
(19,29)-(19,33)
(19,34)-(19,46)
(19,35)-(19,39)
(19,41)-(19,42)
(19,44)-(19,45)
(20,19)-(20,50)
(20,19)-(20,22)
(20,23)-(20,50)
(20,24)-(20,26)
(20,30)-(20,49)
(20,31)-(20,35)
(20,36)-(20,48)
(20,37)-(20,41)
(20,43)-(20,44)
(20,46)-(20,47)
(22,6)-(22,59)
(22,6)-(22,52)
(22,7)-(22,27)
(22,8)-(22,12)
(22,13)-(22,26)
(22,14)-(22,19)
(22,21)-(22,22)
(22,24)-(22,25)
(22,31)-(22,51)
(22,32)-(22,36)
(22,37)-(22,50)
(22,38)-(22,43)
(22,45)-(22,46)
(22,48)-(22,49)
(22,56)-(22,59)
(23,27)-(23,71)
(23,27)-(23,47)
(23,28)-(23,32)
(23,33)-(23,46)
(23,34)-(23,39)
(23,41)-(23,42)
(23,44)-(23,45)
(23,51)-(23,71)
(23,52)-(23,56)
(23,57)-(23,70)
(23,58)-(23,63)
(23,65)-(23,66)
(23,68)-(23,69)
(25,6)-(27,29)
(25,9)-(25,52)
(25,9)-(25,29)
(25,10)-(25,14)
(25,15)-(25,28)
(25,16)-(25,21)
(25,23)-(25,24)
(25,26)-(25,27)
(25,32)-(25,52)
(25,33)-(25,37)
(25,38)-(25,51)
(25,39)-(25,44)
(25,46)-(25,47)
(25,49)-(25,50)
(26,11)-(26,29)
(26,11)-(26,15)
(26,16)-(26,29)
(26,17)-(26,22)
(26,24)-(26,25)
(26,27)-(26,28)
(27,11)-(27,29)
(27,11)-(27,15)
(27,16)-(27,29)
(27,17)-(27,22)
(27,24)-(27,25)
(27,27)-(27,28)
(28,20)-(28,77)
(28,20)-(28,73)
(28,21)-(28,40)
(28,22)-(28,26)
(28,27)-(28,39)
(28,28)-(28,32)
(28,34)-(28,35)
(28,37)-(28,38)
(28,44)-(28,72)
(28,45)-(28,64)
(28,46)-(28,50)
(28,51)-(28,63)
(28,52)-(28,56)
(28,58)-(28,59)
(28,61)-(28,62)
(28,68)-(28,71)
(28,76)-(28,77)
(30,6)-(30,74)
(30,19)-(30,21)
(30,6)-(30,18)
(30,7)-(30,11)
(30,12)-(30,17)
(30,22)-(30,74)
(30,23)-(30,26)
(30,27)-(30,73)
(30,28)-(30,48)
(30,29)-(30,33)
(30,34)-(30,47)
(30,35)-(30,40)
(30,42)-(30,43)
(30,45)-(30,46)
(30,52)-(30,72)
(30,53)-(30,57)
(30,58)-(30,71)
(30,59)-(30,64)
(30,66)-(30,67)
(30,69)-(30,70)
*)
