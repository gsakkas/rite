
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ModF of expr
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
  | ModF e1 -> (match modf ((eval (e1, x, y)) *. 10) with | (f,i) -> f)
  | SumOfSquares (e1,e2,e3) ->
      ((((eval (e1, x, y)) ** 2.0) +. ((eval (e2, x, y)) ** 2.0)) +.
         ((eval (e3, x, y)) ** 2.0))
        /. 3.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ModF of expr
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
  | ModF e1 -> (match modf ((eval (e1, x, y)) *. 10.0) with | (f,i) -> f)
  | SumOfSquares (e1,e2,e3) ->
      ((((eval (e1, x, y)) ** 2.0) +. ((eval (e2, x, y)) ** 2.0)) +.
         ((eval (e3, x, y)) ** 2.0))
        /. 3.0;;

*)

(* changed spans
(27,50)-(27,52)
10.0
LitG

*)

(* type error slice
(27,16)-(27,72)
(27,23)-(27,27)
(27,23)-(27,53)
(27,28)-(27,53)
(27,50)-(27,52)
*)
