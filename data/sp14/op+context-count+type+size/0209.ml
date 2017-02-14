
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
  | Sine a -> sin (pi *. (eval a))
  | Cosine a -> cos (pi *. (eval a))
  | Average (a,b) -> ((eval a) +. (eval b)) / 2
  | Times (a,b) -> (eval a) *. (eval b)
  | Thresh (a,b,c,d) -> if (eval a) < (eval b) then eval c else eval d;;


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
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(17,31)-(17,32)
(18,16)-(18,36)
(18,33)-(18,34)
(19,21)-(19,43)
(19,21)-(19,47)
(19,28)-(19,29)
(19,34)-(19,42)
(19,40)-(19,41)
(19,46)-(19,47)
(20,19)-(20,39)
(20,25)-(20,26)
(20,31)-(20,39)
(20,37)-(20,38)
(21,27)-(21,35)
(21,27)-(21,46)
(21,28)-(21,32)
(21,33)-(21,34)
(21,38)-(21,46)
(21,39)-(21,43)
(21,44)-(21,45)
(21,52)-(21,56)
(21,52)-(21,58)
(21,57)-(21,58)
(21,64)-(21,68)
(21,64)-(21,70)
(21,69)-(21,70)
*)

(* type error slice
(13,3)-(21,72)
(13,14)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(17,14)-(17,17)
(17,14)-(17,34)
(17,25)-(17,33)
(17,26)-(17,30)
(17,31)-(17,32)
(19,21)-(19,43)
(19,21)-(19,47)
(19,21)-(19,47)
*)
