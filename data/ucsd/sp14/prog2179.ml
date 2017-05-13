
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
  | VarX  -> Printf.sprintf "%s"
  | VarY  -> "%s" e
  | Sine e1 -> "%s" e1
  | Cosine e2 -> "%s" e2
  | Average (e3,e4) -> "%s %s" e3 e4
  | Times (e5,e6) -> "%s %s" e5 e6
  | Thresh (e7,e8,e9,e0) -> "%s %s %s %s" e7 e8 e9 e0;;
