
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
  | Sine expr -> "sin(" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr) ->
      "(" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr) ^ ")/2)")))
  | Times (expr,expr) ->
      "(" ^ ((exprToString expr) ^ ("*" ^ ((exprToString expr) ^ ")")))
  | Thresh (expr,expr,expr,expr) ->
      "(" ^ (expr ^ ("<" ^ (expr ^ ("?" ^ (expr ^ (":" ^ (expr ^ ")")))))));;
