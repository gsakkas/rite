
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr* expr* expr* expr
  | TheThing of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y)
  | FiboPlus (ex1,ex2,ex3,ex4,ex5) ->
      ((((eval (ex1, x, y)) *. ((eval (ex1, x, y)) + (eval (ex2, x, y)))) *
          (((eval (ex1, x, y)) + (eval (ex2, x, y))) + (eval (ex3, x, y))))
         *
         ((((eval (ex1, x, y)) + (eval (ex2, x, y))) + (eval (ex3, x, y))) +
            (eval (ex4, x, y))))
        *
        (((((eval (ex1, x, y)) + (eval (ex2, x, y))) + (eval (ex3, x, y))) +
            (eval (ex4, x, y)))
           + (eval (ex5, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr* expr* expr* expr
  | TheThing of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y)
  | FiboPlus (ex1,ex2,ex3,ex4,ex5) ->
      ((((eval (ex1, x, y)) *. ((eval (ex1, x, y)) +. (eval (ex2, x, y)))) *.
          (((eval (ex1, x, y)) +. (eval (ex2, x, y))) +. (eval (ex3, x, y))))
         *.
         ((((eval (ex1, x, y)) +. (eval (ex2, x, y))) +. (eval (ex3, x, y)))
            +. (eval (ex4, x, y))))
        *.
        (((((eval (ex1, x, y)) +. (eval (ex2, x, y))) +. (eval (ex3, x, y)))
            +. (eval (ex4, x, y)))
           +. (eval (ex5, x, y)));;

*)

(* changed spans
(28,6)-(32,32)
(28,6)-(36,32)
(28,7)-(29,75)
(28,9)-(28,27)
(28,31)-(28,72)
(29,10)-(29,74)
(29,11)-(29,52)
(29,12)-(29,30)
(31,9)-(32,31)
(31,10)-(31,74)
(31,11)-(31,52)
(31,12)-(31,30)
(34,8)-(36,32)
(34,9)-(35,31)
(34,10)-(34,74)
(34,11)-(34,52)
(34,12)-(34,30)
*)

(* type error slice
(19,19)-(19,44)
(19,26)-(19,43)
(19,27)-(19,31)
(28,7)-(29,75)
(28,8)-(28,73)
(28,8)-(28,73)
(28,31)-(28,72)
(28,31)-(28,72)
(28,31)-(28,72)
(28,32)-(28,50)
(28,33)-(28,37)
(28,53)-(28,71)
(28,54)-(28,58)
(29,11)-(29,52)
(29,11)-(29,52)
(29,12)-(29,30)
(29,13)-(29,17)
(29,33)-(29,51)
(29,34)-(29,38)
(31,11)-(31,52)
(31,11)-(31,52)
(31,12)-(31,30)
(31,13)-(31,17)
(31,33)-(31,51)
(31,34)-(31,38)
(34,11)-(34,52)
(34,11)-(34,52)
(34,12)-(34,30)
(34,13)-(34,17)
(34,33)-(34,51)
(34,34)-(34,38)
*)
