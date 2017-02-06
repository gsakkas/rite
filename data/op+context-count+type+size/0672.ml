
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


(* fix

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
     | i when i < 15 -> buildSine (build (rand, (depth - 1)))
     | i when i < 30 -> buildCosine (build (rand, (depth - 1)))
     | i when i < 40 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | i when i < 50 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | i when i < 60 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | i when i < 80 -> buildLog (build (rand, (depth - 1)))
     | i when i < 100 ->
         buildSumOfSquares
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1)))));;

*)

(* changed spans
(27,21)-(27,29)
(31,18)-(31,67)
(43,6)-(56,62)
(48,14)-(48,37)
(48,43)-(48,66)
(51,14)-(51,37)
(51,43)-(51,66)
(56,26)-(56,37)
(56,46)-(56,50)
(56,53)-(56,58)
(56,53)-(56,62)
(56,61)-(56,62)
*)

(* type error slice
(23,4)-(23,46)
(23,19)-(23,43)
(23,37)-(23,39)
(23,41)-(23,43)
(25,4)-(25,31)
(25,17)-(25,29)
(25,28)-(25,29)
(27,4)-(27,31)
(27,17)-(27,29)
(27,28)-(27,29)
(29,4)-(29,27)
(29,15)-(29,25)
(29,24)-(29,25)
(31,4)-(31,70)
(31,18)-(31,67)
(31,47)-(31,48)
(31,50)-(31,51)
(31,53)-(31,59)
(31,61)-(31,67)
(33,4)-(33,42)
(33,17)-(33,39)
(33,33)-(33,35)
(33,37)-(33,39)
(35,4)-(35,23)
(35,12)-(35,21)
(37,4)-(37,23)
(37,12)-(37,21)
(39,16)-(56,62)
(40,3)-(56,62)
(40,3)-(56,62)
(40,6)-(40,11)
(40,6)-(40,15)
(41,8)-(41,64)
(41,8)-(41,64)
(41,14)-(41,18)
(41,14)-(41,24)
(41,38)-(41,44)
(41,38)-(41,47)
(41,55)-(41,61)
(41,55)-(41,64)
(43,6)-(56,62)
(43,6)-(56,62)
(43,6)-(56,62)
(43,6)-(56,62)
(43,6)-(56,62)
(43,6)-(56,62)
(44,15)-(44,16)
(44,15)-(44,21)
(44,25)-(44,34)
(44,25)-(44,59)
(44,36)-(44,41)
(44,36)-(44,59)
(45,15)-(45,16)
(45,15)-(45,21)
(45,25)-(45,36)
(45,25)-(45,61)
(46,15)-(46,16)
(46,15)-(46,21)
(47,10)-(47,22)
(47,10)-(48,66)
(49,15)-(49,16)
(49,15)-(49,21)
(50,10)-(50,20)
(50,10)-(51,66)
(52,15)-(52,16)
(52,15)-(52,21)
(53,10)-(53,21)
(53,10)-(55,67)
(56,15)-(56,16)
(56,15)-(56,22)
(56,26)-(56,37)
(56,26)-(56,62)
*)
