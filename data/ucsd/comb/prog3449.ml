
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let rec eval (e,x,y) = match e with | VarX  -> x | VarY  -> y;;

let _ = buildAverage ((eval (VarX, 2.0, 4.0)), (eval (VarY, 2.0, 4.0)));;
