
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
  | Sine e' -> Printf.sprintf ("sin(%s)", (exprToString e'))
  | Cosine e' -> Printf.sprintf ("cos(%s)", (exprToString e'))
  | Average (e1,e2) ->
      Printf.sprintf ("(%s+%s)/2", (exprToString e1), (exprToString 2))
  | Times (e1,e2) ->
      Printf.sprintf ("(%s*%s)", (exprToString e1), (exprToString 2))
  | Thresh (e1,e2,e3,e4) ->
      Printf.sprintf
        ("%s<%s?%s:%s)", (exprToString e1), (exprToString e2),
          (exprToString e3), (exprToString e4));;
