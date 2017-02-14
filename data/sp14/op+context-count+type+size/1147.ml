
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Divide of expr* expr
  | MultDiv of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) when (eval (e1, x, y)) < (eval (e2, x, y)) ->
      eval (e3, x, y)
  | Thresh (e1,e2,e3,e4) -> eval (e4, x, y)
  | Divide (e1,e2) -> (eval (e1, x, y)) / (eval (e2, x, y))
  | MultDiv (e1,e2,e3) ->
      ((eval (e1, x, y)) * (eval (e2, x, y))) / (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Divide of expr* expr
  | MultDiv of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) when (eval (e1, x, y)) < (eval (e2, x, y)) ->
      eval (e3, x, y)
  | Thresh (e1,e2,e3,e4) -> eval (e4, x, y)
  | Divide (e1,e2) -> (eval (e1, x, y)) /. (eval (e2, x, y))
  | MultDiv (e1,e2,e3) ->
      ((eval (e1, x, y)) *. (eval (e2, x, y))) /. (eval (e3, x, y));;

*)

(* changed spans
(26,22)-(26,59)
(28,6)-(28,45)
(28,6)-(28,65)
(28,7)-(28,24)
*)

(* type error slice
(19,19)-(19,44)
(19,26)-(19,43)
(19,27)-(19,31)
(26,22)-(26,39)
(26,22)-(26,59)
(26,22)-(26,59)
(26,23)-(26,27)
(26,42)-(26,59)
(26,43)-(26,47)
(28,6)-(28,45)
(28,6)-(28,45)
(28,6)-(28,65)
(28,7)-(28,24)
(28,8)-(28,12)
(28,27)-(28,44)
(28,28)-(28,32)
(28,48)-(28,65)
(28,49)-(28,53)
*)
