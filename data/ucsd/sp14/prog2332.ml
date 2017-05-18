
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
  | VarX  -> Format.sprintf "x"
  | VarY  -> Format.sprintf "y"
  | Sine e' -> (Format.sprintf "sin(pi*") ^ ((exprToString e') ^ ")")
  | Cosine e' -> (Format.sprintf "cos(pi*") ^ ((exprToString e') ^ ")")
  | Average (e1,e2) ->
      (Format.sprintf "((") ^
        ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) ->
      (Format.sprintf "") ^ ((exprToString e1) ^ ("*" ^ (exprToString e2)))
  | Thresh (a,b,a_less,b_less) ->
      (Format.sprintf "(") ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^
                    ((exprToString a_less) ^
                       (":" ^ ((exprToString b_less) ^ ")")))))));;

let _ =
  exprToString Thresh
    (VarX, VarY, VarX,
      (Times ((Sine VarX), (Cosine (Average (VarX, VarY))))));;
