
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let rec build (rand,depth) =
  match (((rand 2), 6), depth) with
  | (c,0) -> if c > 3 then BuildX () else BuildY ()
  | (2,_) -> buildSine (build (rand, (depth - 1)));;
