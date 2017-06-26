
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
  | VarX  -> []
  | VarY  -> []
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Times (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Thresh (e1,e2,e3) ->
      (exprToString e1) ^ ((exprToString e2) ^ (exprToString e3));;


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
(12,2)-(20,65)
(13,13)-(13,15)
(14,13)-(14,15)
(15,15)-(15,30)
(20,47)-(20,64)
*)

(* type error slice
(12,2)-(20,65)
(13,13)-(13,15)
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
(20,6)-(20,65)
(20,24)-(20,25)
*)

(* all spans
(11,21)-(20,65)
(12,2)-(20,65)
(12,8)-(12,9)
(13,13)-(13,15)
(14,13)-(14,15)
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
(20,6)-(20,65)
(20,24)-(20,25)
(20,6)-(20,23)
(20,7)-(20,19)
(20,20)-(20,22)
(20,26)-(20,65)
(20,45)-(20,46)
(20,27)-(20,44)
(20,28)-(20,40)
(20,41)-(20,43)
(20,47)-(20,64)
(20,48)-(20,60)
(20,61)-(20,63)
*)
