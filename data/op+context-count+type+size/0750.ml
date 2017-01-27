
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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) + (eval (b, x, y))) / 2
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
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
(15,14)-(15,19)
(15,14)-(15,21)
(16,14)-(16,19)
(16,14)-(16,21)
(19,24)-(19,37)
(19,24)-(19,56)
(19,24)-(19,63)
(19,62)-(19,63)
*)

(* type error slice
(14,3)-(24,25)
(15,14)-(15,19)
(15,14)-(15,21)
(15,20)-(15,21)
(16,14)-(16,19)
(16,14)-(16,21)
(16,20)-(16,21)
(17,27)-(17,31)
(17,27)-(17,40)
(17,33)-(17,34)
(17,33)-(17,40)
(17,36)-(17,37)
(17,39)-(17,40)
(19,24)-(19,28)
(19,24)-(19,37)
(19,24)-(19,56)
(19,24)-(19,63)
(19,30)-(19,31)
(19,30)-(19,37)
(19,33)-(19,34)
(19,36)-(19,37)
(19,43)-(19,47)
(19,43)-(19,56)
(19,49)-(19,50)
(19,49)-(19,56)
(19,52)-(19,53)
(19,55)-(19,56)
*)
