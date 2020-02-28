
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
      ((sin (pi *. (eval (e, x, y)))) /. (cos (pi *. (eval (e, x, y))))) *.
        (sin (pi *. (eval (e, x, y))))
  | Timmy2 (e1,e2) ->
      ((sin (pi *. (eval (e, x, y)))) -. (cos (pi *. (eval (e, x, y))))) / 3;;


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
      ((sin (pi *. (eval (e, x, y)))) /. (cos (pi *. (eval (e, x, y))))) *.
        (sin (pi *. (eval (e, x, y))))
  | Timmy2 (e1,e2) ->
      ((sin (pi *. (eval (e, x, y)))) -. (cos (pi *. (eval (e, x, y))))) /.
        3.0;;

*)

(* changed spans
(31,7)-(31,77)
(sin (pi *. eval (e , x , y)) -. cos (pi *. eval (e , x , y))) /. 3.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(16,3)-(31,77)
(19,15)-(19,18)
(19,15)-(19,43)
(31,7)-(31,73)
(31,7)-(31,77)
*)
