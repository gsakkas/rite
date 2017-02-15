
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
  | Sine ex -> let ex1 = eval (ex, x, y) in sin (pi * ex1)
  | Cosine ex -> cos (pi * (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) + (eval (ex2, x, y))) / 2
  | Times (ex1,ex2) -> (eval (ex1, x, y)) * (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y);;


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
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y);;

*)

(* changed spans
(17,15)-(17,58)
(17,25)-(17,29)
(17,44)-(17,47)
(17,48)-(17,58)
(17,49)-(17,51)
(17,54)-(17,57)
(18,17)-(18,45)
(18,21)-(18,45)
(19,25)-(19,66)
(19,25)-(19,70)
(19,26)-(19,44)
(19,69)-(19,70)
(20,23)-(20,41)
(20,23)-(20,62)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(17,44)-(17,47)
(17,44)-(17,58)
(17,48)-(17,58)
(17,48)-(17,58)
(17,49)-(17,51)
(18,17)-(18,20)
(18,17)-(18,45)
(18,21)-(18,45)
(18,21)-(18,45)
(18,22)-(18,24)
*)
