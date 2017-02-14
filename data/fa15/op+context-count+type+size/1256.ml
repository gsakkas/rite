
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
  | VarX  -> 0
  | VarY  -> 1
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) +. (exprToString e2)) / 2;;


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
(12,2)-(17,67)
(13,13)-(13,14)
(14,13)-(14,14)
(15,15)-(15,30)
(17,23)-(17,63)
(17,23)-(17,67)
(17,24)-(17,41)
(17,45)-(17,62)
(17,46)-(17,58)
(17,59)-(17,61)
(17,66)-(17,67)
*)

(* type error slice
(12,2)-(17,67)
(12,2)-(17,67)
(12,2)-(17,67)
(13,13)-(13,14)
(15,15)-(15,27)
(15,15)-(15,30)
(16,17)-(16,29)
(16,17)-(16,32)
(17,23)-(17,63)
(17,23)-(17,63)
(17,23)-(17,67)
(17,24)-(17,41)
(17,25)-(17,37)
*)
