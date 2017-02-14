
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
