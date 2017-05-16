
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sigmoid of expr
  | Tanh of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> Printf.printf "sin(pi*%s)" (exprToString x)
  | Cosine x -> Printf.printf "cos(pi*%s)" (exprToString x)
  | Average (x,y) ->
      Printf.printf "((%s+%s)/2)" (exprToString x) (exprToString y)
  | Times (x,y) -> Printf.printf "%s*%s" (exprToString x) (exprToString y)
  | Sigmoid x -> Printf.printf "sigmoid(%s)" (exprToString x)
  | Tanh (x,y,z) ->
      Printf.printf "tanh((%s+%s)/(1.01+%s))" (exprToString x)
        (exprToString y) (exprToString z)
  | Thresh (x,y,z,w) ->
      Printf.printf "(%s<%s?%s:%s)" (exprToString x) (exprToString y)
        (exprToString z) (exprToString w);;
