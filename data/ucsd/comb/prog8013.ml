
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
  | VarX  -> "VarX"
  | VarY  -> "VarY"
  | Sine e -> "Sine"
  | Cosine e -> "Cosine"
  | Average (e,e) -> "Average"
  | Times e -> "Times"
  | Thresh e -> "Thresh";;
