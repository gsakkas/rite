
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
  | Sine e' -> sin (pi * (eval (e', x, y)))
  | Cosine e' -> cos (pi * (eval (e', x, y)))
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
(15,14)-(15,15)
(16,14)-(16,15)
(17,21)-(17,41)
(18,23)-(18,43)
(19,26)-(19,40)
(19,26)-(19,60)
(19,26)-(19,67)
(19,66)-(19,67)
(20,23)-(20,37)
(20,23)-(20,57)
(24,18)-(24,19)
(24,21)-(24,22)
(24,24)-(24,25)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(17,16)-(17,19)
(17,16)-(17,41)
(17,21)-(17,23)
(17,21)-(17,41)
(17,21)-(17,41)
(18,18)-(18,21)
(18,18)-(18,43)
(18,23)-(18,25)
(18,23)-(18,43)
(18,23)-(18,43)
*)
