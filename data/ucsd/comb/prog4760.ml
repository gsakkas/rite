
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
  | VarX  -> printf "x"
  | VarY  -> printf "y"
  | Sine e -> printf "sin(%s)" e
  | Cosine e -> printf "cos(%s)" e
  | (Average e1,e2) -> printf "%s+%s/2" e1 e2
  | (Times e1,e2) -> printf "%s*%s" e1 e2
  | (Thresh e1,e2,e3,e4) -> printf "(%s<%s?%s:%s)" e1 e2 e3 e4;;
