
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
  | Sine x -> "sin(pi*%s)" x
  | Cosine x -> "cos(pi*%s)" x
  | Average (x,y) -> "((%s+%s)/2)" x y
  | Times (x,y) -> "%s*%s" x y
  | Thresh (x,y,z,a) -> "%s<%s?%s:%s" x y z a;;
