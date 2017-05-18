
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
  | VarX  -> Printf.sprintf "x"
  | VarY  -> Printf.sprintf "y"
  | Sine expr -> Printf.sprintf "sin %s" exprToString expr
  | Cosine expr -> Printf.sprintf "cos %s" exprToString expr
  | Average (expr1,expr2) ->
      Printf.sprintf "%s + %s/2" exprToString expr1 exprToString expr2;;
