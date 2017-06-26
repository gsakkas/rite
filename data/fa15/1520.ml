
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
  if depth > 0
  then
    match rand (1, 7) with
    | 1 -> VarX
    | 2 -> VarY
    | 3 -> buildSine (build (rand, (depth - 1)))
    | 4 -> buildCosine (build (rand, (depth - 1)))
    | 5 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 7 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))));;


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
  if depth > 0
  then
    match rand (1, 5) with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 4 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  else (match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ());;

*)

(* changed spans
(21,15)-(37,40)
(22,2)-(37,40)
(24,4)-(37,40)
(24,19)-(24,20)
(25,11)-(25,15)
(26,11)-(26,15)
(36,10)-(37,40)
*)

(* type error slice
(17,3)-(17,69)
(17,17)-(17,67)
(22,2)-(37,40)
(24,4)-(37,40)
(25,11)-(25,15)
(35,8)-(35,19)
(35,8)-(37,40)
(36,10)-(37,40)
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
(21,15)-(37,40)
(22,2)-(37,40)
(22,5)-(22,14)
(22,5)-(22,10)
(22,13)-(22,14)
(24,4)-(37,40)
(24,10)-(24,21)
(24,10)-(24,14)
(24,15)-(24,21)
(24,16)-(24,17)
(24,19)-(24,20)
(25,11)-(25,15)
(26,11)-(26,15)
(27,11)-(27,48)
(27,11)-(27,20)
(27,21)-(27,48)
(27,22)-(27,27)
(27,28)-(27,47)
(27,29)-(27,33)
(27,35)-(27,46)
(27,36)-(27,41)
(27,44)-(27,45)
(28,11)-(28,50)
(28,11)-(28,22)
(28,23)-(28,50)
(28,24)-(28,29)
(28,30)-(28,49)
(28,31)-(28,35)
(28,37)-(28,48)
(28,38)-(28,43)
(28,46)-(28,47)
(30,8)-(31,68)
(30,8)-(30,20)
(31,10)-(31,68)
(31,11)-(31,38)
(31,12)-(31,17)
(31,18)-(31,37)
(31,19)-(31,23)
(31,25)-(31,36)
(31,26)-(31,31)
(31,34)-(31,35)
(31,40)-(31,67)
(31,41)-(31,46)
(31,47)-(31,66)
(31,48)-(31,52)
(31,54)-(31,65)
(31,55)-(31,60)
(31,63)-(31,64)
(33,8)-(33,77)
(33,8)-(33,18)
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
(35,8)-(37,40)
(35,8)-(35,19)
(36,10)-(37,40)
(36,11)-(36,38)
(36,12)-(36,17)
(36,18)-(36,37)
(36,19)-(36,23)
(36,25)-(36,36)
(36,26)-(36,31)
(36,34)-(36,35)
(36,40)-(36,67)
(36,41)-(36,46)
(36,47)-(36,66)
(36,48)-(36,52)
(36,54)-(36,65)
(36,55)-(36,60)
(36,63)-(36,64)
(37,12)-(37,39)
(37,13)-(37,18)
(37,19)-(37,38)
(37,20)-(37,24)
(37,26)-(37,37)
(37,27)-(37,32)
(37,35)-(37,36)
*)
