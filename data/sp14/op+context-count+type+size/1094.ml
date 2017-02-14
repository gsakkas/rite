
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
(13,14)-(13,18)
(14,14)-(14,18)
(15,16)-(15,31)
*)

(* type error slice
(12,3)-(21,67)
(12,3)-(21,67)
(12,3)-(21,67)
(12,3)-(21,67)
(12,3)-(21,67)
(12,3)-(21,67)
(13,14)-(13,18)
(15,16)-(15,28)
(15,16)-(15,31)
(16,18)-(16,30)
(16,18)-(16,33)
(17,25)-(17,60)
(17,42)-(17,43)
(17,45)-(17,57)
(17,45)-(17,60)
(18,23)-(18,58)
(18,40)-(18,41)
(20,8)-(21,67)
(20,25)-(20,26)
*)
