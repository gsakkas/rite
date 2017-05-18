
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SumInts of expr
  | Power of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> Printf.sprintf "x"
  | VarY  -> Printf.sprintf "y"
  | Sine expr -> Printf.sprintf "sin(pi*%s)" (exprToString expr)
  | Cosine expr -> Printf.sprintf "cos(pi*%s)" (exprToString expr)
  | Average (expr1,expr2) ->
      Printf.sprintf "((%s+%s)/2)" (exprToString expr1) (exprToString expr2)
  | Times (expr1,expr2) ->
      Printf.sprintf "%s*%s" (exprToString expr1) (exprToString expr2)
  | Thresh (expr1,expr2,expr3,expr4) ->
      Printf.sprintf "(%s<%s?%s:%s)" (exprToString expr1)
        (exprToString expr2) (exprToString expr3) (exprToString expr4)
  | SumInts expr1 -> Printf.sprintf "(%s*(%s+1)/2)" (exprToString expr1)
  | Power (expr1,expr2,expr3) ->
      Printf.sprintf "(%s^|%s+%s|)" (exprToString expr1) (exprToString expr2)
        (exprToString expr3);;
