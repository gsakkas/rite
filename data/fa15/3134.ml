
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | OneOver of expr
  | OneOverAvg of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | OneOver e ->
      if (eval (e, x, y)) > 1.0 then 1.0 /. (eval (e, x, y)) else 1.0 / 3.0
  | OneOverAvg (e1,e2,e3) ->
      if
        (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y))) > 1.0
      then
        1.0 /.
          (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)))
      else (-1.0) / 3.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | OneOver of expr
  | OneOverAvg of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | OneOver e ->
      if (eval (e, x, y)) > 1.0 then 1.0 /. (eval (e, x, y)) else 1.0 /. 3.0
  | OneOverAvg (e1,e2,e3) ->
      if
        (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y))) > 1.0
      then
        1.0 /.
          (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)))
      else (-1.0) /. 3.0;;

*)

(* changed spans
(28,67)-(28,76)
1.0 /. 3.0
BopG LitG LitG

(35,12)-(35,24)
(- 1.0) /. 3.0
BopG (UopG EmptyG) LitG

*)

(* type error slice
(28,7)-(28,76)
(28,38)-(28,61)
(28,67)-(28,70)
(28,67)-(28,76)
(28,73)-(28,76)
(30,7)-(35,24)
(33,9)-(34,74)
(35,12)-(35,18)
(35,12)-(35,24)
(35,14)-(35,17)
(35,21)-(35,24)
*)
