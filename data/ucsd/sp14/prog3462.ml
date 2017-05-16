
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand (1, 7) with
  | 1 -> buildX (buildY ())
  | 2 -> buildY ()
  | 3 -> buildX ()
  | 4 -> buildY ()
  | 5 -> buildX ()
  | 6 -> buildY ()
  | 7 -> buildX ();;
