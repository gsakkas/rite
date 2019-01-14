
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Div7 of expr
  | MultDivPi of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | MultDivPi (e1,e2,e3) ->
      (((eval (e1, x, y)) *. (eval (e2, x, y))) *. (eval (e3, x, y))) /. pi
  | Div7 e1 -> (eval (e1, x, y)) /. 7
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | VarY  -> y
  | VarX  -> x;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Div7 of expr
  | MultDivPi of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | MultDivPi (e1,e2,e3) ->
      (((eval (e1, x, y)) *. (eval (e2, x, y))) *. (eval (e3, x, y))) /. pi
  | Div7 e1 -> (eval (e1, x, y)) /. 7.0
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | VarY  -> y
  | VarX  -> x;;

*)

(* changed spans
(19,36)-(19,37)
7.0
LitG

*)
