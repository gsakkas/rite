
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
  then match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ()
  else
    (match rand (1, 5) with
     | 1 -> buildSine ((build (rand, (depth - 1))) * (buildY ()))
     | 2 -> buildCosine ((build (rand, (depth - 1))) * (buildX ()))
     | 3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
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
  then match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ()
  else
    (match rand (1, 5) with
     | 1 -> buildSine (build (rand, (depth - 1)))
     | 2 -> buildCosine (build (rand, (depth - 1)))
     | 3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(30,25)-(30,64)
(30,55)-(30,61)
(30,62)-(30,64)
(31,13)-(31,66)
(31,27)-(31,66)
(31,57)-(31,63)
(31,64)-(31,66)
(33,10)-(34,66)
(34,14)-(34,37)
(34,43)-(34,66)
(37,14)-(37,37)
(37,43)-(37,66)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(17,47)-(17,48)
(17,50)-(17,51)
(17,53)-(17,59)
(17,61)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(19,26)-(19,39)
(19,33)-(19,35)
(19,37)-(19,39)
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(23,17)-(23,21)
(25,4)-(41,74)
(25,16)-(41,67)
(26,3)-(41,67)
(26,6)-(26,11)
(26,6)-(26,15)
(26,14)-(26,15)
(27,8)-(27,64)
(27,14)-(27,18)
(27,14)-(27,24)
(27,20)-(27,21)
(27,20)-(27,24)
(27,23)-(27,24)
(27,38)-(27,44)
(27,38)-(27,47)
(27,45)-(27,47)
(30,13)-(30,22)
(30,13)-(30,64)
(30,25)-(30,30)
(30,25)-(30,48)
(30,25)-(30,64)
(30,32)-(30,36)
(30,32)-(30,48)
(30,39)-(30,48)
(30,55)-(30,61)
(30,55)-(30,64)
(30,62)-(30,64)
(31,13)-(31,24)
(31,13)-(31,66)
(31,27)-(31,66)
(31,57)-(31,63)
(31,57)-(31,66)
(31,64)-(31,66)
(33,10)-(33,22)
(33,10)-(34,66)
(34,14)-(34,19)
(34,14)-(34,37)
(34,14)-(34,66)
(34,21)-(34,25)
(34,21)-(34,37)
(34,28)-(34,37)
(34,43)-(34,48)
(34,43)-(34,66)
(34,50)-(34,54)
(34,50)-(34,66)
(34,57)-(34,66)
(36,10)-(36,20)
(36,10)-(37,66)
(37,14)-(37,19)
(37,14)-(37,37)
(37,14)-(37,66)
(37,21)-(37,25)
(37,21)-(37,37)
(37,28)-(37,37)
(37,43)-(37,48)
(37,43)-(37,66)
(37,50)-(37,54)
(37,50)-(37,66)
(37,57)-(37,66)
(39,10)-(39,21)
(39,10)-(41,67)
(40,14)-(40,19)
(40,14)-(40,37)
(40,14)-(41,67)
(40,21)-(40,25)
(40,21)-(40,37)
(40,28)-(40,37)
(40,43)-(40,48)
(40,43)-(40,66)
(40,50)-(40,54)
(40,50)-(40,66)
(40,57)-(40,66)
(41,15)-(41,20)
(41,15)-(41,38)
(41,22)-(41,26)
(41,22)-(41,38)
(41,29)-(41,38)
(41,44)-(41,49)
(41,44)-(41,67)
(41,51)-(41,55)
(41,51)-(41,67)
(41,58)-(41,67)
*)
