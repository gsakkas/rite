
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
  match rand depth with | (1,d) -> (d = (d - 1)) && (buildX ());;
