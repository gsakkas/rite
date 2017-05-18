
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let _ =
  1 =
    (Thresh
       (VarX, VarY, VarX,
         (Times ((Sine VarX), (Cosine (Average (VarX, VarY)))))));;
