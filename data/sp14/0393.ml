
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Chunky of expr* expr* expr
  | Monkey of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) /. 2.0) +. ((eval (e2, x, y)) /. 2.0)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Chunky (e1,e2,e3) ->
      ((eval (e1, x, y)) ** (eval (e2, x, y))) ** (eval (e3, x, y))
  | Monkey (e1,e2) ->
      if (eval (e1, x, y)) < (eval (e2, x, y)) then (-1) else 1;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Chunky of expr* expr* expr
  | Monkey of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) /. 2.0) +. ((eval (e2, x, y)) /. 2.0)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Chunky (e1,e2,e3) ->
      ((eval (e1, x, y)) ** (eval (e2, x, y))) ** (eval (e3, x, y))
  | Monkey (e1,e2) ->
      if (eval (e1, x, y)) < (eval (e2, x, y)) then (-1.0) else 1.0;;

*)

(* changed spans
(31,53)-(31,57)
(- 1.0)
UopG LitG

(31,63)-(31,64)
1.0
LitG

*)

(* type error slice
(16,3)-(31,64)
(19,15)-(19,18)
(19,15)-(19,43)
(31,7)-(31,64)
(31,63)-(31,64)
*)
