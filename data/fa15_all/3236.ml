
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
      ((((eval ex1) *. ((eval ex1) + (eval ex2))) *
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
(28,9)-(28,19)
((eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))) *. ((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y))) *. (((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(28,9)-(28,19)
(eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))) *. ((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(28,9)-(28,19)
eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))
BopG (AppG (fromList [EmptyG])) (BopG EmptyG EmptyG)

(28,15)-(28,18)
(ex1 , x , y)
TupleG (fromList [VarG])

(28,23)-(28,48)
x
VarG

(28,24)-(28,34)
y
VarG

(28,24)-(28,34)
eval (ex1 , x , y) +. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(28,30)-(28,33)
(ex1 , x , y)
TupleG (fromList [VarG])

(28,37)-(28,47)
x
VarG

(28,37)-(28,47)
y
VarG

(28,43)-(28,46)
(ex2 , x , y)
TupleG (fromList [VarG])

(29,11)-(29,36)
x
VarG

(29,12)-(29,22)
y
VarG

(29,12)-(29,22)
(eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(29,12)-(29,22)
eval (ex1 , x , y) +. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(29,18)-(29,21)
(ex1 , x , y)
TupleG (fromList [VarG])

(29,25)-(29,35)
x
VarG

(29,25)-(29,35)
y
VarG

(29,31)-(29,34)
(ex2 , x , y)
TupleG (fromList [VarG])

(29,39)-(29,49)
x
VarG

(29,39)-(29,49)
y
VarG

(29,45)-(29,48)
(ex3 , x , y)
TupleG (fromList [VarG])

(30,13)-(30,38)
x
VarG

(30,14)-(30,24)
y
VarG

(30,14)-(30,24)
((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(30,14)-(30,24)
(eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(30,14)-(30,24)
eval (ex1 , x , y) +. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(30,20)-(30,23)
(ex1 , x , y)
TupleG (fromList [VarG])

(30,27)-(30,37)
x
VarG

(30,27)-(30,37)
y
VarG

(30,33)-(30,36)
(ex2 , x , y)
TupleG (fromList [VarG])

(30,41)-(30,51)
x
VarG

(30,41)-(30,51)
y
VarG

(30,47)-(30,50)
(ex3 , x , y)
TupleG (fromList [VarG])

(30,55)-(30,65)
x
VarG

(30,55)-(30,65)
y
VarG

(30,61)-(30,64)
(ex4 , x , y)
TupleG (fromList [VarG])

(32,11)-(32,36)
x
VarG

(32,12)-(32,22)
y
VarG

(32,12)-(32,22)
(((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)) +. eval (ex5 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(32,12)-(32,22)
((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(32,12)-(32,22)
(eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(32,12)-(32,22)
eval (ex1 , x , y) +. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(32,18)-(32,21)
(ex1 , x , y)
TupleG (fromList [VarG])

(32,25)-(32,35)
x
VarG

(32,25)-(32,35)
y
VarG

(32,31)-(32,34)
(ex2 , x , y)
TupleG (fromList [VarG])

(32,39)-(32,49)
x
VarG

(32,39)-(32,49)
y
VarG

(32,45)-(32,48)
(ex3 , x , y)
TupleG (fromList [VarG])

(32,53)-(32,63)
x
VarG

(32,53)-(32,63)
y
VarG

(32,59)-(32,62)
(ex4 , x , y)
TupleG (fromList [VarG])

(32,67)-(32,77)
x
VarG

(32,67)-(32,77)
y
VarG

(32,73)-(32,76)
(ex5 , x , y)
TupleG (fromList [VarG])

*)
