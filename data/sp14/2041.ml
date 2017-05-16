
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
(29,14)-(29,26)
(29,27)-(29,54)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(25,12)-(25,21)
(25,12)-(25,49)
(25,22)-(25,49)
(25,23)-(25,28)
(29,13)-(29,55)
(29,14)-(29,26)
(29,27)-(29,54)
(29,28)-(29,33)
*)

(* all spans
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(11,40)-(11,42)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,16)-(17,39)
(17,25)-(17,39)
(17,32)-(17,34)
(17,36)-(17,38)
(19,15)-(33,52)
(20,2)-(33,52)
(20,5)-(20,14)
(20,5)-(20,10)
(20,13)-(20,14)
(21,7)-(21,70)
(21,17)-(21,28)
(21,17)-(21,21)
(21,22)-(21,28)
(21,23)-(21,24)
(21,26)-(21,27)
(21,32)-(21,70)
(21,38)-(21,41)
(21,54)-(21,58)
(21,66)-(21,70)
(23,4)-(33,52)
(23,15)-(23,26)
(23,15)-(23,19)
(23,20)-(23,26)
(23,21)-(23,22)
(23,24)-(23,25)
(24,5)-(33,51)
(24,11)-(24,14)
(25,12)-(25,49)
(25,12)-(25,21)
(25,22)-(25,49)
(25,23)-(25,28)
(25,29)-(25,48)
(25,30)-(25,34)
(25,36)-(25,47)
(25,37)-(25,42)
(25,45)-(25,46)
(27,9)-(29,56)
(27,9)-(27,21)
(28,11)-(29,56)
(28,12)-(28,39)
(28,13)-(28,18)
(28,19)-(28,38)
(28,20)-(28,24)
(28,26)-(28,37)
(28,27)-(28,32)
(28,35)-(28,36)
(29,13)-(29,55)
(29,14)-(29,26)
(29,27)-(29,54)
(29,28)-(29,33)
(29,34)-(29,53)
(29,35)-(29,39)
(29,41)-(29,52)
(29,42)-(29,47)
(29,50)-(29,51)
(31,9)-(32,69)
(31,9)-(31,19)
(32,11)-(32,69)
(32,12)-(32,39)
(32,13)-(32,18)
(32,19)-(32,38)
(32,20)-(32,24)
(32,26)-(32,37)
(32,27)-(32,32)
(32,35)-(32,36)
(32,41)-(32,68)
(32,42)-(32,47)
(32,48)-(32,67)
(32,49)-(32,53)
(32,55)-(32,66)
(32,56)-(32,61)
(32,64)-(32,65)
(33,12)-(33,51)
(33,12)-(33,23)
(33,24)-(33,51)
(33,25)-(33,30)
(33,31)-(33,50)
(33,32)-(33,36)
(33,38)-(33,49)
(33,39)-(33,44)
(33,47)-(33,48)
*)
