
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
  | Average (u,v) -> ((eval (u, x, y)) +. (eval (v, x, y))) /. 2
  | Times (u,v) -> (eval (u, x, y)) *. (eval (v, x, y))
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
(19,64)-(19,65)
(21,34)-(21,35)
(21,40)-(21,46)
(21,45)-(21,46)
(21,53)-(21,57)
(21,53)-(21,59)
(21,58)-(21,59)
(21,65)-(21,69)
(21,70)-(21,71)
*)

(* type error slice
(14,3)-(21,71)
(17,22)-(17,26)
(17,22)-(17,35)
(17,28)-(17,29)
(17,28)-(17,35)
(17,31)-(17,32)
(17,34)-(17,35)
(19,24)-(19,65)
(19,64)-(19,65)
(21,29)-(21,33)
(21,29)-(21,35)
(21,34)-(21,35)
(21,40)-(21,44)
(21,40)-(21,46)
(21,45)-(21,46)
(21,53)-(21,57)
(21,53)-(21,59)
(21,58)-(21,59)
(21,65)-(21,69)
(21,65)-(21,71)
(21,70)-(21,71)
*)
