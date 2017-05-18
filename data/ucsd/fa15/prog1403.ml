
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
  | Sine i -> "sin" ^ (exprToString i)
  | Cosine i -> "cos" ^ (exprToString i)
  | (Average i1,i2) -> ((exprToString i1) + (exprToString i2)) / 2;;
