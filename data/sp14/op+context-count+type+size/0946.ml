
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
  let case = 0 in
  if depth = 0
  then case = (rand (0, 1))
  else
    (let case = rand (0, 6) in
     match case with
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
  let case = rand (0, 6) in
  match case with
  | 0 -> buildX ()
  | 1 -> buildY ()
  | 2 -> buildSine (build (rand, (depth - 1)))
  | 3 -> buildCosine (build (rand, (depth - 1)))
  | 4 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(26,13)-(26,14)
(27,2)-(45,71)
(27,5)-(27,10)
(27,5)-(27,14)
(27,13)-(27,14)
(28,7)-(28,11)
(28,7)-(28,27)
(28,24)-(28,25)
(30,4)-(45,71)
(30,16)-(30,20)
(30,16)-(30,27)
(30,21)-(30,27)
(30,22)-(30,23)
(32,12)-(32,18)
(33,12)-(33,18)
(34,12)-(34,49)
(45,43)-(45,48)
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
(15,18)-(15,24)
(15,23)-(15,24)
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(19,3)-(19,41)
(19,16)-(19,39)
(19,25)-(19,39)
(21,3)-(21,22)
(21,11)-(21,20)
(25,3)-(45,73)
(25,15)-(45,71)
(26,2)-(45,71)
(27,2)-(45,71)
(27,2)-(45,71)
(28,7)-(28,27)
(30,4)-(45,71)
(31,5)-(45,70)
(31,5)-(45,70)
(31,5)-(45,70)
(31,5)-(45,70)
(31,5)-(45,70)
(31,5)-(45,70)
(32,12)-(32,18)
(34,12)-(34,21)
(34,12)-(34,49)
(34,22)-(34,49)
(34,23)-(34,28)
(35,12)-(35,23)
(35,12)-(35,51)
(37,9)-(37,21)
(37,9)-(38,69)
(40,9)-(40,19)
(40,9)-(41,69)
(43,9)-(43,20)
(43,9)-(45,70)
*)
