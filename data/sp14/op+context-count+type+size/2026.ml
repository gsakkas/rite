
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
(21,33)-(21,34)
(21,38)-(21,46)
(21,44)-(21,45)
(21,52)-(21,56)
(21,52)-(21,58)
(21,57)-(21,58)
(21,64)-(21,68)
(21,69)-(21,70)
*)

(* type error slice
(14,2)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(17,20)-(17,36)
(17,21)-(17,25)
(17,26)-(17,35)
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
