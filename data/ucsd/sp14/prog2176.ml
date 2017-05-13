
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
  | VarX  -> "%s" e
  | VarY  -> "%s" e
  | Sine e -> "%s" e
  | Cosine e -> "%s" e
  | Average (e,e) -> "%s" e
  | Times (e,e) -> "%s" e
  | Thresh (e,e,e,e) -> "%s" e;;
