
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | TowerNeg of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 ("?" ^ ((exprToString y) ^ (":" ^ ((exprToString z) ^ ")")))))))
  | Power (x,y) -> (exprToString x) ^ ("^" ^ (exprToString y))
  | TowerNeg (x,y,z) ->
      (exprToString x) ^
        ("^" ^ ((exprToString y) ^ ("^" ^ ((exprToString z) ^ "^(-1)"))));;

let sampleExpr5 = TowerNeg (VarX, VarY, VarY);;

let _ = exprToString Power (sampleExpr5, sampleExpr5);;
