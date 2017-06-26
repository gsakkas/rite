
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
  | VarX  -> VarX
  | VarY  -> VarY
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Times (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ((exprToString e2) ^ ((exprToString e3) ^ (exprToString e4)));;


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
  | VarX  -> ""
  | VarY  -> ""
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Times (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ((exprToString e2) ^ ((exprToString e3) ^ (exprToString e4)));;

*)

(* changed spans
(13,13)-(13,17)
(14,13)-(14,17)
(15,15)-(15,30)
*)

(* type error slice
(12,2)-(21,69)
(13,13)-(13,17)
(15,15)-(15,27)
(15,15)-(15,30)
(16,17)-(16,29)
(16,17)-(16,32)
(17,23)-(17,60)
(17,41)-(17,42)
(17,43)-(17,60)
(17,44)-(17,56)
(18,21)-(18,58)
(18,39)-(18,40)
(20,6)-(21,69)
(20,24)-(20,25)
*)

(* all spans
(11,21)-(21,69)
(12,2)-(21,69)
(12,8)-(12,9)
(13,13)-(13,17)
(14,13)-(14,17)
(15,15)-(15,30)
(15,15)-(15,27)
(15,28)-(15,30)
(16,17)-(16,32)
(16,17)-(16,29)
(16,30)-(16,32)
(17,23)-(17,60)
(17,41)-(17,42)
(17,23)-(17,40)
(17,24)-(17,36)
(17,37)-(17,39)
(17,43)-(17,60)
(17,44)-(17,56)
(17,57)-(17,59)
(18,21)-(18,58)
(18,39)-(18,40)
(18,21)-(18,38)
(18,22)-(18,34)
(18,35)-(18,37)
(18,41)-(18,58)
(18,42)-(18,54)
(18,55)-(18,57)
(20,6)-(21,69)
(20,24)-(20,25)
(20,6)-(20,23)
(20,7)-(20,19)
(20,20)-(20,22)
(21,8)-(21,69)
(21,27)-(21,28)
(21,9)-(21,26)
(21,10)-(21,22)
(21,23)-(21,25)
(21,29)-(21,68)
(21,48)-(21,49)
(21,30)-(21,47)
(21,31)-(21,43)
(21,44)-(21,46)
(21,50)-(21,67)
(21,51)-(21,63)
(21,64)-(21,66)
*)
