
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sine_Avg of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildSine_Avg (e1,e2,e3) = Sine_Avg (e1, e2, e3);;

let buildTan e = Tan e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth <= 0
  then match rand (1, 3) with | 1 -> buildX () | 2 -> buildY ()
  else
    (match rand (1, 18) with
     | 1 -> build (rand, (depth - 1))
     | 2 -> buildCosine (build (rand, (depth - 1)))
     | 3 -> buildSine (build (rand, (depth - 1)))
     | 4 -> buildSine (build (rand, (depth - 1)))
     | 5 -> buildSine (build (rand, (depth - 1)))
     | 6 -> buildSine (build (rand, (depth - 1)))
     | 7 -> buildCosine (build (rand, (depth - 1)))
     | 8 -> buildCosine (build (rand, (depth - 1)))
     | 9 -> buildCosine (build (rand, (depth - 1)))
     | 10 -> buildCosine (build (rand, (depth - 1)))
     | 11 -> buildCosine (build (rand, (depth - 1)))
     | 12 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 13 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 14 ->
         buildThresh
           ((buildCosine (build (rand, (depth - 2)))),
             (buildSine (build (rand, (depth - 2)))),
             (buildSine (build (rand, (depth - 2)))),
             (buildCosine (build (rand, (depth - 2)))))
     | 15 ->
         buildThresh
           ((buildCosine (build (rand, (depth - 2)))),
             (buildSine (build (rand, (depth - 2)))),
             (buildSine (build (rand, (depth - 2)))),
             (buildCosine (build (rand, (depth - 2)))))
     | 16 -> buildTan (build (rand, (depth - 1)))
     | 17 ->
         buildSine_Avg
           ((build (rand, (depth - 1))), (build (rand, (depth - 1)))));;
