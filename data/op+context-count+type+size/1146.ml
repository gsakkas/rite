
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
(26,24)-(26,58)
(28,9)-(28,23)
(28,9)-(28,43)
(28,9)-(28,64)
*)

(* type error slice
(16,3)-(28,64)
(17,14)-(17,15)
(19,28)-(19,32)
(19,28)-(19,42)
(19,34)-(19,36)
(19,34)-(19,42)
(19,38)-(19,39)
(19,41)-(19,42)
(26,24)-(26,28)
(26,24)-(26,38)
(26,24)-(26,58)
(26,30)-(26,32)
(26,30)-(26,38)
(26,34)-(26,35)
(26,37)-(26,38)
(26,44)-(26,48)
(26,44)-(26,58)
(26,50)-(26,52)
(26,50)-(26,58)
(26,54)-(26,55)
(26,57)-(26,58)
(28,9)-(28,13)
(28,9)-(28,23)
(28,9)-(28,43)
(28,9)-(28,64)
(28,15)-(28,17)
(28,15)-(28,23)
(28,19)-(28,20)
(28,22)-(28,23)
(28,29)-(28,33)
(28,29)-(28,43)
(28,35)-(28,37)
(28,35)-(28,43)
(28,39)-(28,40)
(28,42)-(28,43)
(28,50)-(28,54)
(28,50)-(28,64)
(28,56)-(28,58)
(28,56)-(28,64)
(28,60)-(28,61)
(28,63)-(28,64)
*)
