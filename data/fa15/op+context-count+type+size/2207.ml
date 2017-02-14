
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Tower of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Power (a,b) ->
      if ((x < 1.0) && (x > (-1.0))) || ((y < 1.0) && (y > (-1.0)))
      then 0.5
      else (eval (a, x, y)) ** (eval (b, x, y))
  | Tower (a,b,c) ->
      if ((x < 1.0) && (x > (-1.0))) || ((y < 1.0) && (y > (-1.0)))
      then 0.5
      else ((eval (a, x, y)) + (eval (b, x, y))) + (eval (c, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Tower of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Power (a,b) ->
      if ((x < 1.0) && (x > (-1.0))) || ((y < 1.0) && (y > (-1.0)))
      then 0.5
      else (eval (a, x, y)) ** (eval (b, x, y))
  | Tower (a,b,c) ->
      if ((x < 1.0) && (x > (-1.0))) || ((y < 1.0) && (y > (-1.0)))
      then 0.5
      else ((eval (a, x, y)) +. (eval (b, x, y))) +. (eval (c, x, y));;

*)

(* changed spans
(34,14)-(34,27)
(34,14)-(34,46)
(34,14)-(34,66)
*)

(* type error slice
(19,20)-(19,40)
(19,27)-(19,31)
(19,27)-(19,40)
(28,12)-(28,13)
(28,12)-(28,19)
(28,12)-(28,19)
(28,16)-(28,19)
(28,25)-(28,26)
(28,25)-(28,34)
(28,25)-(28,34)
(28,30)-(28,34)
(28,30)-(28,34)
(28,31)-(28,34)
(28,43)-(28,44)
(28,43)-(28,50)
(28,43)-(28,50)
(28,47)-(28,50)
(28,56)-(28,57)
(28,56)-(28,65)
(28,56)-(28,65)
(28,61)-(28,65)
(28,61)-(28,65)
(28,62)-(28,65)
(32,7)-(34,66)
(32,7)-(34,66)
(32,25)-(32,26)
(32,25)-(32,34)
(32,25)-(32,34)
(32,30)-(32,34)
(32,30)-(32,34)
(32,31)-(32,34)
(32,56)-(32,57)
(32,56)-(32,65)
(32,56)-(32,65)
(32,61)-(32,65)
(32,61)-(32,65)
(32,62)-(32,65)
(33,12)-(33,15)
(34,14)-(34,18)
(34,14)-(34,27)
(34,14)-(34,46)
(34,14)-(34,46)
(34,14)-(34,66)
(34,14)-(34,66)
(34,33)-(34,37)
(34,33)-(34,46)
(34,53)-(34,57)
(34,53)-(34,66)
*)
