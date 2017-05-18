
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

let rec build (rand,depth) =
  if depth > 0
  then
    match rand with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
    | 2 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | _ -> false;;
