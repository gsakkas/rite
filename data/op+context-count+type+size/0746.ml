
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
(15,14)-(15,19)
(15,14)-(15,21)
(16,14)-(16,19)
(16,14)-(16,21)
(17,20)-(17,39)
(18,22)-(18,41)
(19,24)-(19,37)
(19,24)-(19,56)
(19,24)-(19,63)
(19,62)-(19,63)
(20,21)-(20,34)
(20,21)-(20,53)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(13,4)-(24,28)
(13,15)-(24,25)
(14,3)-(24,25)
(14,9)-(14,10)
(15,14)-(15,19)
(15,14)-(15,21)
(15,20)-(15,21)
(16,14)-(16,19)
(16,14)-(16,21)
(16,20)-(16,21)
(17,15)-(17,18)
(17,15)-(17,39)
(17,20)-(17,22)
(17,20)-(17,39)
(17,26)-(17,30)
(17,26)-(17,39)
(17,32)-(17,33)
(17,32)-(17,39)
(17,35)-(17,36)
(17,38)-(17,39)
(18,17)-(18,20)
(18,17)-(18,41)
(18,22)-(18,24)
(18,22)-(18,41)
(19,24)-(19,63)
(20,21)-(20,53)
(22,7)-(24,25)
(23,12)-(23,16)
(23,12)-(23,25)
(23,18)-(23,19)
(23,18)-(23,25)
(23,21)-(23,22)
(23,24)-(23,25)
*)
