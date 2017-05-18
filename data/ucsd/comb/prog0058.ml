
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
  | Sine m -> "sin(" ^ ((exprToString m) ^ ")")
  | Cosine m -> "cos(" ^ ((exprToString m) ^ ")")
  | (Average m,n) ->
      "((" ^ ((exprToStirng m) ^ ("+" ^ ((exprToString n) ^ ")/2)")));;
