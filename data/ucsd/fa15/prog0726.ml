
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec eval (e,x,y) = buildTimes x y;;
