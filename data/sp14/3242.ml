
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
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> ex1 ^ ("*" ^ ex2)
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;


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
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;

*)

(* changed spans
(19,23)-(19,26)
(19,36)-(19,39)
*)

(* type error slice
(12,2)-(26,81)
(19,23)-(19,26)
(19,23)-(19,40)
(19,27)-(19,28)
(19,29)-(19,40)
(19,34)-(19,35)
(19,36)-(19,39)
*)

(* all spans
(11,21)-(26,81)
(12,2)-(26,81)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,15)-(15,52)
(15,25)-(15,26)
(15,15)-(15,24)
(15,27)-(15,52)
(15,46)-(15,47)
(15,28)-(15,45)
(15,29)-(15,41)
(15,42)-(15,44)
(15,48)-(15,51)
(16,17)-(16,54)
(16,27)-(16,28)
(16,17)-(16,26)
(16,29)-(16,54)
(16,48)-(16,49)
(16,30)-(16,47)
(16,31)-(16,43)
(16,44)-(16,46)
(16,50)-(16,53)
(18,6)-(18,73)
(18,11)-(18,12)
(18,6)-(18,10)
(18,13)-(18,73)
(18,33)-(18,34)
(18,14)-(18,32)
(18,15)-(18,27)
(18,28)-(18,31)
(18,35)-(18,72)
(18,40)-(18,41)
(18,36)-(18,39)
(18,42)-(18,71)
(18,62)-(18,63)
(18,43)-(18,61)
(18,44)-(18,56)
(18,57)-(18,60)
(18,64)-(18,70)
(19,23)-(19,40)
(19,27)-(19,28)
(19,23)-(19,26)
(19,29)-(19,40)
(19,34)-(19,35)
(19,30)-(19,33)
(19,36)-(19,39)
(21,6)-(26,81)
(21,10)-(21,11)
(21,6)-(21,9)
(22,8)-(26,81)
(22,28)-(22,29)
(22,9)-(22,27)
(22,10)-(22,22)
(22,23)-(22,26)
(23,11)-(26,80)
(23,16)-(23,17)
(23,12)-(23,15)
(24,14)-(26,79)
(24,34)-(24,35)
(24,15)-(24,33)
(24,16)-(24,28)
(24,29)-(24,32)
(25,17)-(26,78)
(25,22)-(25,23)
(25,18)-(25,21)
(26,20)-(26,77)
(26,40)-(26,41)
(26,21)-(26,39)
(26,22)-(26,34)
(26,35)-(26,38)
(26,42)-(26,76)
(26,47)-(26,48)
(26,43)-(26,46)
(26,49)-(26,75)
(26,69)-(26,70)
(26,50)-(26,68)
(26,51)-(26,63)
(26,64)-(26,67)
(26,71)-(26,74)
*)
