
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SqDist of expr* expr;;

let rec exprToString e =
  let ex = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((ex x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((ex x) ^ ")")
  | Average (x,y) -> "((" ^ ((ex x) ^ ("+" ^ ((ex y) ^ ")/2)")))
  | Times (x,y) -> (ex x) ^ ("*" ^ (ex y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((ex w) ^
           ("<" ^ ((ex x) ^ ("?" ^ ((ex y) ^ (":" ^ ((ex z) ^ ")")))))))
  | SqDist (x,y) ->
      "(" ^ ((ex x) ^ (")" ^ ("^2+" ^ ("(" ^ ((ex y ")") ^ "^2")))));;
