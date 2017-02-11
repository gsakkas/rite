
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e' -> Printf.sprintf "sin(pi*%s)" (exprToString e')
  | Cosine e' -> Printf.sprintf "cos(pi*%s)" (exprToString e')
  | Average (e1,e2) ->
      Printf.sprintf "((%s+%s)/2)" (exprToString e1) (exprToString e2)
  | Times (e1,e2) ->
      Printf.sprintf "%s*%s" (exprToString e1) (exprToString e2)
  | Thresh (e1,e2,e3,e4) ->
      Printf.sprintf "(%s<%s?%s:%s)" (exprToString e1) (exprToString e2)
        (exprToString e3) (exprToString e4)
  | Sqrt e -> Printf.sprintf "(|%s|)^0.5" (exprToString Abs e)
  | Abs e -> Printf.sprintf "|%s|" (exprToString e)
  | _ -> failwith "are we writing a lisp compiler now";;
