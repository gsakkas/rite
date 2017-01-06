
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

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ModF of expr
  | SumOfSquares of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildLog e = Log e;;

let buildSine e = Sine e;;

let buildSumOfSquares (e1,e2,e3) = SumOfSquares (e1, e2, e3);;

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
     | i when i < 40 -> buildCosine (build (rand, (depth - 1)))
     | i when i < 50 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | i when i < 60 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | i when i < 70 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | i when i < 85 -> buildLog (build (rand, (depth - 1)))
     | i when i < 100 ->
         buildSumOfSquares
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1)))));;



type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ModF of expr
  | SumOfSquares of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildModF e = ModF e;;

let buildSine e = Sine e;;

let buildSumOfSquares (e1,e2,e3) = SumOfSquares (e1, e2, e3);;

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
     | i when i < 40 -> buildCosine (build (rand, (depth - 1)))
     | i when i < 50 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | i when i < 60 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | i when i < 70 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | i when i < 85 -> buildModF (build (rand, (depth - 1)))
     | i when i < 100 ->
         buildSumOfSquares
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1)))));;


(* changed spans
(10,5)-(21,4)
(28,5)-(28,13)
(28,18)-(28,21)
(59,25)-(59,33)
*)

(* type error slice
*)
