
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
(19,29)-(19,31)
(19,42)-(19,44)
(19,55)-(19,57)
(19,61)-(19,64)
(19,65)-(19,66)
(19,67)-(19,69)
*)

(* type error slice
(12,3)-(19,69)
(12,3)-(19,69)
(12,3)-(19,69)
(12,3)-(19,69)
(19,29)-(19,31)
(19,29)-(19,69)
(19,32)-(19,33)
(19,42)-(19,44)
(19,42)-(19,69)
(19,45)-(19,46)
(19,55)-(19,57)
(19,55)-(19,69)
(19,58)-(19,59)
(19,61)-(19,69)
(19,65)-(19,66)
(19,67)-(19,69)
*)
