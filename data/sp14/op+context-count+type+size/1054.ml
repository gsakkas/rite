
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
(28,11)-(28,26)
(28,11)-(29,72)
(28,11)-(32,29)
(28,11)-(36,30)
(28,34)-(28,70)
(29,14)-(29,29)
(29,14)-(29,50)
(29,14)-(29,72)
(31,14)-(31,29)
(31,14)-(31,50)
(31,14)-(31,72)
(31,14)-(32,29)
(34,14)-(34,29)
(34,14)-(34,50)
(34,14)-(34,72)
(34,14)-(35,29)
(34,14)-(36,30)
*)

(* type error slice
(19,21)-(19,42)
(19,28)-(19,32)
(19,28)-(19,42)
(28,11)-(28,70)
(28,11)-(28,70)
(28,11)-(29,72)
(28,34)-(28,38)
(28,34)-(28,49)
(28,34)-(28,70)
(28,34)-(28,70)
(28,34)-(28,70)
(28,55)-(28,59)
(28,55)-(28,70)
(29,14)-(29,18)
(29,14)-(29,29)
(29,14)-(29,50)
(29,14)-(29,50)
(29,14)-(29,72)
(29,35)-(29,39)
(29,35)-(29,50)
(29,57)-(29,61)
(29,57)-(29,72)
(31,14)-(31,18)
(31,14)-(31,29)
(31,14)-(31,50)
(31,14)-(31,50)
(31,14)-(31,72)
(31,14)-(32,29)
(31,35)-(31,39)
(31,35)-(31,50)
(31,57)-(31,61)
(31,57)-(31,72)
(32,14)-(32,18)
(32,14)-(32,29)
(34,14)-(34,18)
(34,14)-(34,29)
(34,14)-(34,50)
(34,14)-(34,50)
(34,14)-(34,72)
(34,14)-(35,29)
(34,14)-(36,30)
(34,35)-(34,39)
(34,35)-(34,50)
(34,57)-(34,61)
(34,57)-(34,72)
(35,14)-(35,18)
(35,14)-(35,29)
(36,15)-(36,19)
(36,15)-(36,30)
*)
