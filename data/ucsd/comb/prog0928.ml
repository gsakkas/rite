
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

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 6) with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build rand (depth - 1))
    | 3 -> buildCosine (build rand (depth - 1))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;
