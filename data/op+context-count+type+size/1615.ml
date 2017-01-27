
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
(14,3)-(24,25)
(15,14)-(15,15)
(17,27)-(17,31)
(17,27)-(17,40)
(17,33)-(17,34)
(17,33)-(17,40)
(17,36)-(17,37)
(17,39)-(17,40)
(18,17)-(18,20)
(18,17)-(18,41)
(18,22)-(18,24)
(18,22)-(18,41)
(18,28)-(18,32)
(18,28)-(18,41)
(18,34)-(18,35)
(18,34)-(18,41)
(18,37)-(18,38)
(18,40)-(18,41)
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
(20,21)-(20,25)
(20,21)-(20,34)
(20,21)-(20,53)
(20,27)-(20,28)
(20,27)-(20,34)
(20,30)-(20,31)
(20,33)-(20,34)
(20,40)-(20,44)
(20,40)-(20,53)
(20,46)-(20,47)
(20,46)-(20,53)
(20,49)-(20,50)
(20,52)-(20,53)
*)
