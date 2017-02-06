
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

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 2)) < 1 then buildX else buildY)
  else
    (let x = rand (0, 5) in
     match x with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


(* fix

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

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 2)) < 1 then buildX () else buildY ())
  else
    (let x = rand (0, 5) in
     match x with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(27,35)-(27,41)
(27,47)-(27,53)
(29,6)-(42,67)
(35,14)-(35,37)
(35,43)-(35,66)
(38,14)-(38,37)
(38,43)-(38,66)
(42,58)-(42,63)
(42,66)-(42,67)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,28)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,47)-(17,48)
(17,50)-(17,51)
(17,53)-(17,59)
(17,61)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(19,33)-(19,35)
(19,37)-(19,39)
(21,4)-(21,23)
(21,12)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(25,16)-(42,67)
(26,3)-(42,67)
(26,3)-(42,67)
(26,6)-(26,11)
(26,6)-(26,15)
(27,9)-(27,53)
(27,9)-(27,53)
(27,13)-(27,17)
(27,13)-(27,23)
(27,13)-(27,29)
(27,35)-(27,41)
(27,47)-(27,53)
(29,6)-(42,67)
(30,6)-(42,67)
(30,6)-(42,67)
(30,6)-(42,67)
(30,6)-(42,67)
(30,6)-(42,67)
(31,13)-(31,22)
(31,13)-(31,47)
(31,24)-(31,29)
(31,24)-(31,47)
(32,13)-(32,24)
(32,13)-(32,49)
(34,10)-(34,22)
(34,10)-(35,66)
(37,10)-(37,20)
(37,10)-(38,66)
(40,10)-(40,21)
(40,10)-(42,67)
*)
