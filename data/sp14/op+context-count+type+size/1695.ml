
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
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
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
(17,61)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(19,26)-(19,39)
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
(27,8)-(27,64)
(27,38)-(27,44)
(27,38)-(27,47)
(30,13)-(30,22)
(30,13)-(30,64)
(30,25)-(30,30)
(30,25)-(30,48)
(30,25)-(30,64)
(30,25)-(30,64)
(30,25)-(30,64)
(30,55)-(30,61)
(30,55)-(30,64)
(31,13)-(31,24)
(31,13)-(31,66)
(31,27)-(31,66)
(31,27)-(31,66)
(31,57)-(31,63)
(31,57)-(31,66)
(33,10)-(33,22)
(33,10)-(34,66)
(34,14)-(34,66)
(34,43)-(34,48)
(34,43)-(34,66)
(36,10)-(36,20)
(36,10)-(37,66)
(37,14)-(37,66)
(37,43)-(37,48)
(37,43)-(37,66)
(39,10)-(39,21)
(39,10)-(41,67)
(40,14)-(41,67)
(41,44)-(41,49)
(41,44)-(41,67)
*)
