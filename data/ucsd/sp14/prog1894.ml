
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  if depth = 1
  then (if (rand (0, 1)) = 0 then VarX else VarY)
  else
    (match rand (0, 4) with
     | 0 -> Sine (build (rand, (depth - 1)))
     | 1 -> Cosine (build (rand, (depth - 1)))
     | 2 ->
         Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         ((Times (build (rand, (depth - 1)))), (build (rand, (depth - 1))))
     | 4 ->
         ((Thresh (build (rand, (depth - 1)))), (build (rand, (depth - 1))),
           (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;
