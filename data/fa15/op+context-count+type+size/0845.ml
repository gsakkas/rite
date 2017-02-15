
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ThreshRev of expr* expr* expr* expr
  | Square of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin ((eval (e1, x, y)) *. pi)
  | Cosine e1 -> cos ((eval (e1, x, y)) *. pi)
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | ThreshRev (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Square e1 -> e1 *. e1;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ThreshRev of expr* expr* expr* expr
  | Square of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin ((eval (e1, x, y)) *. pi)
  | Cosine e1 -> cos ((eval (e1, x, y)) *. pi)
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | ThreshRev (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Square e1 -> (eval (e1, x, y)) *. (eval (e1, x, y));;

*)

(* changed spans
(31,17)-(31,19)
(31,23)-(31,25)
*)

(* type error slice
(16,2)-(31,25)
(31,17)-(31,19)
(31,17)-(31,25)
(31,17)-(31,25)
(31,23)-(31,25)
*)
