
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr
  | DivideByOne of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | SquareRoot e' -> sqrt (eval (e', x, y))
  | DivideByOne (e1,e2,e3) ->
      sin
        (((1.0 /. (eval (e1, x, y))) + (1.0 /. (eval (e2, x, y)))) +
           (1.0 /. (eval (e3, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr
  | DivideByOne of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | SquareRoot e' -> sqrt (eval (e', x, y))
  | DivideByOne (e1,e2,e3) ->
      sin
        (((1.0 /. (eval (e1, x, y))) +. (1.0 /. (eval (e2, x, y)))) +.
           (1.0 /. (eval (e3, x, y))));;

*)

(* changed spans
(30,12)-(30,34)
(30,12)-(30,63)
(30,12)-(31,35)
*)

(* type error slice
(29,7)-(29,10)
(29,7)-(31,35)
(30,12)-(30,34)
(30,12)-(30,63)
(30,12)-(30,63)
(30,12)-(31,35)
(30,12)-(31,35)
(30,41)-(30,63)
(31,13)-(31,35)
*)
