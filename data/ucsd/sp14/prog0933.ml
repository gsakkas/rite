
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr
  | FunckyCube of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e' -> "sin(pi*" ^ ((exprToString e') ^ ")")
  | Cosine e' -> "cos(pi*" ^ ((exprToString e') ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ "/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | SquareRoot e' -> "sqrt(" ^ ((exprToString e') ^ ")")
  | FunckyCube (e1,e2,e3) ->
      "sqrt(sqrt(" ^
        ((exprToString e1) ^
           (")+sqrt(" ^
              ((exprToString e2) ^ (")+sqrt(" ^ ((exprToString e3) ^ "))")))));;

let _ =
  exprToString FunckyCube
    ((SquareRoot VarY), (SquareRoot VarX), (SquareRoot VarY));;
