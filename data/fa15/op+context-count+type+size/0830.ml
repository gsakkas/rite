
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

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
  | Op1 e1 -> (eval (e1, x, y)) /. ((eval (e1, x, y)) *. (eval (e1, x, y)))
  | Op2 (e1,e2,e3) -> 1.0 /. (((eval e1) +. (eval e2)) +. (eval e3));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

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
  | Op1 e1 -> (eval (e1, x, y)) /. ((eval (e1, x, y)) *. (eval (e1, x, y)))
  | Op2 (e1,e2,e3) ->
      1.0 /. (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)));;

*)

(* changed spans
(28,37)-(28,39)
(28,44)-(28,53)
(28,50)-(28,52)
(28,58)-(28,67)
(28,59)-(28,63)
(28,64)-(28,66)
*)

(* type error slice
(16,2)-(28,68)
(16,2)-(28,68)
(16,2)-(28,68)
(19,26)-(19,43)
(19,27)-(19,31)
(19,32)-(19,42)
(28,31)-(28,40)
(28,32)-(28,36)
(28,37)-(28,39)
(28,44)-(28,53)
(28,45)-(28,49)
(28,50)-(28,52)
(28,58)-(28,67)
(28,59)-(28,63)
(28,64)-(28,66)
*)
