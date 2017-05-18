
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> (buildX ()) || (buildY ())
  | _ ->
      (buildSine (build (rand, (depth - 1)))) ||
        ((buildCosine (build (rand, (depth - 1)))) ||
           (buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))));;
