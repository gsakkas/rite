
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr* expr
  | Timmy2 of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Timmy1 (e1,e2,e3) ->
      ((sin (pi *. (eval (e, x, y)))) +. (cos (pi *. (eval (e, x, y))))) *
        (cos (pi *. (eval (e, x, y))))
  | Timmy2 (e1,e2) ->
      (sin (pi *. (eval (e, x, y)))) / (cos (pi *. (eval (e, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr* expr
  | Timmy2 of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Timmy1 (e1,e2,e3) ->
      ((sin (pi *. (eval (e, x, y)))) +. (cos (pi *. (eval (e, x, y))))) *.
        (cos (pi *. (eval (e, x, y))))
  | Timmy2 (e1,e2) ->
      (sin (pi *. (eval (e, x, y)))) /. (cos (pi *. (eval (e, x, y))));;

*)

(* changed spans
(28,9)-(29,35)
(31,8)-(31,66)
*)

(* type error slice
(16,3)-(31,66)
(16,3)-(31,66)
(16,3)-(31,66)
(19,15)-(19,18)
(19,15)-(19,40)
(28,9)-(28,68)
(28,9)-(29,35)
(28,9)-(29,35)
(28,9)-(29,35)
(29,10)-(29,13)
(29,10)-(29,35)
(31,8)-(31,11)
(31,8)-(31,33)
(31,8)-(31,66)
(31,8)-(31,66)
(31,8)-(31,66)
(31,41)-(31,44)
(31,41)-(31,66)
*)
