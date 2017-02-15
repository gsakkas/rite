
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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) + (eval (e2, x, y))) / 2
  | Times (e1,e2) -> (eval (e1, x, y)) * (eval (e2, x, y))
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
  | VarX  -> 1.0 *. x
  | VarY  -> 1.0 *. y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(15,13)-(15,14)
(16,13)-(16,14)
(19,23)-(19,62)
(19,23)-(19,66)
(19,24)-(19,41)
(19,65)-(19,66)
(20,21)-(20,38)
(20,21)-(20,58)
(24,17)-(24,18)
(24,20)-(24,21)
(24,23)-(24,24)
*)

(* type error slice
(17,19)-(17,44)
(17,26)-(17,43)
(17,27)-(17,31)
(19,23)-(19,62)
(19,23)-(19,62)
(19,24)-(19,41)
(19,25)-(19,29)
(19,44)-(19,61)
(19,45)-(19,49)
(20,21)-(20,38)
(20,21)-(20,58)
(20,21)-(20,58)
(20,22)-(20,26)
(20,41)-(20,58)
(20,42)-(20,46)
*)
