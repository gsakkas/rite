
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Percent of expr
  | Negate of expr
  | SumSquared of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildNegate e = Negate e;;

let buildPercent e = Percent e;;

let buildSine e = Sine e;;

let buildSumSquared (e1,e2,e3) = SumSquared (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let num = rand (1, 10) in (if num > 4 then buildX () else buildY ())
  else
    (let num = rand (1, 10) in
     match num with
     | 1|2 -> buildSine (build (rand, (depth - 1)))
     | 3|4 -> buildCosine (build (rand, (depth - 1)))
     | 5|6 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 7|8 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 9 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ ->
         if (num mod 2) = 0
         then buildPercent (rand, (depth - 1))
         else
           if (num mod 3) = 0
           then buildNegate (rand, (depth - 1))
           else
             buildSumSquared
               ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                 (build (rand, (depth - 1)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Percent of expr
  | Negate of expr
  | SumSquared of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildNegate e = Negate e;;

let buildPercent e = Percent e;;

let buildSine e = Sine e;;

let buildSumSquared (e1,e2,e3) = SumSquared (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let num = rand (1, 10) in (if num > 4 then buildX () else buildY ())
  else
    (let num = rand (1, 10) in
     match num with
     | 1|2 -> buildSine (build (rand, (depth - 1)))
     | 3|4 -> buildCosine (build (rand, (depth - 1)))
     | 5|6 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 7|8 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 9 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ ->
         if (num mod 2) = 0
         then buildPercent (build (rand, (depth - 1)))
         else
           if (num mod 3) = 0
           then buildNegate (build (rand, (depth - 1)))
           else
             buildSumSquared
               ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                 (build (rand, (depth - 1)))));;

*)

(* changed spans
(54,28)-(54,47)
build (rand , depth - 1)
AppG [TupleG [EmptyG,EmptyG]]

(57,29)-(57,48)
build (rand , depth - 1)
AppG [TupleG [EmptyG,EmptyG]]

*)

(* type error slice
(18,4)-(18,31)
(18,17)-(18,29)
(18,21)-(18,29)
(18,28)-(18,29)
(20,4)-(20,33)
(20,18)-(20,31)
(20,22)-(20,31)
(20,30)-(20,31)
(54,15)-(54,27)
(54,15)-(54,47)
(54,28)-(54,47)
(57,17)-(57,28)
(57,17)-(57,48)
(57,29)-(57,48)
*)
