
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0 then (if (rand mod 2) = 0 then buildX ());;
