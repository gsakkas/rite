
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
(85,7)-(93,33)
(((eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))) *. ((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y))) *. (((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y))) *. ((((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)) +. eval (ex5 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* type error slice
(17,28)-(17,53)
(17,29)-(17,46)
(17,30)-(17,42)
(17,47)-(17,48)
(73,3)-(93,33)
(76,16)-(76,19)
(76,16)-(76,45)
(85,7)-(93,33)
(85,9)-(85,73)
(85,10)-(85,28)
(85,11)-(85,23)
(85,31)-(85,72)
(85,32)-(85,50)
(85,33)-(85,45)
(85,53)-(85,71)
(85,54)-(85,66)
(86,11)-(86,75)
(86,12)-(86,53)
(86,13)-(86,31)
(86,14)-(86,26)
(86,34)-(86,52)
(86,35)-(86,47)
(86,56)-(86,74)
(86,57)-(86,69)
(88,10)-(89,32)
(88,11)-(88,75)
(88,12)-(88,53)
(88,13)-(88,31)
(88,14)-(88,26)
(88,34)-(88,52)
(88,35)-(88,47)
(88,56)-(88,74)
(88,57)-(88,69)
(89,13)-(89,31)
(89,14)-(89,26)
(91,9)-(93,33)
(91,10)-(92,32)
(91,11)-(91,75)
(91,12)-(91,53)
(91,13)-(91,31)
(91,14)-(91,26)
(91,34)-(91,52)
(91,35)-(91,47)
(91,56)-(91,74)
(91,57)-(91,69)
(92,13)-(92,31)
(92,14)-(92,26)
(93,14)-(93,32)
(93,15)-(93,27)
*)
