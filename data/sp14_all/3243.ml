
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
(39,34)-(39,56)
exprToString ex2
AppG (fromList [VarG])

(40,37)-(40,55)
"+"
LitG

(41,40)-(41,45)
exprToString ex3
AppG (fromList [VarG])

(42,43)-(42,61)
")*("
LitG

(43,46)-(43,49)
exprToString ex1
AppG (fromList [VarG])

(44,49)-(44,71)
"+"
LitG

(45,52)-(45,74)
exprToString ex2
AppG (fromList [VarG])

(46,55)-(46,73)
"+"
LitG

(47,58)-(47,63)
exprToString ex3
AppG (fromList [VarG])

(48,61)-(48,79)
"+"
LitG

(50,64)-(50,67)
exprToString ex4
AppG (fromList [VarG])

(51,67)-(52,77)
")*("
LitG

(55,69)-(56,77)
exprToString ex1
AppG (fromList [VarG])

(58,70)-(59,77)
"+"
LitG

(62,69)-(62,72)
ex2
VarG

(63,69)-(63,73)
"+" ^ (exprToString ex3 ^ ("+" ^ (exprToString ex4 ^ ("+" ^ (exprToString ex5 ^ "))")))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(17,28)-(17,53)
(17,29)-(17,46)
(17,30)-(17,42)
(17,47)-(17,48)
(39,34)-(39,56)
(39,35)-(39,47)
(44,49)-(44,71)
(44,50)-(44,62)
(45,52)-(45,74)
(45,53)-(45,65)
(51,67)-(52,77)
(51,68)-(51,80)
(55,69)-(56,77)
(55,70)-(55,82)
(58,70)-(59,77)
(58,71)-(58,83)
*)
