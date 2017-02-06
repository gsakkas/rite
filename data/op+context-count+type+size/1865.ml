
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
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr2) ->
      "((" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr2) ^ "/2)")))
  | Times (expr,expr2) -> (exprToString expr) ^ ("*" exprToString expr2)
  | Thresh (expr,expr2,expr3,expr4) ->
      "(" ^
        ((exprToString expr) ^
           ("<" ^
              ((exprToString expr2) ^
                 ("?" ^
                    ((exprToString expr3) ^ (":" ^ (exprToString expr4 ")")))))));;


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
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr2) ->
      "((" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr2) ^ "/2)")))
  | Times (expr,expr2) -> (exprToString expr) ^ ("*" ^ (exprToString expr2))
  | Thresh (expr,expr2,expr3,expr4) ->
      "(" ^
        ((exprToString expr) ^
           ("<" ^
              ((exprToString expr2) ^
                 ("?" ^
                    ((exprToString expr3) ^
                       (":" ^ ((exprToString expr4) ^ ")")))))));;

*)

(* changed spans
(19,50)-(19,53)
(19,54)-(19,66)
(26,53)-(26,65)
(26,66)-(26,71)
(26,72)-(26,75)
*)

(* type error slice
(11,22)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,3)-(26,75)
(12,9)-(12,10)
(15,18)-(15,27)
(15,18)-(15,56)
(15,28)-(15,29)
(15,32)-(15,44)
(15,32)-(15,49)
(15,32)-(15,49)
(15,32)-(15,56)
(15,32)-(15,56)
(15,45)-(15,49)
(15,51)-(15,52)
(15,53)-(15,56)
(16,20)-(16,28)
(16,20)-(16,57)
(16,29)-(16,30)
(16,33)-(16,45)
(16,33)-(16,50)
(16,33)-(16,57)
(16,46)-(16,50)
(16,52)-(16,53)
(16,54)-(16,57)
(18,7)-(18,11)
(18,7)-(18,73)
(18,12)-(18,13)
(18,16)-(18,28)
(18,16)-(18,33)
(18,16)-(18,73)
(18,29)-(18,33)
(18,35)-(18,36)
(18,38)-(18,41)
(18,38)-(18,73)
(18,42)-(18,43)
(18,46)-(18,58)
(18,46)-(18,64)
(18,46)-(18,73)
(18,59)-(18,64)
(18,66)-(18,67)
(18,68)-(18,73)
(19,28)-(19,40)
(19,28)-(19,45)
(19,28)-(19,72)
(19,28)-(19,72)
(19,41)-(19,45)
(19,47)-(19,48)
(19,50)-(19,53)
(19,50)-(19,72)
(19,50)-(19,72)
(19,50)-(19,72)
(19,54)-(19,66)
(19,67)-(19,72)
(21,7)-(21,10)
(21,11)-(21,12)
(22,11)-(22,23)
(22,11)-(22,28)
(22,24)-(22,28)
(22,30)-(22,31)
(23,13)-(23,16)
(23,17)-(23,18)
(24,17)-(24,29)
(24,17)-(24,35)
(24,30)-(24,35)
(24,37)-(24,38)
(25,19)-(25,22)
(25,23)-(25,24)
(26,23)-(26,35)
(26,23)-(26,41)
(26,36)-(26,41)
(26,43)-(26,44)
(26,46)-(26,49)
(26,50)-(26,51)
(26,53)-(26,65)
(26,53)-(26,75)
(26,66)-(26,71)
(26,72)-(26,75)
*)
