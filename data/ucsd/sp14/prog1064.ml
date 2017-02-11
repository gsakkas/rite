
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let expr = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((expr a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((expr a) ^ ")")
  | (Average a,b) -> "((" ^ ((expr a) ^ ("+" ^ ((expr b) ^ ")/2)")))
  | (Times a,b) -> (expr a) ^ ("*" ^ (expr b))
  | (Thresh a,b,c,d) ->
      "(" ^
        ((expr a) ^
           ("<" ^ ((expr b) ^ ("?" ^ ((expr c) ^ (":" ^ ((expr d) ^ ")")))))));;
