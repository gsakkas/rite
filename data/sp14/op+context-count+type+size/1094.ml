
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
(12,2)-(21,69)
(12,2)-(21,69)
(12,2)-(21,69)
(12,2)-(21,69)
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
