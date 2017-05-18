
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr0 -> sin (eval (expr0, x, y))
  | Cosine expr0 -> cos (eval (expr0, x, y))
  | Average (expr0,expr1) ->
      ((eval (expr0, x, y)) +. (eval (expr1, x, y))) /. 2
  | Times (expr0,expr1) -> (eval (expr0, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr0,expr1,expr2,expr3) ->
      (match (eval (expr0, x, y)) < (eval (expr1, x, y)) with
       | true  -> eval (expr2, x, y)
       | false  -> eval (expr3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr0 -> sin (eval (expr0, x, y))
  | Cosine expr0 -> cos (eval (expr0, x, y))
  | Average (expr0,expr1) ->
      ((eval (expr0, x, y)) +. (eval (expr1, x, y))) /. 2.
  | Times (expr0,expr1) -> (eval (expr0, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr0,expr1,expr2,expr3) ->
      (match (eval (expr0, x, y)) < (eval (expr1, x, y)) with
       | true  -> eval (expr2, x, y)
       | false  -> eval (expr3, x, y));;

*)

(* changed spans
(18,56)-(18,57)
*)

(* type error slice
(18,6)-(18,57)
(18,56)-(18,57)
*)

(* all spans
(11,14)-(23,38)
(12,2)-(23,38)
(12,8)-(12,9)
(13,13)-(13,14)
(14,13)-(14,14)
(15,18)-(15,42)
(15,18)-(15,21)
(15,22)-(15,42)
(15,23)-(15,27)
(15,28)-(15,41)
(15,29)-(15,34)
(15,36)-(15,37)
(15,39)-(15,40)
(16,20)-(16,44)
(16,20)-(16,23)
(16,24)-(16,44)
(16,25)-(16,29)
(16,30)-(16,43)
(16,31)-(16,36)
(16,38)-(16,39)
(16,41)-(16,42)
(18,6)-(18,57)
(18,6)-(18,52)
(18,7)-(18,27)
(18,8)-(18,12)
(18,13)-(18,26)
(18,14)-(18,19)
(18,21)-(18,22)
(18,24)-(18,25)
(18,31)-(18,51)
(18,32)-(18,36)
(18,37)-(18,50)
(18,38)-(18,43)
(18,45)-(18,46)
(18,48)-(18,49)
(18,56)-(18,57)
(19,27)-(19,71)
(19,27)-(19,47)
(19,28)-(19,32)
(19,33)-(19,46)
(19,34)-(19,39)
(19,41)-(19,42)
(19,44)-(19,45)
(19,51)-(19,71)
(19,52)-(19,56)
(19,57)-(19,70)
(19,58)-(19,63)
(19,65)-(19,66)
(19,68)-(19,69)
(21,6)-(23,38)
(21,13)-(21,56)
(21,13)-(21,33)
(21,14)-(21,18)
(21,19)-(21,32)
(21,20)-(21,25)
(21,27)-(21,28)
(21,30)-(21,31)
(21,36)-(21,56)
(21,37)-(21,41)
(21,42)-(21,55)
(21,43)-(21,48)
(21,50)-(21,51)
(21,53)-(21,54)
(22,18)-(22,36)
(22,18)-(22,22)
(22,23)-(22,36)
(22,24)-(22,29)
(22,31)-(22,32)
(22,34)-(22,35)
(23,19)-(23,37)
(23,19)-(23,23)
(23,24)-(23,37)
(23,25)-(23,30)
(23,32)-(23,33)
(23,35)-(23,36)
*)
