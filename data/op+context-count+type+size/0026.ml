
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

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  if depth = 0
  then let num = rand (0, 2) in match num with | 0 -> VarX | _ -> VarY
  else
    (let num = rand (0, 5) in
     match num with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 ->
         buildAverage
           ((build (rand, (depth - 1))),
             (buildAverage (build (rand, (depth - 1)))))
     | 2 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ -> buildCosine (build (rand, (depth - 1))));;


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

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  if depth = 0
  then let num = rand (0, 2) in match num with | 0 -> VarX | _ -> VarY
  else
    (let num = rand (0, 5) in
     match num with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 2 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ -> buildCosine (build (rand, (depth - 1))));;

*)

(* changed spans
(29,15)-(29,27)
(29,29)-(29,52)
(32,14)-(32,37)
(32,43)-(32,66)
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
(17,4)-(17,42)
(17,17)-(17,39)
(17,26)-(17,39)
(17,33)-(17,35)
(17,37)-(17,39)
(19,16)-(33,49)
(20,6)-(20,11)
(20,6)-(20,15)
(20,6)-(20,15)
(20,6)-(20,15)
(20,14)-(20,15)
(21,8)-(21,71)
(21,8)-(21,71)
(21,18)-(21,22)
(21,18)-(21,28)
(21,18)-(21,28)
(21,24)-(21,25)
(21,24)-(21,28)
(21,27)-(21,28)
(21,33)-(21,71)
(21,33)-(21,71)
(21,33)-(21,71)
(21,33)-(21,71)
(21,39)-(21,42)
(21,55)-(21,59)
(21,67)-(21,71)
(23,6)-(33,49)
(23,16)-(23,20)
(23,16)-(23,26)
(23,22)-(23,23)
(23,22)-(23,26)
(23,25)-(23,26)
(24,6)-(33,49)
(24,6)-(33,49)
(24,6)-(33,49)
(24,12)-(24,15)
(25,13)-(25,22)
(25,13)-(25,47)
(25,13)-(25,47)
(25,24)-(25,29)
(25,24)-(25,47)
(25,24)-(25,47)
(25,31)-(25,35)
(25,31)-(25,47)
(25,38)-(25,43)
(25,38)-(25,47)
(25,46)-(25,47)
(27,10)-(27,22)
(27,10)-(29,52)
(28,14)-(28,19)
(28,14)-(28,37)
(28,14)-(29,52)
(28,21)-(28,25)
(28,21)-(28,37)
(28,28)-(28,33)
(28,28)-(28,37)
(28,36)-(28,37)
(29,15)-(29,27)
(29,15)-(29,52)
(29,15)-(29,52)
(29,29)-(29,34)
(29,29)-(29,52)
(29,36)-(29,40)
(29,36)-(29,52)
(29,43)-(29,48)
(29,43)-(29,52)
(29,51)-(29,52)
(31,10)-(31,20)
(31,10)-(32,66)
(33,13)-(33,24)
(33,13)-(33,49)
*)
