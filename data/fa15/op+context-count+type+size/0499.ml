
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Golden of expr
  | MeanPi of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi*" ^ ((exprToString expr) ^ ")")
  | Average (expr1,expr2) ->
      "(" ^ ((exprToString expr1) ^ ("+" ^ ((exprToString expr2) ^ ")/2")))
  | Times (expr1,expr2) ->
      (exprToString expr1) ^ ("*" ^ (exprToString expr2))
  | Thresh (expr1,expr2,expr3,expr4) ->
      "(" ^
        ((exprToString expr1) ^
           ("<" ^
              ((exprToString expr2) ^
                 ("?" ^
                    ((exprToString expr3) ^
                       (":" ^ ((exprToString expr4) ^ ")")))))))
  | Golden expr -> "cos(" ^ (exprToString expr "^2-" exprToString expr "-1)")
  | MeanPi (expr1,expr2,expr3) ->
      "sin(" ^
        ((exprToString expr1) ^
           ("+" ^
              ((exprToString expr2) ^ ("+" ^ ((exprToString expr3) ^ ")")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Golden of expr
  | MeanPi of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi*" ^ ((exprToString expr) ^ ")")
  | Average (expr1,expr2) ->
      "(" ^ ((exprToString expr1) ^ ("+" ^ ((exprToString expr2) ^ ")/2")))
  | Times (expr1,expr2) ->
      (exprToString expr1) ^ ("*" ^ (exprToString expr2))
  | Thresh (expr1,expr2,expr3,expr4) ->
      "(" ^
        ((exprToString expr1) ^
           ("<" ^
              ((exprToString expr2) ^
                 ("?" ^
                    ((exprToString expr3) ^
                       (":" ^ ((exprToString expr4) ^ ")")))))))
  | Golden expr ->
      "cos(" ^
        ((exprToString expr) ^ ("^2-" ^ ((exprToString expr) ^ "-1)")))
  | MeanPi (expr1,expr2,expr3) ->
      "sin(" ^
        ((exprToString expr1) ^
           ("+" ^
              ((exprToString expr2) ^ ("+" ^ ((exprToString expr3) ^ ")")))));;

*)

(* changed spans
(31,28)-(31,77)
(31,29)-(31,41)
(31,47)-(31,52)
(31,53)-(31,65)
(36,46)-(36,66)
(36,47)-(36,59)
(36,60)-(36,65)
(36,67)-(36,68)
(36,69)-(36,72)
*)

(* type error slice
(17,29)-(17,56)
(17,30)-(17,49)
(17,31)-(17,43)
(17,50)-(17,51)
(31,28)-(31,77)
(31,29)-(31,41)
*)
