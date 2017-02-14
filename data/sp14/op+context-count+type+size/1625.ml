
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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi * (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) + (eval (b, x, y))) / 2
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(18,20)-(18,43)
(19,21)-(19,58)
(19,21)-(19,62)
(19,22)-(19,38)
(19,61)-(19,62)
(20,19)-(20,35)
(20,19)-(20,54)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(17,18)-(17,42)
(17,25)-(17,41)
(17,26)-(17,30)
(18,16)-(18,19)
(18,16)-(18,43)
(18,20)-(18,43)
(18,20)-(18,43)
(18,20)-(18,43)
(18,21)-(18,23)
(18,26)-(18,42)
(18,27)-(18,31)
(19,21)-(19,58)
(19,21)-(19,58)
(19,22)-(19,38)
(19,23)-(19,27)
(19,41)-(19,57)
(19,42)-(19,46)
(20,19)-(20,35)
(20,19)-(20,54)
(20,19)-(20,54)
(20,20)-(20,24)
(20,38)-(20,54)
(20,39)-(20,43)
*)
