
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
  | Thresh (w,t,u,z) -> if (eval w) < (eval t) then eval u else eval z
  | Times (t,u) -> (eval t) * (eval u)
  | Average (t,u) -> ((eval t) * (eval u)) / 2
  | Cosine t -> cos (pi * (eval t))
  | Sine t -> sin (pi * (eval t))
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
(16,29)-(16,30)
(17,32)-(17,33)
(17,44)-(17,47)
(18,25)-(18,26)
(19,23)-(19,24)
*)

(* type error slice
(18,22)-(18,34)
*)
