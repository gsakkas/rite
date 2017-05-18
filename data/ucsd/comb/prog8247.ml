
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
  match ((rand (243, 98723)), depth) with
  | (x,0) when (x mod 2) = 0 -> buildY ()
  | (x,0) when (x mod 2) = 1 -> buildX ()
  | (x,n) when (n mod 5) = 0 -> buildSine (build (x, (n - 1)))
  | (x,n) when (n mod 5) = 4 -> buildCosine (build (x, (n - 1)));;
