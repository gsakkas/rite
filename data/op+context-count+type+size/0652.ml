
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
(17,14)-(17,15)
(19,28)-(19,32)
(19,28)-(19,42)
(19,34)-(19,36)
(19,34)-(19,42)
(19,38)-(19,39)
(19,41)-(19,42)
(29,10)-(29,14)
(29,10)-(29,24)
(29,10)-(29,33)
(29,10)-(29,62)
(29,10)-(30,34)
(29,16)-(29,18)
(29,16)-(29,24)
(29,20)-(29,21)
(29,23)-(29,24)
(29,27)-(29,29)
(29,30)-(29,33)
(29,39)-(29,43)
(29,39)-(29,53)
(29,39)-(29,62)
(29,45)-(29,47)
(29,45)-(29,53)
(29,49)-(29,50)
(29,52)-(29,53)
(29,56)-(29,58)
(29,59)-(29,62)
(30,11)-(30,15)
(30,11)-(30,25)
(30,11)-(30,34)
(30,17)-(30,19)
(30,17)-(30,25)
(30,21)-(30,22)
(30,24)-(30,25)
(30,28)-(30,30)
(30,31)-(30,34)
*)
