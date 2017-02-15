
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
  | VarX  -> float x
  | VarY  -> float y
  | Sine a -> sin (pi * (eval (a, x, y)))
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
(15,13)-(15,18)
(15,13)-(15,20)
(16,13)-(16,18)
(16,13)-(16,20)
(17,18)-(17,41)
(18,20)-(18,43)
(19,21)-(19,58)
(19,21)-(19,62)
(19,22)-(19,38)
(19,61)-(19,62)
(20,19)-(20,35)
(20,19)-(20,54)
(24,17)-(24,18)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(13,3)-(24,27)
(13,14)-(24,25)
(14,2)-(24,25)
(14,2)-(24,25)
(14,2)-(24,25)
(14,2)-(24,25)
(15,13)-(15,18)
(15,13)-(15,20)
(17,14)-(17,17)
(17,14)-(17,41)
(17,18)-(17,41)
(17,18)-(17,41)
(17,18)-(17,41)
(17,19)-(17,21)
(17,24)-(17,40)
(17,25)-(17,29)
(18,16)-(18,19)
(18,16)-(18,43)
(18,20)-(18,43)
(18,20)-(18,43)
(18,21)-(18,23)
(19,21)-(19,62)
(20,19)-(20,54)
(22,6)-(24,25)
(23,11)-(23,15)
(23,11)-(23,25)
*)
