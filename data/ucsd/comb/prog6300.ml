
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
  | Sine rest -> "sin(pi*" ^ ((exprToString rest) ^ ")")
  | Cosine rest -> "cos(pi*" ^ ((exprToString rest) ^ ")")
  | Average (expr1,expr2) ->
      "(" ^ ((exprToString expr1) ^ ("+" ^ ((exprToString expr2) ^ "/2)")))
  | Times (expr1,expr2) ->
      (exprToString expr1) ^ ("*" ^ (exprToString expr2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

let c3 () = (8, 123, 498) exprToString;;
