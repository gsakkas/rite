
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
  | Sine e -> "sin(" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) -> (exprToString e1) ^ ("+" ^ ((exprToString e2) ^ "/2"))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) -> e1 ^ ("<" ^ (e2 ^ ("?" ^ (e3 ^ (":" ^ e4)))));;


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
  | Sine e -> "sin(" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) -> (exprToString e1) ^ ("+" ^ ((exprToString e2) ^ "/2"))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ("<" ^
           ((exprToString e2) ^
              ("?" ^ ((exprToString e3) ^ (":" ^ (exprToString e4))))));;

*)

(* changed spans
(19,28)-(19,30)
(19,41)-(19,43)
(19,54)-(19,56)
(19,60)-(19,63)
(19,64)-(19,65)
(19,66)-(19,68)
*)

(* type error slice
(12,2)-(19,73)
(12,2)-(19,73)
(12,2)-(19,73)
(12,2)-(19,73)
(19,28)-(19,30)
(19,28)-(19,73)
(19,31)-(19,32)
(19,40)-(19,72)
(19,41)-(19,43)
(19,44)-(19,45)
(19,53)-(19,70)
(19,54)-(19,56)
(19,57)-(19,58)
(19,59)-(19,69)
(19,64)-(19,65)
(19,66)-(19,68)
*)

(* all spans
(11,21)-(19,73)
(12,2)-(19,73)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,47)
(15,21)-(15,22)
(15,14)-(15,20)
(15,23)-(15,47)
(15,41)-(15,42)
(15,24)-(15,40)
(15,25)-(15,37)
(15,38)-(15,39)
(15,43)-(15,46)
(16,16)-(16,49)
(16,23)-(16,24)
(16,16)-(16,22)
(16,25)-(16,49)
(16,43)-(16,44)
(16,26)-(16,42)
(16,27)-(16,39)
(16,40)-(16,41)
(16,45)-(16,48)
(17,23)-(17,77)
(17,41)-(17,42)
(17,23)-(17,40)
(17,24)-(17,36)
(17,37)-(17,39)
(17,43)-(17,77)
(17,48)-(17,49)
(17,44)-(17,47)
(17,50)-(17,76)
(17,69)-(17,70)
(17,51)-(17,68)
(17,52)-(17,64)
(17,65)-(17,67)
(17,71)-(17,75)
(18,21)-(18,66)
(18,39)-(18,40)
(18,21)-(18,38)
(18,22)-(18,34)
(18,35)-(18,37)
(18,41)-(18,66)
(18,46)-(18,47)
(18,42)-(18,45)
(18,48)-(18,65)
(18,49)-(18,61)
(18,62)-(18,64)
(19,28)-(19,73)
(19,31)-(19,32)
(19,28)-(19,30)
(19,33)-(19,73)
(19,38)-(19,39)
(19,34)-(19,37)
(19,40)-(19,72)
(19,44)-(19,45)
(19,41)-(19,43)
(19,46)-(19,71)
(19,51)-(19,52)
(19,47)-(19,50)
(19,53)-(19,70)
(19,57)-(19,58)
(19,54)-(19,56)
(19,59)-(19,69)
(19,64)-(19,65)
(19,60)-(19,63)
(19,66)-(19,68)
*)
