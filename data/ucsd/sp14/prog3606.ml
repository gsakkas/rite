
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
  | VarX  -> "X"
  | VarY  -> "Y"
  | Sine sin -> "sin"
  | Cosine cos -> "cos"
  | Average (n1,n2) -> "(" ^ (n1 ^ (n2 ^ "/ 2 )"))
  | Times (t1,t2) -> "(t1 * t2)"
  | Thresh (th1,th2,th3,th4) -> "thresh";;
