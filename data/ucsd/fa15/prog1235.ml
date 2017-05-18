
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tangent of expr
  | Average of expr* expr
  | Times of expr* expr
  | Divide of expr* expr
  | Thresh of expr* expr* expr* expr;;

let sampleExpr1 =
  Divide
    ((Thresh
        (VarX, VarY, VarX,
          ((Times (Sine VarX)), (Cosine (Average (VarX, VarY)))))), VarY);;
