
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
(28,9)-(28,27)
((eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))) *. ((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y))) *. (((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(28,9)-(28,27)
(eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))) *. ((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(28,9)-(28,27)
eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))
BopG (AppG (fromList [EmptyG])) (BopG EmptyG EmptyG)

(28,31)-(28,72)
eval (ex1 , x , y) +. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(29,11)-(29,52)
(eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(29,12)-(29,30)
eval (ex1 , x , y) +. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(31,11)-(31,52)
((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(31,12)-(31,30)
(eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(31,12)-(31,30)
eval (ex1 , x , y) +. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(34,11)-(34,52)
(((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)) +. eval (ex5 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(34,12)-(34,30)
((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(34,12)-(34,30)
(eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(34,12)-(34,30)
eval (ex1 , x , y) +. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)
