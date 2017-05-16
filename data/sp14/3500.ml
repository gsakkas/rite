
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine expr0 -> "sin(" ^ ((exprToString expr0) ^ ")")
  | Cosine expr0 -> "cos(" ^ ((exprToString expr0) ^ ")")
  | Average (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("+" ^ ((exprToString expr1) ^ ")/2)")))
  | Times (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("*" ^ ((exprToString expr1) ^ ")")))
  | Thresh (expr0,expr1,expr2,expr3) ->
      "(" ^
        (expr0 ^ ("<" ^ (expr1 ^ ("?" ^ (expr2 ^ (":" ^ (expr3 ^ ")")))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine expr0 -> "sin(" ^ ((exprToString expr0) ^ ")")
  | Cosine expr0 -> "cos(" ^ ((exprToString expr0) ^ ")")
  | Average (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("+" ^ ((exprToString expr1) ^ ")/2)")))
  | Times (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("*" ^ ((exprToString expr1) ^ ")")))
  | Thresh (expr0,expr1,expr2,expr3) ->
      "(" ^
        ((exprToString expr0) ^
           ("<" ^
              ((exprToString expr1) ^
                 ("?" ^
                    ((exprToString expr2) ^
                       (":" ^ ((exprToString expr3) ^ ")")))))));;

*)

(* changed spans
(23,9)-(23,14)
(23,25)-(23,30)
(23,41)-(23,46)
(23,57)-(23,62)
*)

(* type error slice
(12,2)-(23,75)
(12,2)-(23,75)
(12,2)-(23,75)
(12,2)-(23,75)
(23,8)-(23,75)
(23,9)-(23,14)
(23,15)-(23,16)
(23,24)-(23,73)
(23,25)-(23,30)
(23,31)-(23,32)
(23,40)-(23,71)
(23,41)-(23,46)
(23,47)-(23,48)
(23,56)-(23,69)
(23,57)-(23,62)
(23,63)-(23,64)
*)

(* all spans
(11,21)-(23,75)
(12,2)-(23,75)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,18)-(15,55)
(15,25)-(15,26)
(15,18)-(15,24)
(15,27)-(15,55)
(15,49)-(15,50)
(15,28)-(15,48)
(15,29)-(15,41)
(15,42)-(15,47)
(15,51)-(15,54)
(16,20)-(16,57)
(16,27)-(16,28)
(16,20)-(16,26)
(16,29)-(16,57)
(16,51)-(16,52)
(16,30)-(16,50)
(16,31)-(16,43)
(16,44)-(16,49)
(16,53)-(16,56)
(18,6)-(18,76)
(18,10)-(18,11)
(18,6)-(18,9)
(18,12)-(18,76)
(18,34)-(18,35)
(18,13)-(18,33)
(18,14)-(18,26)
(18,27)-(18,32)
(18,36)-(18,75)
(18,41)-(18,42)
(18,37)-(18,40)
(18,43)-(18,74)
(18,65)-(18,66)
(18,44)-(18,64)
(18,45)-(18,57)
(18,58)-(18,63)
(18,67)-(18,73)
(20,6)-(20,73)
(20,10)-(20,11)
(20,6)-(20,9)
(20,12)-(20,73)
(20,34)-(20,35)
(20,13)-(20,33)
(20,14)-(20,26)
(20,27)-(20,32)
(20,36)-(20,72)
(20,41)-(20,42)
(20,37)-(20,40)
(20,43)-(20,71)
(20,65)-(20,66)
(20,44)-(20,64)
(20,45)-(20,57)
(20,58)-(20,63)
(20,67)-(20,70)
(22,6)-(23,75)
(22,10)-(22,11)
(22,6)-(22,9)
(23,8)-(23,75)
(23,15)-(23,16)
(23,9)-(23,14)
(23,17)-(23,74)
(23,22)-(23,23)
(23,18)-(23,21)
(23,24)-(23,73)
(23,31)-(23,32)
(23,25)-(23,30)
(23,33)-(23,72)
(23,38)-(23,39)
(23,34)-(23,37)
(23,40)-(23,71)
(23,47)-(23,48)
(23,41)-(23,46)
(23,49)-(23,70)
(23,54)-(23,55)
(23,50)-(23,53)
(23,56)-(23,69)
(23,63)-(23,64)
(23,57)-(23,62)
(23,65)-(23,68)
*)
