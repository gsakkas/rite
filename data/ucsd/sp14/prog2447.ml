
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  match rand (1, 7) with
  | 1 -> VarX
  | 2 -> 22
  | 3 -> 33
  | 4 -> 44
  | 5 -> 55
  | 6 -> 66
  | 7 -> 77;;
