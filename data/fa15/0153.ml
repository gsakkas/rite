
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
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) + (exprToString e2)) / 2
  | Times (e1,e2) -> (exprToString e1) * (exprToString e2)
  | Thresh (e1,e2,e3,e4) -> (exprToString e1) + (exprToString e2);;


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
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) ^ ("+" ^ (exprToString e2))) ^ "/2"
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) -> (exprToString e1) ^ ("+" ^ (exprToString e2));;

*)

(* changed spans
(17,23)-(17,62)
(17,23)-(17,66)
(17,24)-(17,41)
(17,44)-(17,61)
(17,65)-(17,66)
(18,21)-(18,38)
(18,21)-(18,58)
(18,41)-(18,58)
(19,28)-(19,45)
(19,28)-(19,65)
(19,48)-(19,65)
*)

(* type error slice
(12,2)-(19,65)
(13,13)-(13,16)
(15,15)-(15,27)
(15,15)-(15,30)
(16,17)-(16,29)
(16,17)-(16,32)
(17,23)-(17,62)
(17,23)-(17,66)
(17,24)-(17,41)
(17,25)-(17,37)
(18,21)-(18,58)
(19,28)-(19,65)
*)

(* all spans
(11,21)-(19,65)
(12,2)-(19,65)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,15)-(15,30)
(15,15)-(15,27)
(15,28)-(15,30)
(16,17)-(16,32)
(16,17)-(16,29)
(16,30)-(16,32)
(17,23)-(17,66)
(17,23)-(17,62)
(17,24)-(17,41)
(17,25)-(17,37)
(17,38)-(17,40)
(17,44)-(17,61)
(17,45)-(17,57)
(17,58)-(17,60)
(17,65)-(17,66)
(18,21)-(18,58)
(18,21)-(18,38)
(18,22)-(18,34)
(18,35)-(18,37)
(18,41)-(18,58)
(18,42)-(18,54)
(18,55)-(18,57)
(19,28)-(19,65)
(19,28)-(19,45)
(19,29)-(19,41)
(19,42)-(19,44)
(19,48)-(19,65)
(19,49)-(19,61)
(19,62)-(19,64)
*)
