
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
  | Sine e' -> Printf.sprintf "sin(pi*%s)" (exprToString e')
  | Cosine e' -> Printf.sprintf "cos(pi*%s)" (exprToString e')
  | Average (e1,e2) ->
      Printf.sprintf "((%s+%s)/2)" (exprToString e1) (exprToString e2)
  | Times (e1,e2) -> Printf.sprintf "%s*%s" exprToString e1 exprToString e2
  | _ -> failwith "are we writing a lisp compiler now";;
