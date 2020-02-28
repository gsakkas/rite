
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
      ((((eval ex1) * ((eval ex1) + (eval ex2))) *
          (((eval ex1) + (eval ex2)) + (eval ex3)))
         * ((((eval ex1) + (eval ex2)) + (eval ex3)) + (eval ex4)))
        *
        (((((eval ex1) + (eval ex2)) + (eval ex3)) + (eval ex4)) + (eval ex5));;


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
(28,7)-(32,79)
(((eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))) *. ((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y))) *. (((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y))) *. ((((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)) +. eval (ex5 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* type error slice
(16,3)-(32,79)
(19,16)-(19,19)
(19,16)-(19,45)
(19,27)-(19,44)
(19,28)-(19,32)
(19,33)-(19,43)
(28,7)-(32,79)
(28,10)-(28,20)
(28,11)-(28,15)
(28,16)-(28,19)
(28,24)-(28,34)
(28,25)-(28,29)
(28,30)-(28,33)
(28,37)-(28,47)
(28,38)-(28,42)
(28,43)-(28,46)
(29,13)-(29,23)
(29,14)-(29,18)
(29,19)-(29,22)
(29,26)-(29,36)
(29,27)-(29,31)
(29,32)-(29,35)
(29,40)-(29,50)
(29,41)-(29,45)
(29,46)-(29,49)
(30,15)-(30,25)
(30,16)-(30,20)
(30,21)-(30,24)
(30,28)-(30,38)
(30,29)-(30,33)
(30,34)-(30,37)
(30,42)-(30,52)
(30,43)-(30,47)
(30,48)-(30,51)
(30,56)-(30,66)
(30,57)-(30,61)
(30,62)-(30,65)
(32,13)-(32,23)
(32,14)-(32,18)
(32,19)-(32,22)
(32,26)-(32,36)
(32,27)-(32,31)
(32,32)-(32,35)
(32,40)-(32,50)
(32,41)-(32,45)
(32,46)-(32,49)
(32,54)-(32,64)
(32,55)-(32,59)
(32,60)-(32,63)
(32,68)-(32,78)
(32,69)-(32,73)
(32,74)-(32,77)
*)
