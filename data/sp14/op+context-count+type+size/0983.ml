
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
  | Sine e1 -> sin (pi * (eval (e1, x, y)))
  | Cosine e1 -> cos (pi * (eval (e1, x, y)))
  | Average (e1,e2) -> (eval (e1, x, y)) +. ((eval (e2, x, y)) /. 2.0)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;


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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> (eval (e1, x, y)) +. ((eval (e2, x, y)) /. 2.0)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(17,19)-(17,43)
(18,21)-(18,45)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(17,15)-(17,18)
(17,15)-(17,43)
(17,19)-(17,43)
(17,19)-(17,43)
(17,19)-(17,43)
(17,20)-(17,22)
(17,25)-(17,42)
(17,26)-(17,30)
(18,17)-(18,20)
(18,17)-(18,45)
(18,21)-(18,45)
(18,21)-(18,45)
(18,22)-(18,24)
(19,44)-(19,70)
(19,45)-(19,62)
(19,46)-(19,50)
(20,21)-(20,38)
(20,21)-(20,59)
(20,21)-(20,59)
(20,22)-(20,26)
(20,42)-(20,59)
(20,43)-(20,47)
*)
