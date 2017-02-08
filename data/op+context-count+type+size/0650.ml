
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Log of expr
  | SumOfSquares of expr* expr* expr;;

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
  | Log e1 -> let b = eval (e1, x, y) in if b > 1.0 then log b else 0.0
  | SumOfSquares (e1,e2,e3) ->
      (((eval (e1, x, y)) ** 2.0) + ((eval (e2, x, y)) ** 2.0)) +
        ((eval (e3, x, y)) ** 2.0);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Log of expr
  | SumOfSquares of expr* expr* expr;;

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
  | Log e1 -> let b = eval (e1, x, y) in if b > 1.0 then log b else 0.0
  | SumOfSquares (e1,e2,e3) ->
      (((eval (e1, x, y)) ** 2.0) +. ((eval (e2, x, y)) ** 2.0)) +.
        ((eval (e3, x, y)) ** 2.0);;

*)

(* changed spans
(29,10)-(29,33)
(29,10)-(29,62)
(29,10)-(30,34)
*)

(* type error slice
(16,3)-(30,34)
(16,3)-(30,34)
(19,16)-(19,19)
(19,16)-(19,42)
(29,10)-(29,33)
(29,10)-(29,62)
(29,10)-(29,62)
(29,10)-(30,34)
(29,10)-(30,34)
(29,27)-(29,29)
(29,39)-(29,62)
(29,56)-(29,58)
(30,11)-(30,34)
(30,28)-(30,30)
*)
