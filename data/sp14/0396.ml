
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
(19,49)-(19,52)
(19,53)-(19,65)
(26,52)-(26,64)
*)

(* type error slice
(15,29)-(15,56)
(15,30)-(15,49)
(15,31)-(15,43)
(15,50)-(15,51)
(19,48)-(19,72)
(19,49)-(19,52)
(26,51)-(26,75)
(26,52)-(26,64)
*)

(* all spans
(11,21)-(26,81)
(12,2)-(26,81)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,17)-(15,56)
(15,27)-(15,28)
(15,17)-(15,26)
(15,29)-(15,56)
(15,50)-(15,51)
(15,30)-(15,49)
(15,31)-(15,43)
(15,44)-(15,48)
(15,52)-(15,55)
(16,19)-(16,57)
(16,28)-(16,29)
(16,19)-(16,27)
(16,30)-(16,57)
(16,51)-(16,52)
(16,31)-(16,50)
(16,32)-(16,44)
(16,45)-(16,49)
(16,53)-(16,56)
(18,6)-(18,75)
(18,11)-(18,12)
(18,6)-(18,10)
(18,13)-(18,75)
(18,34)-(18,35)
(18,14)-(18,33)
(18,15)-(18,27)
(18,28)-(18,32)
(18,36)-(18,74)
(18,41)-(18,42)
(18,37)-(18,40)
(18,43)-(18,73)
(18,65)-(18,66)
(18,44)-(18,64)
(18,45)-(18,57)
(18,58)-(18,63)
(18,67)-(18,72)
(19,26)-(19,72)
(19,46)-(19,47)
(19,26)-(19,45)
(19,27)-(19,39)
(19,40)-(19,44)
(19,48)-(19,72)
(19,49)-(19,52)
(19,53)-(19,65)
(19,66)-(19,71)
(21,6)-(26,81)
(21,10)-(21,11)
(21,6)-(21,9)
(22,8)-(26,81)
(22,29)-(22,30)
(22,9)-(22,28)
(22,10)-(22,22)
(22,23)-(22,27)
(23,11)-(26,80)
(23,16)-(23,17)
(23,12)-(23,15)
(24,14)-(26,79)
(24,36)-(24,37)
(24,15)-(24,35)
(24,16)-(24,28)
(24,29)-(24,34)
(25,17)-(26,78)
(25,22)-(25,23)
(25,18)-(25,21)
(26,20)-(26,77)
(26,42)-(26,43)
(26,21)-(26,41)
(26,22)-(26,34)
(26,35)-(26,40)
(26,44)-(26,76)
(26,49)-(26,50)
(26,45)-(26,48)
(26,51)-(26,75)
(26,52)-(26,64)
(26,65)-(26,70)
(26,71)-(26,74)
*)
