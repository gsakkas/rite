
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
  | VarX  -> Printf.printf "x"
  | VarY  -> Printf.printf "y"
  | Sine e -> Printf.printf "sin(pi*%s)" e
  | Cosine e -> Printf.printf "cos(pi*%s)" (!exprToString) e
  | Average (e1,e2) ->
      Printf.printf "((%s + %s)/2)" exprToString e1 exprToString e2
  | Times (e1,e2) -> Printf.printf "%s * %s" exprToString e1 exprToString e2
  | Thresh (e1,e2,e3,e4) ->
      Printf.printf "(%s<%s ? %s : %s)" exprToString e1 exprToString e2
        exprToString e3 exprToString e4;;
