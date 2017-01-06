
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


(* changed spans
(15,15)-(15,16)
(15,17)-(15,18)
(16,12)-(16,13)
(16,14)-(16,15)
(16,29)-(16,30)
(17,14)-(17,15)
(17,16)-(17,17)
(17,32)-(17,33)
(17,44)-(17,47)
(18,12)-(18,13)
(18,25)-(18,26)
(19,10)-(19,11)
(19,23)-(19,24)
*)

(* type error slice
(18,22)-(18,34)
*)
