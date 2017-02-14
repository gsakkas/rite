
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
  | Thresh (w,x,y,z) -> if (eval w) < (eval x) then eval y else eval z
  | Times (x,y) -> (eval x) * (eval y)
  | Average (x,y) -> ((eval x) * (eval y)) / 2
  | Cosine x -> cos (pi * (eval x))
  | Sine x -> sin (pi * (eval x))
  | VarX  -> x
  | VarY  -> y;;


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
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | Times (t,u) -> (eval (t, x, y)) *. (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) *. (eval (u, x, y))) /. 2.0
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(14,2)-(21,14)
(15,33)-(15,34)
(15,38)-(15,46)
(15,44)-(15,45)
(15,52)-(15,58)
(15,57)-(15,58)
(15,69)-(15,70)
(16,19)-(16,27)
(16,19)-(16,38)
(16,20)-(16,24)
(16,30)-(16,38)
(16,31)-(16,35)
(17,21)-(17,42)
(17,21)-(17,46)
(17,28)-(17,29)
(17,33)-(17,41)
(17,39)-(17,40)
(17,45)-(17,46)
(18,16)-(18,19)
(18,16)-(18,35)
(18,20)-(18,35)
(18,21)-(18,23)
(18,26)-(18,34)
(18,32)-(18,33)
(19,14)-(19,17)
(19,14)-(19,33)
(19,18)-(19,33)
(19,19)-(19,21)
(19,25)-(19,29)
(19,30)-(19,31)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(13,3)-(21,16)
(13,14)-(21,14)
(14,2)-(21,14)
(15,27)-(15,35)
(15,28)-(15,32)
(15,33)-(15,34)
(18,16)-(18,19)
(18,16)-(18,35)
(18,20)-(18,35)
(18,20)-(18,35)
(18,21)-(18,23)
(19,14)-(19,17)
(19,14)-(19,33)
(19,18)-(19,33)
(19,18)-(19,33)
(19,19)-(19,21)
*)
