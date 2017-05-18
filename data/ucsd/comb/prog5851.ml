
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
  | Sine e1 -> sin (3.142 *. (exprToString e1))
  | Cosine e1 -> cos (3.142 *. (exprToString e1))
  | Average (e1,e2) -> ((exprToString e1) +. (exprToString e2)) /. 2
  | Times (e1,e2) -> (exprToString e1) *. (exprToString e2);;
