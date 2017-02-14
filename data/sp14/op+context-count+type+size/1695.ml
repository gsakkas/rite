
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
(30,22)-(30,65)
(30,54)-(30,60)
(30,61)-(30,63)
(31,12)-(31,67)
(31,24)-(31,67)
(31,56)-(31,62)
(31,63)-(31,65)
(33,9)-(34,69)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(11,40)-(11,42)
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(17,60)-(17,66)
(19,3)-(19,41)
(19,16)-(19,39)
(19,25)-(19,39)
(19,36)-(19,38)
(21,3)-(21,22)
(21,11)-(21,20)
(21,16)-(21,20)
(23,3)-(23,22)
(23,11)-(23,20)
(23,16)-(23,20)
(25,3)-(41,73)
(25,15)-(41,71)
(26,2)-(41,71)
(27,7)-(27,63)
(27,37)-(27,43)
(27,37)-(27,46)
(30,12)-(30,21)
(30,12)-(30,65)
(30,22)-(30,65)
(30,22)-(30,65)
(30,22)-(30,65)
(30,23)-(30,50)
(30,24)-(30,29)
(30,53)-(30,64)
(30,54)-(30,60)
(31,12)-(31,23)
(31,12)-(31,67)
(31,24)-(31,67)
(31,24)-(31,67)
(31,55)-(31,66)
(31,56)-(31,62)
(33,9)-(33,21)
(33,9)-(34,69)
(34,11)-(34,69)
(34,41)-(34,68)
(34,42)-(34,47)
(36,9)-(36,19)
(36,9)-(37,69)
(37,11)-(37,69)
(37,41)-(37,68)
(37,42)-(37,47)
(39,9)-(39,20)
(39,9)-(41,70)
(40,11)-(41,70)
(41,42)-(41,69)
(41,43)-(41,48)
*)
