
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
  | Sine e -> ("sine(" + (eval e)) + ")"
  | Cosine e -> ("cos(" + (eval e)) + ")"
  | Average (e1,e2) -> ((("(" eval e1) + "+") + (eval e2)) + ")/2"
  | Times (e1,e2) -> ((eval e1) + "*") + (eval e2)
  | Thresh (e1,e2,e3,e4) ->
      ((((((("(" + (eval e1)) + "<") + (eval e2)) + "?") + (eval e3)) + ":")
         + (eval e4))
        + ")";;
