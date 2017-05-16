
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

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (6, 7) else (1, 5)) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 -> buildTimes (build (rand, (depth - 1))) (build (rand, (depth - 1)))
  | 5 ->
      buildThresh (build (rand, (depth - 1))) (build (rand, (depth - 1)))
        (build (rand, (depth - 1))) (build (rand, (depth - 1)))
  | 6 -> VarX
  | 7 -> VarY;;


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

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (6, 7) else (1, 5)) in
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
  | 6 -> VarX
  | 7 -> VarY;;

*)

(* changed spans
(28,9)-(28,75)
(28,20)-(28,47)
(30,6)-(31,63)
(30,18)-(30,45)
*)

(* type error slice
(19,3)-(19,41)
(19,16)-(19,39)
(19,25)-(19,39)
(28,9)-(28,19)
(28,9)-(28,75)
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
(17,17)-(17,67)
(17,38)-(17,67)
(17,46)-(17,47)
(17,49)-(17,50)
(17,52)-(17,58)
(17,60)-(17,66)
(19,16)-(19,39)
(19,25)-(19,39)
(19,32)-(19,34)
(19,36)-(19,38)
(21,15)-(33,13)
(22,2)-(33,13)
(22,10)-(22,53)
(22,10)-(22,14)
(22,15)-(22,53)
(22,19)-(22,28)
(22,19)-(22,24)
(22,27)-(22,28)
(22,34)-(22,40)
(22,35)-(22,36)
(22,38)-(22,39)
(22,46)-(22,52)
(22,47)-(22,48)
(22,50)-(22,51)
(23,2)-(33,13)
(23,8)-(23,9)
(24,9)-(24,46)
(24,9)-(24,18)
(24,19)-(24,46)
(24,20)-(24,25)
(24,26)-(24,45)
(24,27)-(24,31)
(24,33)-(24,44)
(24,34)-(24,39)
(24,42)-(24,43)
(25,9)-(25,48)
(25,9)-(25,20)
(25,21)-(25,48)
(25,22)-(25,27)
(25,28)-(25,47)
(25,29)-(25,33)
(25,35)-(25,46)
(25,36)-(25,41)
(25,44)-(25,45)
(27,6)-(27,77)
(27,6)-(27,18)
(27,19)-(27,77)
(27,20)-(27,47)
(27,21)-(27,26)
(27,27)-(27,46)
(27,28)-(27,32)
(27,34)-(27,45)
(27,35)-(27,40)
(27,43)-(27,44)
(27,49)-(27,76)
(27,50)-(27,55)
(27,56)-(27,75)
(27,57)-(27,61)
(27,63)-(27,74)
(27,64)-(27,69)
(27,72)-(27,73)
(28,9)-(28,75)
(28,9)-(28,19)
(28,20)-(28,47)
(28,21)-(28,26)
(28,27)-(28,46)
(28,28)-(28,32)
(28,34)-(28,45)
(28,35)-(28,40)
(28,43)-(28,44)
(28,48)-(28,75)
(28,49)-(28,54)
(28,55)-(28,74)
(28,56)-(28,60)
(28,62)-(28,73)
(28,63)-(28,68)
(28,71)-(28,72)
(30,6)-(31,63)
(30,6)-(30,17)
(30,18)-(30,45)
(30,19)-(30,24)
(30,25)-(30,44)
(30,26)-(30,30)
(30,32)-(30,43)
(30,33)-(30,38)
(30,41)-(30,42)
(30,46)-(30,73)
(30,47)-(30,52)
(30,53)-(30,72)
(30,54)-(30,58)
(30,60)-(30,71)
(30,61)-(30,66)
(30,69)-(30,70)
(31,8)-(31,35)
(31,9)-(31,14)
(31,15)-(31,34)
(31,16)-(31,20)
(31,22)-(31,33)
(31,23)-(31,28)
(31,31)-(31,32)
(31,36)-(31,63)
(31,37)-(31,42)
(31,43)-(31,62)
(31,44)-(31,48)
(31,50)-(31,61)
(31,51)-(31,56)
(31,59)-(31,60)
(32,9)-(32,13)
(33,9)-(33,13)
*)
