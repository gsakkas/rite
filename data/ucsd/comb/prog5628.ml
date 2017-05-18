
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (eval e)
  | Cosine e -> cos (eval e)
  | Average (e,f) -> ((eval e) + (eval f)) / 2
  | Times (e,f) -> (eval e) * (eval f)
  | Thresh (e,f,g,h) ->
      (match (eval e) < (eval f) with | true  -> eval g | false  -> eval h);;
