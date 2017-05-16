
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
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ (("+" exprToString b) ^ ")/20"))
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | VarY  -> "x"
  | VarX  -> "y";;
