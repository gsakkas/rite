
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
(27,38)-(27,44)
(27,52)-(27,58)
(29,6)-(43,67)
(30,13)-(30,19)
(31,13)-(31,19)
(32,13)-(32,47)
(43,44)-(43,49)
(43,51)-(43,55)
(43,51)-(43,67)
(43,58)-(43,63)
(43,58)-(43,67)
(43,66)-(43,67)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(19,26)-(19,39)
(21,4)-(21,23)
(21,12)-(21,21)
(25,4)-(43,74)
(25,16)-(43,67)
(26,3)-(43,67)
(27,8)-(27,58)
(27,38)-(27,44)
(29,6)-(43,67)
(29,6)-(43,67)
(29,6)-(43,67)
(29,6)-(43,67)
(29,6)-(43,67)
(29,6)-(43,67)
(30,13)-(30,19)
(32,13)-(32,22)
(32,13)-(32,47)
(32,24)-(32,29)
(32,24)-(32,47)
(33,13)-(33,24)
(33,13)-(33,49)
(35,10)-(35,22)
(35,10)-(36,66)
(38,10)-(38,20)
(38,10)-(39,66)
(41,10)-(41,21)
(41,10)-(43,67)
*)
