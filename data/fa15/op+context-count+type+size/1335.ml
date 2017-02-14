
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
  then match rand (0, 1) with | 0 -> buildX () | 1 -> buildY
  else
    (match rand (0, 7) with
     | 0 -> buildX
     | 1 -> buildY
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
(27,54)-(27,60)
(29,4)-(43,71)
(30,12)-(30,18)
(31,12)-(31,18)
(32,12)-(32,49)
(43,50)-(43,54)
(43,56)-(43,67)
(43,57)-(43,62)
(43,65)-(43,66)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(19,3)-(19,41)
(19,16)-(19,39)
(19,25)-(19,39)
(21,3)-(21,22)
(21,11)-(21,20)
(21,16)-(21,20)
(23,3)-(23,22)
(23,11)-(23,20)
(26,2)-(43,71)
(26,2)-(43,71)
(27,7)-(27,60)
(27,7)-(27,60)
(27,37)-(27,43)
(27,37)-(27,46)
(27,54)-(27,60)
(29,4)-(43,71)
(29,4)-(43,71)
(29,4)-(43,71)
(29,4)-(43,71)
(29,4)-(43,71)
(29,4)-(43,71)
(30,12)-(30,18)
(32,12)-(32,21)
(32,12)-(32,49)
(33,12)-(33,23)
(33,12)-(33,51)
(35,9)-(35,21)
(35,9)-(36,69)
(38,9)-(38,19)
(38,9)-(39,69)
(41,9)-(41,20)
(41,9)-(43,70)
*)
