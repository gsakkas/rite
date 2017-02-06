
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


(* fix

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

*)

(* changed spans
(28,18)-(28,23)
(51,14)-(51,37)
(51,43)-(51,66)
(54,14)-(54,37)
(54,43)-(54,66)
(59,25)-(59,33)
*)

(* type error slice
(24,4)-(24,46)
(24,19)-(24,43)
(24,37)-(24,39)
(24,41)-(24,43)
(26,4)-(26,31)
(26,17)-(26,29)
(26,28)-(26,29)
(28,4)-(28,25)
(28,14)-(28,23)
(28,22)-(28,23)
(30,4)-(30,27)
(30,15)-(30,25)
(30,24)-(30,25)
(32,4)-(32,63)
(32,24)-(32,60)
(32,50)-(32,52)
(32,54)-(32,56)
(32,58)-(32,60)
(34,4)-(34,70)
(34,18)-(34,67)
(34,47)-(34,48)
(34,50)-(34,51)
(34,53)-(34,59)
(34,61)-(34,67)
(36,4)-(36,42)
(36,17)-(36,39)
(36,33)-(36,35)
(36,37)-(36,39)
(38,4)-(38,23)
(38,12)-(38,21)
(40,4)-(40,23)
(40,12)-(40,21)
(42,16)-(63,38)
(43,3)-(63,38)
(43,3)-(63,38)
(43,6)-(43,11)
(43,6)-(43,15)
(44,8)-(44,64)
(44,8)-(44,64)
(44,14)-(44,18)
(44,14)-(44,24)
(44,38)-(44,44)
(44,38)-(44,47)
(44,55)-(44,61)
(44,55)-(44,64)
(46,6)-(63,38)
(46,6)-(63,38)
(46,6)-(63,38)
(46,6)-(63,38)
(46,6)-(63,38)
(46,6)-(63,38)
(46,6)-(63,38)
(47,15)-(47,16)
(47,15)-(47,21)
(47,25)-(47,34)
(47,25)-(47,59)
(47,36)-(47,41)
(47,36)-(47,59)
(48,15)-(48,16)
(48,15)-(48,21)
(48,25)-(48,36)
(48,25)-(48,61)
(49,15)-(49,16)
(49,15)-(49,21)
(50,10)-(50,22)
(50,10)-(51,66)
(52,15)-(52,16)
(52,15)-(52,21)
(53,10)-(53,20)
(53,10)-(54,66)
(55,15)-(55,16)
(55,15)-(55,21)
(56,10)-(56,21)
(56,10)-(58,67)
(59,15)-(59,16)
(59,15)-(59,21)
(59,25)-(59,33)
(59,25)-(59,58)
(60,15)-(60,16)
(60,15)-(60,22)
(61,10)-(61,27)
(61,10)-(63,38)
*)
