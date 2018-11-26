
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
                                ((exprToString ex2 "+") ^
                                   ((exprToString ex3) ^
                                      (")*(" ^
                                         ((exprToString ex1) ^
                                            ("+" ^
                                               ((exprToString ex2 "+") ^
                                                  ((exprToString ex3 "+") ^
                                                     ((exprToString ex4) ^
                                                        (")*(" ^
                                                           ((exprToString ex1)
                                                              ^
                                                              ("+" ^
                                                                 ((exprToString
                                                                    ex2 "+")
                                                                    ^
                                                                    (
                                                                    (exprToString
                                                                    ex3 "+")
                                                                    ^
                                                                    ((exprToString
                                                                    ex4 "+")
                                                                    ^
                                                                    ((exprToString
                                                                    ex5) ^
                                                                    "))")))))))))))))))))))))));;


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

*)

(* changed spans
(39,33)-(39,55)
exprToString ex2
AppG (fromList [VarG])

(39,51)-(39,54)
(^)
VarG

(39,51)-(39,54)
"+" ^ (exprToString ex3 ^ (")*(" ^ (exprToString ex1 ^ ("+" ^ (exprToString ex2 ^ ("+" ^ (exprToString ex3 ^ ("+" ^ (exprToString ex4 ^ (")*(" ^ (exprToString ex1 ^ ("+" ^ (exprToString ex2 ^ ("+" ^ (exprToString ex3 ^ ("+" ^ (exprToString ex4 ^ ("+" ^ (exprToString ex5 ^ "))")))))))))))))))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(44,48)-(44,70)
exprToString ex2
AppG (fromList [VarG])

(45,51)-(45,73)
"+"
LitG

(45,52)-(45,64)
(^)
VarG

(45,52)-(45,64)
exprToString ex3
AppG (fromList [VarG])

(45,69)-(45,72)
(^)
VarG

(45,69)-(45,72)
"+" ^ (exprToString ex4 ^ (")*(" ^ (exprToString ex1 ^ ("+" ^ (exprToString ex2 ^ ("+" ^ (exprToString ex3 ^ ("+" ^ (exprToString ex4 ^ ("+" ^ (exprToString ex5 ^ "))")))))))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(51,66)-(52,76)
exprToString ex2
AppG (fromList [VarG])

(55,68)-(56,76)
"+"
LitG

(55,69)-(55,81)
(^)
VarG

(55,69)-(55,81)
exprToString ex3
AppG (fromList [VarG])

(58,69)-(59,76)
"+"
LitG

(58,70)-(58,82)
(^)
VarG

(58,70)-(58,82)
exprToString ex4
AppG (fromList [VarG])

(59,72)-(59,75)
(^)
VarG

(59,72)-(59,75)
"+" ^ (exprToString ex5 ^ "))")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)
