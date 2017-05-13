
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
  | Sine x -> Printf.sprintf "sin(pi*%s)" (exprToString x)
  | Cosine x -> Printf.sprintf "cos(pi*%s)" (exprToString x)
  | Average (x,y) ->
      Printf.sprintf "((%s+%s)/2) " (exprToString x) (exprToString y)
  | Times (x,y) -> Printf.sprintf "e*e" (exprToString x) (exprToString y)
  | Thresh (x,y,z,w) ->
      Printf.sprintf "%s<%s?%s:" (exprToString x) (exprToString y)
        (exprToString z);;
