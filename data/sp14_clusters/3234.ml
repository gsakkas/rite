
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

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))))
  | FiboPlus (ex1,ex2,ex3,ex4,ex5) ->
      "((" ^
        ((exprToString ex1) ^
           (")*(" ^
              ((exprToString ex1) ^
                 ("+" ^
                    ((exprToString ex2) ^
                       (")*(" ^
                          ((exprToString ex1) ^
                             ("+" ^
                                ((exprToString ex2) ^
                                   ("+" ^
                                      ((exprToString ex3) ^
                                         (")*(" ^
                                            ((exprToString ex1) ^
                                               ("+" ^
                                                  ((exprToString ex2) ^
                                                     ("+" ^
                                                        ((exprToString ex3) ^
                                                           ("+" ^
                                                              ((exprToString
                                                                  ex4)
                                                                 ^
                                                                 (")*(" ^
                                                                    (
                                                                    (exprToString
                                                                    ex1) ^
                                                                    ("+" ^
                                                                    ((exprToString
                                                                    ex2) ^
                                                                    ("+" ^
                                                                    ((exprToString
                                                                    ex3) ^
                                                                    ("+" ^
                                                                    ((exprToString
                                                                    ex4) ^
                                                                    ("+" ^
                                                                    ((exprToString
                                                                    ex5) ^
                                                                    "))")))))))))))))))))))))))))))));;

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
      ((((exprToString ex1) * ((exprToString ex1) + (exprToString ex2))) *
          (((exprToString ex1) + (exprToString ex2)) + (exprToString ex3)))
         *
         ((((exprToString ex1) + (exprToString ex2)) + (exprToString ex3)) +
            (exprToString ex4)))
        *
        (((((exprToString ex1) + (exprToString ex2)) + (exprToString ex3)) +
            (exprToString ex4))
           + (exprToString ex5));;


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
(85,8)-(85,72)
(((eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))) *. ((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y))) *. (((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y))) *. ((((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)) +. eval (ex5 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(85,9)-(85,27)
((eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))) *. ((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y))) *. (((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(85,9)-(85,27)
(eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))) *. ((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(85,9)-(85,27)
eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))
BopG (AppG [EmptyG]) (BopG EmptyG EmptyG)

(85,10)-(85,22)
eval
VarG

(85,23)-(85,26)
(ex1 , x , y)
TupleG [VarG,VarG,VarG]

(85,30)-(85,71)
x
VarG

(85,31)-(85,49)
y
VarG

(85,31)-(85,49)
eval (ex1 , x , y) +. eval (ex2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(85,32)-(85,44)
eval
VarG

(85,45)-(85,48)
(ex1 , x , y)
TupleG [VarG,VarG,VarG]

(85,52)-(85,70)
x
VarG

(85,52)-(85,70)
y
VarG

(85,53)-(85,65)
eval
VarG

(85,66)-(85,69)
(ex2 , x , y)
TupleG [VarG,VarG,VarG]

(86,11)-(86,52)
x
VarG

(86,12)-(86,30)
y
VarG

(86,12)-(86,30)
(eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

(86,12)-(86,30)
eval (ex1 , x , y) +. eval (ex2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(86,13)-(86,25)
eval
VarG

(86,26)-(86,29)
(ex1 , x , y)
TupleG [VarG,VarG,VarG]

(86,33)-(86,51)
x
VarG

(86,33)-(86,51)
y
VarG

(86,34)-(86,46)
eval
VarG

(86,47)-(86,50)
(ex2 , x , y)
TupleG [VarG,VarG,VarG]

(86,55)-(86,73)
x
VarG

(86,55)-(86,73)
y
VarG

(86,56)-(86,68)
eval
VarG

(86,69)-(86,72)
(ex3 , x , y)
TupleG [VarG,VarG,VarG]

(88,11)-(88,52)
x
VarG

(88,12)-(88,30)
y
VarG

(88,12)-(88,30)
((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

(88,12)-(88,30)
(eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

(88,12)-(88,30)
eval (ex1 , x , y) +. eval (ex2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(88,13)-(88,25)
eval
VarG

(88,26)-(88,29)
(ex1 , x , y)
TupleG [VarG,VarG,VarG]

(88,33)-(88,51)
x
VarG

(88,33)-(88,51)
y
VarG

(88,34)-(88,46)
eval
VarG

(88,47)-(88,50)
(ex2 , x , y)
TupleG [VarG,VarG,VarG]

(88,55)-(88,73)
x
VarG

(88,55)-(88,73)
y
VarG

(88,56)-(88,68)
eval
VarG

(88,69)-(88,72)
(ex3 , x , y)
TupleG [VarG,VarG,VarG]

(89,12)-(89,30)
x
VarG

(89,12)-(89,30)
y
VarG

(89,13)-(89,25)
eval
VarG

(89,26)-(89,29)
(ex4 , x , y)
TupleG [VarG,VarG,VarG]

(91,11)-(91,52)
x
VarG

(91,12)-(91,30)
y
VarG

(91,12)-(91,30)
(((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)) +. eval (ex5 , x , y)
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

(91,12)-(91,30)
((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

(91,12)-(91,30)
(eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

(91,12)-(91,30)
eval (ex1 , x , y) +. eval (ex2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(91,13)-(91,25)
eval
VarG

(91,26)-(91,29)
(ex1 , x , y)
TupleG [VarG,VarG,VarG]

(91,33)-(91,51)
x
VarG

(91,33)-(91,51)
y
VarG

(91,34)-(91,46)
eval
VarG

(91,47)-(91,50)
(ex2 , x , y)
TupleG [VarG,VarG,VarG]

(91,55)-(91,73)
x
VarG

(91,55)-(91,73)
y
VarG

(91,56)-(91,68)
eval
VarG

(91,69)-(91,72)
(ex3 , x , y)
TupleG [VarG,VarG,VarG]

(92,12)-(92,30)
x
VarG

(92,12)-(92,30)
y
VarG

(92,13)-(92,25)
eval
VarG

(92,26)-(92,29)
(ex4 , x , y)
TupleG [VarG,VarG,VarG]

(93,13)-(93,31)
x
VarG

(93,13)-(93,31)
y
VarG

(93,14)-(93,26)
eval
VarG

(93,27)-(93,30)
(ex5 , x , y)
TupleG [VarG,VarG,VarG]

*)
