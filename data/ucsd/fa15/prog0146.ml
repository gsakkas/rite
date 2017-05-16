
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
  | Sine a -> "sin(pi*" exprToString a ")"
  | Cosine a -> "cos(pi*" exprToString a ")"
  | Average (a,b) -> "((" exprToString a "+" exprToString b ")/2)"
  | Times (a,b) -> exprToString a "*" exprToString b
  | Thresh (a,b,c,d) ->
      "(" exprToString a "<" exprToString b "?" exprToString c ":"
        exprToString d ")";;
