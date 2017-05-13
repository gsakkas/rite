
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Negate of expr;;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Log of expr
  | SumOfSquares of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildNegate e = Negate e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then match rand (0, 2) with | 0 -> buildX () | 1 -> buildY ()
  else
    (match rand (0, 100) with
     | i when i < 20 -> buildSine (build (rand, (depth - 1)))
     | i when i < 45 -> buildCosine (build (rand, (depth - 1)))
     | i when i < 65 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | i when i < 75 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | i when i < 80 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | i when i < 100 -> buildNegate (build (rand, (depth - 1))));;
