
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
  | VarX  -> "" :: e
  | VarY  -> e
  | Sine e1 -> Printf.sprintf "%s" (exprToString e1)
  | Cosine e2 -> Printf.sprintf "%s" (exprToString e2)
  | Average (e3,e4) ->
      Printf.sprintf "%s %s" (exprToString e3) (exprToString e4)
  | Times (e5,e6) ->
      Printf.sprintf "%s %s" (exprToString e5) (exprToString e6)
  | Thresh (e7,e8,e9,e0) ->
      Printf.sprintf "%s %s %s %s" (exprToString e7) (exprToString e8)
        (exprToString e9) (exprToString e0)
  | _ -> "";;
