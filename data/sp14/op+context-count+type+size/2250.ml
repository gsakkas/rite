
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
  | Sine u -> pi *. (eval (u, x, y))
  | Cosine u -> cos (pi *. (eval u))
  | Average (u,v) -> ((eval u) +. (eval v)) /. 2
  | Times (u,v) -> (eval u) *. (eval v)
  | Thresh (s,t,u,v) -> if (eval s) < (eval t) then eval u else eval v;;


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
  | Sine u -> pi *. (eval (u, x, y))
  | Cosine u -> cos (pi *. (eval (u, x, y)))
  | Average (u,v) -> ((eval (u, x, y)) +. (eval (v, x, y))) /. 2.0
  | Times (u,v) -> (eval (u, x, y)) *. (eval (v, x, y))
  | Thresh (s,t,u,v) ->
      if (eval (s, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (v, x, y);;

*)

(* changed spans
(18,33)-(18,34)
(19,21)-(19,48)
(19,28)-(19,29)
(19,34)-(19,42)
(19,40)-(19,41)
(19,47)-(19,48)
(20,19)-(20,39)
(20,25)-(20,26)
(20,31)-(20,39)
(20,37)-(20,38)
(21,24)-(21,70)
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
(14,2)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(17,20)-(17,36)
(17,21)-(17,25)
(17,26)-(17,35)
(18,27)-(18,35)
(18,28)-(18,32)
(18,33)-(18,34)
(19,21)-(19,48)
(19,22)-(19,30)
(19,23)-(19,27)
(19,28)-(19,29)
(19,34)-(19,42)
(19,35)-(19,39)
(19,40)-(19,41)
(19,47)-(19,48)
(20,19)-(20,27)
(20,20)-(20,24)
(20,25)-(20,26)
(20,31)-(20,39)
(20,32)-(20,36)
(20,37)-(20,38)
(21,27)-(21,35)
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
