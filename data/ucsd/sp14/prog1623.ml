
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 1)) = 0 then VarX else VarY)
  else (let y = rand (2, 6) in if y = 2 then y);;
