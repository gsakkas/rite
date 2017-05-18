
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)));;
