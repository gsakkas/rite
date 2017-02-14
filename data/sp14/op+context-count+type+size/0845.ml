
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Factorial of expr
  | Sum3 of expr* expr* expr;;

let rec factorial x acc = if x = 0 then acc else factorial (x - 1) (x * acc);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Factorial e' -> factorial (eval e')
  | Sum3 (e1,e2,e3) -> ((eval e1) + (eval e2)) + (eval e3);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Factorial of expr
  | Sum3 of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y);;

*)

(* changed spans
(13,19)-(13,76)
(13,21)-(13,76)
(13,27)-(13,76)
(13,30)-(13,31)
(13,30)-(13,35)
(13,34)-(13,35)
(13,41)-(13,44)
(13,50)-(13,59)
(13,50)-(13,76)
(13,61)-(13,62)
(13,61)-(13,66)
(13,65)-(13,66)
(13,69)-(13,70)
(13,69)-(13,76)
(13,73)-(13,76)
(18,3)-(30,58)
(28,12)-(28,30)
(29,21)-(29,39)
(30,26)-(30,58)
*)

(* type error slice
(13,50)-(13,59)
(13,50)-(13,76)
(18,3)-(30,58)
(18,3)-(30,58)
(18,3)-(30,58)
(18,3)-(30,58)
(18,3)-(30,58)
(18,3)-(30,58)
(18,3)-(30,58)
(21,16)-(21,19)
(21,16)-(21,42)
(21,28)-(21,32)
(21,28)-(21,42)
(21,34)-(21,42)
(29,21)-(29,30)
(29,21)-(29,39)
(29,32)-(29,36)
(29,32)-(29,39)
(29,37)-(29,39)
(30,26)-(30,30)
(30,26)-(30,33)
(30,26)-(30,58)
(30,31)-(30,33)
(30,38)-(30,42)
(30,38)-(30,45)
(30,43)-(30,45)
(30,51)-(30,55)
(30,51)-(30,58)
(30,56)-(30,58)
*)
