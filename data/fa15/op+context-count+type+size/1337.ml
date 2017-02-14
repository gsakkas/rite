
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
  then match rand (0, 1) with | 0 -> buildX | 1 -> buildY
  else
    (match rand (2, 7) with
     | 2 -> buildSine build (rand, (depth - 1))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
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
  then match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ()
  else
    (match rand (0, 7) with
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
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(27,37)-(27,43)
(27,51)-(27,57)
(29,4)-(41,71)
(29,11)-(29,22)
(29,17)-(29,18)
(30,12)-(30,21)
(30,12)-(30,47)
(30,22)-(30,27)
(41,28)-(41,33)
(41,36)-(41,37)
(41,43)-(41,48)
(41,49)-(41,68)
(41,50)-(41,54)
(41,56)-(41,67)
(41,57)-(41,62)
(41,65)-(41,66)
*)

(* type error slice
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(21,3)-(21,22)
(21,11)-(21,20)
(25,3)-(41,73)
(25,15)-(41,71)
(26,2)-(41,71)
(26,2)-(41,71)
(27,7)-(27,57)
(27,37)-(27,43)
(29,4)-(41,71)
(30,12)-(30,21)
(30,12)-(30,47)
(30,22)-(30,27)
(31,12)-(31,23)
(31,12)-(31,51)
(31,24)-(31,51)
(31,25)-(31,30)
(34,12)-(34,39)
(34,13)-(34,18)
(34,41)-(34,68)
(34,42)-(34,47)
(37,12)-(37,39)
(37,13)-(37,18)
(37,41)-(37,68)
(37,42)-(37,47)
(40,12)-(40,39)
(40,13)-(40,18)
(40,41)-(40,68)
(40,42)-(40,47)
(41,13)-(41,40)
(41,14)-(41,19)
(41,42)-(41,69)
(41,43)-(41,48)
*)
