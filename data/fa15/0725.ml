
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Golden of expr
  | MeanPi of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi*" ^ ((exprToString expr) ^ ")")
  | Average (expr1,expr2) ->
      "(" ^ ((exprToString expr1) ^ ("+" ^ ((exprToString expr2) ^ ")/2")))
  | Times (expr1,expr2) ->
      (exprToString expr1) ^ ("*" ^ (exprToString expr2))
  | Thresh (expr1,expr2,expr3,expr4) ->
      "(" ^
        ((exprToString expr1) ^
           ("<" ^
              ((exprToString expr2) ^
                 ("?" ^
                    ((exprToString expr3) ^
                       (":" ^ ((exprToString expr4) ^ ")")))))))
  | Golden expr -> "cos(" ^ (exprToString expr "^2-" exprToString expr "-1)")
  | MeanPi (expr1,expr2,expr3) ->
      "sin(" ^
        ((exprToString expr1) ^
           ("+" ^
              ((exprToString expr2) ^ ("+" ^ ((exprToString expr3) ^ ")")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Golden of expr
  | MeanPi of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi*" ^ ((exprToString expr) ^ ")")
  | Average (expr1,expr2) ->
      "(" ^ ((exprToString expr1) ^ ("+" ^ ((exprToString expr2) ^ ")/2")))
  | Times (expr1,expr2) ->
      (exprToString expr1) ^ ("*" ^ (exprToString expr2))
  | Thresh (expr1,expr2,expr3,expr4) ->
      "(" ^
        ((exprToString expr1) ^
           ("<" ^
              ((exprToString expr2) ^
                 ("?" ^
                    ((exprToString expr3) ^
                       (":" ^ ((exprToString expr4) ^ ")")))))))
  | Golden expr ->
      "cos(" ^
        ((exprToString expr) ^ ("^2-" ^ ((exprToString expr) ^ "-1)")))
  | MeanPi (expr1,expr2,expr3) ->
      "sin(" ^
        ((exprToString expr1) ^
           ("+" ^
              ((exprToString expr2) ^ ("+" ^ ((exprToString expr3) ^ ")")))));;

*)

(* changed spans
(31,28)-(31,77)
(31,29)-(31,41)
(31,47)-(31,52)
(31,53)-(31,65)
*)

(* type error slice
(17,29)-(17,56)
(17,30)-(17,49)
(17,31)-(17,43)
(17,50)-(17,51)
(31,28)-(31,77)
(31,29)-(31,41)
*)

(* all spans
(13,21)-(36,77)
(14,2)-(36,77)
(14,8)-(14,9)
(15,13)-(15,16)
(16,13)-(16,16)
(17,17)-(17,56)
(17,27)-(17,28)
(17,17)-(17,26)
(17,29)-(17,56)
(17,50)-(17,51)
(17,30)-(17,49)
(17,31)-(17,43)
(17,44)-(17,48)
(17,52)-(17,55)
(18,19)-(18,58)
(18,29)-(18,30)
(18,19)-(18,28)
(18,31)-(18,58)
(18,52)-(18,53)
(18,32)-(18,51)
(18,33)-(18,45)
(18,46)-(18,50)
(18,54)-(18,57)
(20,6)-(20,75)
(20,10)-(20,11)
(20,6)-(20,9)
(20,12)-(20,75)
(20,34)-(20,35)
(20,13)-(20,33)
(20,14)-(20,26)
(20,27)-(20,32)
(20,36)-(20,74)
(20,41)-(20,42)
(20,37)-(20,40)
(20,43)-(20,73)
(20,65)-(20,66)
(20,44)-(20,64)
(20,45)-(20,57)
(20,58)-(20,63)
(20,67)-(20,72)
(22,6)-(22,57)
(22,27)-(22,28)
(22,6)-(22,26)
(22,7)-(22,19)
(22,20)-(22,25)
(22,29)-(22,57)
(22,34)-(22,35)
(22,30)-(22,33)
(22,36)-(22,56)
(22,37)-(22,49)
(22,50)-(22,55)
(24,6)-(30,64)
(24,10)-(24,11)
(24,6)-(24,9)
(25,8)-(30,64)
(25,30)-(25,31)
(25,9)-(25,29)
(25,10)-(25,22)
(25,23)-(25,28)
(26,11)-(30,63)
(26,16)-(26,17)
(26,12)-(26,15)
(27,14)-(30,62)
(27,36)-(27,37)
(27,15)-(27,35)
(27,16)-(27,28)
(27,29)-(27,34)
(28,17)-(30,61)
(28,22)-(28,23)
(28,18)-(28,21)
(29,20)-(30,60)
(29,42)-(29,43)
(29,21)-(29,41)
(29,22)-(29,34)
(29,35)-(29,40)
(30,23)-(30,59)
(30,28)-(30,29)
(30,24)-(30,27)
(30,30)-(30,58)
(30,52)-(30,53)
(30,31)-(30,51)
(30,32)-(30,44)
(30,45)-(30,50)
(30,54)-(30,57)
(31,19)-(31,77)
(31,26)-(31,27)
(31,19)-(31,25)
(31,28)-(31,77)
(31,29)-(31,41)
(31,42)-(31,46)
(31,47)-(31,52)
(31,53)-(31,65)
(31,66)-(31,70)
(31,71)-(31,76)
(33,6)-(36,77)
(33,13)-(33,14)
(33,6)-(33,12)
(34,8)-(36,77)
(34,30)-(34,31)
(34,9)-(34,29)
(34,10)-(34,22)
(34,23)-(34,28)
(35,11)-(36,76)
(35,16)-(35,17)
(35,12)-(35,15)
(36,14)-(36,75)
(36,36)-(36,37)
(36,15)-(36,35)
(36,16)-(36,28)
(36,29)-(36,34)
(36,38)-(36,74)
(36,43)-(36,44)
(36,39)-(36,42)
(36,45)-(36,73)
(36,67)-(36,68)
(36,46)-(36,66)
(36,47)-(36,59)
(36,60)-(36,65)
(36,69)-(36,72)
*)
