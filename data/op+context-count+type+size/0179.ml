
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr;;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareCosine of expr
  | SquareSinCos of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildSquareRoot e = SquareRoot e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let num = rand (0, 1) in match num with | 0 -> buildX () | 1 -> buildY ()
  else
    (let num = rand (0, 7) in
     match num with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((buildX ()), (buildY ()), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | 7 -> buildSquareRoot (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareCosine of expr
  | SquareSinCos of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildSquareCosine e = SquareCosine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let num = rand (0, 1) in match num with | 0 -> buildX () | 1 -> buildY ()
  else
    (let num = rand (0, 7) in
     match num with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((buildX ()), (buildY ()), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | 7 -> buildSquareCosine (build (rand, (depth - 1))));;

*)

(* changed spans
(29,25)-(29,37)
(52,14)-(52,37)
(52,43)-(52,66)
(55,14)-(55,37)
(55,43)-(55,66)
(60,13)-(60,28)
*)

(* type error slice
(23,4)-(23,46)
(23,19)-(23,43)
(23,37)-(23,39)
(23,41)-(23,43)
(25,4)-(25,31)
(25,17)-(25,29)
(25,28)-(25,29)
(27,4)-(27,27)
(27,15)-(27,25)
(27,24)-(27,25)
(29,4)-(29,39)
(29,21)-(29,37)
(29,36)-(29,37)
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
(39,16)-(60,53)
(40,6)-(40,11)
(40,6)-(40,15)
(42,5)-(42,78)
(42,5)-(42,78)
(42,15)-(42,19)
(42,15)-(42,25)
(42,30)-(42,78)
(42,30)-(42,78)
(42,36)-(42,39)
(42,52)-(42,58)
(42,52)-(42,61)
(42,69)-(42,75)
(42,69)-(42,78)
(46,13)-(46,19)
(46,13)-(46,22)
(47,13)-(47,19)
(47,13)-(47,22)
(48,13)-(48,22)
(48,13)-(48,47)
(48,24)-(48,29)
(48,24)-(48,47)
(49,13)-(49,24)
(49,13)-(49,49)
(51,10)-(51,22)
(51,10)-(52,66)
(54,10)-(54,20)
(54,10)-(55,66)
(57,10)-(57,21)
(57,10)-(59,38)
(58,14)-(58,20)
(58,14)-(58,23)
(58,14)-(59,38)
(58,27)-(58,33)
(58,27)-(58,36)
(60,13)-(60,28)
(60,13)-(60,53)
*)
