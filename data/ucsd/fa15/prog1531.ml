
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

let _ = exprToString Golden VarX;;
