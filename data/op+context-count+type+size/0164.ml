
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr
  | FunckyRoot of expr* expr* expr;;

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
  | FunckyRoot (e1,e2,e3) ->
      sqrt
        ((sqrt (eval (e1, x, x))) (sqrt (eval (e2, x, y)))
           (sqrt (eval (e3, y, y))));;


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
  | FunckyRoot of expr* expr* expr;;

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
  | FunckyRoot (e1,e2,e3) ->
      ((sqrt (eval (e1, x, x))) *. (sqrt (eval (e2, x, y)))) *.
        (sqrt (eval (e3, y, y)));;

*)

(* changed spans
(29,7)-(29,11)
(29,7)-(31,33)
(30,11)-(30,31)
(30,11)-(31,33)
*)

(* type error slice
(16,3)-(31,33)
(19,28)-(19,32)
(19,28)-(19,42)
(19,34)-(19,36)
(19,34)-(19,42)
(19,38)-(19,39)
(19,41)-(19,42)
(30,11)-(30,15)
(30,11)-(30,31)
(30,11)-(31,33)
(30,17)-(30,21)
(30,17)-(30,31)
(30,23)-(30,25)
(30,23)-(30,31)
(30,27)-(30,28)
(30,30)-(30,31)
(30,36)-(30,40)
(30,36)-(30,56)
(30,42)-(30,46)
(30,42)-(30,56)
(30,48)-(30,50)
(30,48)-(30,56)
(30,52)-(30,53)
(30,55)-(30,56)
(31,13)-(31,17)
(31,13)-(31,33)
(31,19)-(31,23)
(31,19)-(31,33)
(31,25)-(31,27)
(31,25)-(31,33)
(31,29)-(31,30)
(31,32)-(31,33)
*)
