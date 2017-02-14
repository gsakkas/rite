
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
(17,26)-(17,38)
(17,26)-(17,41)
(17,26)-(17,61)
(17,26)-(17,67)
(17,39)-(17,41)
(17,46)-(17,58)
(17,46)-(17,61)
(17,59)-(17,61)
(17,66)-(17,67)
(18,23)-(18,38)
(18,23)-(18,58)
(18,43)-(18,58)
(19,30)-(19,45)
(19,30)-(19,65)
(19,50)-(19,65)
*)

(* type error slice
(12,3)-(19,65)
(12,3)-(19,65)
(12,3)-(19,65)
(12,3)-(19,65)
(12,3)-(19,65)
(12,3)-(19,65)
(13,14)-(13,17)
(15,16)-(15,28)
(15,16)-(15,31)
(16,18)-(16,30)
(16,18)-(16,33)
(17,26)-(17,38)
(17,26)-(17,41)
(17,26)-(17,61)
(17,26)-(17,67)
(18,23)-(18,58)
(19,30)-(19,65)
*)
