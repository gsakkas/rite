
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
           +. (eval (ex5, x, y)))
  | TheThing (ex1,ex2,ex3) ->
      (((eval (ex1, x, y)) * (sin (pi * (eval (ex2, x, y))))) *
         (cos (pi * (eval (ex3, x, y)))))
        / 2;;


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
           +. (eval (ex5, x, y)))
  | TheThing (ex1,ex2,ex3) ->
      (((eval (ex1, x, y)) *. (sin (pi *. (eval (ex2, x, y))))) *.
         (cos (pi *. (eval (ex3, x, y)))))
        /. 2.;;

*)

(* changed spans
(38,7)-(38,61)
((eval (ex1 , x , y) *. sin (pi *. eval (ex2 , x , y))) *. cos (pi *. eval (ex3 , x , y))) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(38,8)-(38,26)
(eval (ex1 , x , y) *. sin (pi *. eval (ex2 , x , y))) *. cos (pi *. eval (ex3 , x , y))
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(38,8)-(38,26)
eval (ex1 , x , y) *. sin (pi *. eval (ex2 , x , y))
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(38,34)-(38,59)
pi *. eval (ex2 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(39,14)-(39,39)
pi *. eval (ex3 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(40,10)-(40,11)
2.0
LitG

*)
