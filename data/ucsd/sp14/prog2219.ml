
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
