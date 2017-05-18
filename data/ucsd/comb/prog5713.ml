
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
  | Sine e1 -> sin e1
  | Cosine e1 -> "cos" + (exprToString e1)
  | Average (e1,e2) -> "avg"
  | Times (e1,e2) -> (exprToSring e1) + "*";;
