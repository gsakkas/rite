
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
(30,23)-(30,66)
build (rand , depth - 1)
AppG [TupleG [EmptyG,EmptyG]]

(31,25)-(31,68)
build (rand , depth - 1)
AppG [TupleG [EmptyG,EmptyG]]

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(11,28)-(11,44)
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
(17,18)-(17,68)
(17,39)-(17,68)
(17,61)-(17,67)
(19,4)-(19,42)
(19,17)-(19,40)
(19,26)-(19,40)
(19,37)-(19,39)
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(23,17)-(23,21)
(25,4)-(41,74)
(25,16)-(41,72)
(26,3)-(41,72)
(27,8)-(27,64)
(27,38)-(27,44)
(27,38)-(27,47)
(30,13)-(30,22)
(30,13)-(30,66)
(30,23)-(30,66)
(30,24)-(30,51)
(30,25)-(30,30)
(30,54)-(30,65)
(30,55)-(30,61)
(31,13)-(31,24)
(31,13)-(31,68)
(31,25)-(31,68)
(31,56)-(31,67)
(31,57)-(31,63)
(33,10)-(33,22)
(33,10)-(34,70)
(34,12)-(34,70)
(34,42)-(34,69)
(34,43)-(34,48)
(36,10)-(36,20)
(36,10)-(37,70)
(37,12)-(37,70)
(37,42)-(37,69)
(37,43)-(37,48)
(39,10)-(39,21)
(39,10)-(41,71)
(40,12)-(41,71)
(41,43)-(41,70)
(41,44)-(41,49)
*)
