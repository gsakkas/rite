
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildECosSin (a,b) = ECosSin (a, b);;

let buildSinLog (a,b,c) = SinLog (a, b, c);;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (8, 10) else (1, 8)) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildECosSin ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildSinLog ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 8 -> VarX
  | 9 -> VarY;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildECosSin (a,b) = ECosSin (a, b);;

let buildSinLog (a,b,c) = SinLog (a, b, c);;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (8, 10) else (1, 8)) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildECosSin ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildSinLog
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))))
  | 8 -> VarX
  | 9 -> VarY;;

*)

(* changed spans
(43,18)-(43,76)
(43,19)-(43,46)
*)

(* type error slice
(19,3)-(19,44)
(19,17)-(19,42)
(43,6)-(43,17)
(43,6)-(43,76)
(43,18)-(43,76)
*)

(* all spans
(13,18)-(13,43)
(13,27)-(13,43)
(13,36)-(13,38)
(13,40)-(13,42)
(15,16)-(15,28)
(15,20)-(15,28)
(15,27)-(15,28)
(17,18)-(17,39)
(17,25)-(17,39)
(17,34)-(17,35)
(17,37)-(17,38)
(19,17)-(19,42)
(19,26)-(19,42)
(19,34)-(19,35)
(19,37)-(19,38)
(19,40)-(19,41)
(21,14)-(21,24)
(21,18)-(21,24)
(21,23)-(21,24)
(23,17)-(23,67)
(23,38)-(23,67)
(23,46)-(23,47)
(23,49)-(23,50)
(23,52)-(23,58)
(23,60)-(23,66)
(25,16)-(25,39)
(25,25)-(25,39)
(25,32)-(25,34)
(25,36)-(25,38)
(27,15)-(45,13)
(28,2)-(45,13)
(28,10)-(28,54)
(28,10)-(28,14)
(28,15)-(28,54)
(28,19)-(28,28)
(28,19)-(28,24)
(28,27)-(28,28)
(28,34)-(28,41)
(28,35)-(28,36)
(28,38)-(28,40)
(28,47)-(28,53)
(28,48)-(28,49)
(28,51)-(28,52)
(29,2)-(45,13)
(29,8)-(29,9)
(30,9)-(30,46)
(30,9)-(30,18)
(30,19)-(30,46)
(30,20)-(30,25)
(30,26)-(30,45)
(30,27)-(30,31)
(30,33)-(30,44)
(30,34)-(30,39)
(30,42)-(30,43)
(31,9)-(31,48)
(31,9)-(31,20)
(31,21)-(31,48)
(31,22)-(31,27)
(31,28)-(31,47)
(31,29)-(31,33)
(31,35)-(31,46)
(31,36)-(31,41)
(31,44)-(31,45)
(33,6)-(33,77)
(33,6)-(33,18)
(33,19)-(33,77)
(33,20)-(33,47)
(33,21)-(33,26)
(33,27)-(33,46)
(33,28)-(33,32)
(33,34)-(33,45)
(33,35)-(33,40)
(33,43)-(33,44)
(33,49)-(33,76)
(33,50)-(33,55)
(33,56)-(33,75)
(33,57)-(33,61)
(33,63)-(33,74)
(33,64)-(33,69)
(33,72)-(33,73)
(35,6)-(35,75)
(35,6)-(35,16)
(35,17)-(35,75)
(35,18)-(35,45)
(35,19)-(35,24)
(35,25)-(35,44)
(35,26)-(35,30)
(35,32)-(35,43)
(35,33)-(35,38)
(35,41)-(35,42)
(35,47)-(35,74)
(35,48)-(35,53)
(35,54)-(35,73)
(35,55)-(35,59)
(35,61)-(35,72)
(35,62)-(35,67)
(35,70)-(35,71)
(37,6)-(39,67)
(37,6)-(37,17)
(38,8)-(39,67)
(38,9)-(38,36)
(38,10)-(38,15)
(38,16)-(38,35)
(38,17)-(38,21)
(38,23)-(38,34)
(38,24)-(38,29)
(38,32)-(38,33)
(38,38)-(38,65)
(38,39)-(38,44)
(38,45)-(38,64)
(38,46)-(38,50)
(38,52)-(38,63)
(38,53)-(38,58)
(38,61)-(38,62)
(39,10)-(39,37)
(39,11)-(39,16)
(39,17)-(39,36)
(39,18)-(39,22)
(39,24)-(39,35)
(39,25)-(39,30)
(39,33)-(39,34)
(39,39)-(39,66)
(39,40)-(39,45)
(39,46)-(39,65)
(39,47)-(39,51)
(39,53)-(39,64)
(39,54)-(39,59)
(39,62)-(39,63)
(41,6)-(41,77)
(41,6)-(41,18)
(41,19)-(41,77)
(41,20)-(41,47)
(41,21)-(41,26)
(41,27)-(41,46)
(41,28)-(41,32)
(41,34)-(41,45)
(41,35)-(41,40)
(41,43)-(41,44)
(41,49)-(41,76)
(41,50)-(41,55)
(41,56)-(41,75)
(41,57)-(41,61)
(41,63)-(41,74)
(41,64)-(41,69)
(41,72)-(41,73)
(43,6)-(43,76)
(43,6)-(43,17)
(43,18)-(43,76)
(43,19)-(43,46)
(43,20)-(43,25)
(43,26)-(43,45)
(43,27)-(43,31)
(43,33)-(43,44)
(43,34)-(43,39)
(43,42)-(43,43)
(43,48)-(43,75)
(43,49)-(43,54)
(43,55)-(43,74)
(43,56)-(43,60)
(43,62)-(43,73)
(43,63)-(43,68)
(43,71)-(43,72)
(44,9)-(44,13)
(45,9)-(45,13)
*)
