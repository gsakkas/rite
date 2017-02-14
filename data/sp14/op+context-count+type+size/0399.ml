
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
(14,3)-(21,15)
(15,34)-(15,35)
(15,40)-(15,46)
(15,45)-(15,46)
(15,53)-(15,59)
(15,58)-(15,59)
(15,70)-(15,71)
(16,21)-(16,25)
(16,21)-(16,27)
(16,21)-(16,38)
(16,32)-(16,36)
(16,32)-(16,38)
(17,24)-(17,41)
(17,24)-(17,47)
(17,29)-(17,30)
(17,35)-(17,41)
(17,40)-(17,41)
(17,46)-(17,47)
(18,17)-(18,20)
(18,17)-(18,34)
(18,22)-(18,24)
(18,22)-(18,34)
(18,28)-(18,34)
(18,33)-(18,34)
(19,15)-(19,18)
(19,15)-(19,32)
(19,20)-(19,22)
(19,20)-(19,32)
(19,26)-(19,30)
(19,31)-(19,32)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(13,4)-(21,17)
(13,15)-(21,15)
(14,3)-(21,15)
(15,29)-(15,33)
(15,29)-(15,35)
(15,34)-(15,35)
(18,17)-(18,20)
(18,17)-(18,34)
(18,22)-(18,24)
(18,22)-(18,34)
(18,22)-(18,34)
(19,15)-(19,18)
(19,15)-(19,32)
(19,20)-(19,22)
(19,20)-(19,32)
(19,20)-(19,32)
*)
