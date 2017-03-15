
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
  | Sine e1 -> "sin pi*" ^ (exprToString e1)
  | Cosine e1 -> "cos pi*" ^ (exprToString e1)
  | Average (e1,e2) -> (exprToString e1) ^ ("+" ^ (exprToString e2 "/2"))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ("<" ^
           ((exprToString e2) ^
              ("?" ^ ((exprToString e3) ^ (":" ^ (exprToString e4))))));;


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
  | Sine e1 -> "sin pi*" ^ (exprToString e1)
  | Cosine e1 -> "cos pi*" ^ (exprToString e1)
  | Average (e1,e2) -> (exprToString e1) ^ ("+" ^ ((exprToString e2) ^ "/2"))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ("<" ^
           ((exprToString e2) ^
              ("?" ^ ((exprToString e3) ^ (":" ^ (exprToString e4))))));;

*)

(* changed spans
(17,51)-(17,63)
*)

(* type error slice
(15,15)-(15,44)
(15,25)-(15,26)
(15,27)-(15,44)
(15,28)-(15,40)
(17,50)-(17,72)
(17,51)-(17,63)
*)

(* all spans
(11,21)-(23,71)
(12,2)-(23,71)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,15)-(15,44)
(15,25)-(15,26)
(15,15)-(15,24)
(15,27)-(15,44)
(15,28)-(15,40)
(15,41)-(15,43)
(16,17)-(16,46)
(16,27)-(16,28)
(16,17)-(16,26)
(16,29)-(16,46)
(16,30)-(16,42)
(16,43)-(16,45)
(17,23)-(17,73)
(17,41)-(17,42)
(17,23)-(17,40)
(17,24)-(17,36)
(17,37)-(17,39)
(17,43)-(17,73)
(17,48)-(17,49)
(17,44)-(17,47)
(17,50)-(17,72)
(17,51)-(17,63)
(17,64)-(17,66)
(17,67)-(17,71)
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
(20,6)-(23,71)
(20,24)-(20,25)
(20,6)-(20,23)
(20,7)-(20,19)
(20,20)-(20,22)
(21,8)-(23,71)
(21,13)-(21,14)
(21,9)-(21,12)
(22,11)-(23,70)
(22,30)-(22,31)
(22,12)-(22,29)
(22,13)-(22,25)
(22,26)-(22,28)
(23,14)-(23,69)
(23,19)-(23,20)
(23,15)-(23,18)
(23,21)-(23,68)
(23,40)-(23,41)
(23,22)-(23,39)
(23,23)-(23,35)
(23,36)-(23,38)
(23,42)-(23,67)
(23,47)-(23,48)
(23,43)-(23,46)
(23,49)-(23,66)
(23,50)-(23,62)
(23,63)-(23,65)
*)
