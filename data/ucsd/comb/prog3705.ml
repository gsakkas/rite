
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
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr2) ->
      "((" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr2) ^ "/2)")))
  | Times (expr,expr2) -> (exprToString expr) ^ ("*" ^ (exprToString expr2))
  | Thresh (expr,expr2,expr3,expr4) ->
      "(" ^
        ((exprToString expr) ^
           ("<" ^
              ((exprToString expr2) ^
                 ("?" ^
                    ((exprToString expr3) ^ (":" ^ (exprToString expr4 ")")))))));;
