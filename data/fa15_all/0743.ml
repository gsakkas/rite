
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
exprToString expr ^ ("^2-" ^ (exprToString expr ^ "-1)"))
AppG (fromList [AppG (fromList [EmptyG])])

(31,29)-(31,41)
(^)
VarG

(31,29)-(31,41)
exprToString expr
AppG (fromList [VarG])

(31,47)-(31,52)
(^)
VarG

(31,47)-(31,52)
"^2-" ^ (exprToString expr ^ "-1)")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(31,53)-(31,65)
(^)
VarG

(31,53)-(31,65)
exprToString expr ^ "-1)"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(31,53)-(31,65)
exprToString expr
AppG (fromList [VarG])

*)
