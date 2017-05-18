
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
            (build (rand, (depth - 1))))
  else (match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ());;


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
(38,10)-(39,40)
(40,7)-(40,65)
*)

(* type error slice
(17,3)-(17,69)
(17,17)-(17,67)
(37,8)-(37,19)
(37,8)-(39,40)
(38,10)-(39,40)
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
(21,11)-(21,20)
(21,16)-(21,20)
(23,11)-(23,20)
(23,16)-(23,20)
(25,15)-(40,65)
(26,2)-(40,65)
(26,5)-(26,14)
(26,5)-(26,10)
(26,13)-(26,14)
(28,4)-(39,40)
(28,10)-(28,21)
(28,10)-(28,14)
(28,15)-(28,21)
(28,16)-(28,17)
(28,19)-(28,20)
(29,11)-(29,48)
(29,11)-(29,20)
(29,21)-(29,48)
(29,22)-(29,27)
(29,28)-(29,47)
(29,29)-(29,33)
(29,35)-(29,46)
(29,36)-(29,41)
(29,44)-(29,45)
(30,11)-(30,50)
(30,11)-(30,22)
(30,23)-(30,50)
(30,24)-(30,29)
(30,30)-(30,49)
(30,31)-(30,35)
(30,37)-(30,48)
(30,38)-(30,43)
(30,46)-(30,47)
(32,8)-(33,68)
(32,8)-(32,20)
(33,10)-(33,68)
(33,11)-(33,38)
(33,12)-(33,17)
(33,18)-(33,37)
(33,19)-(33,23)
(33,25)-(33,36)
(33,26)-(33,31)
(33,34)-(33,35)
(33,40)-(33,67)
(33,41)-(33,46)
(33,47)-(33,66)
(33,48)-(33,52)
(33,54)-(33,65)
(33,55)-(33,60)
(33,63)-(33,64)
(35,8)-(35,77)
(35,8)-(35,18)
(35,19)-(35,77)
(35,20)-(35,47)
(35,21)-(35,26)
(35,27)-(35,46)
(35,28)-(35,32)
(35,34)-(35,45)
(35,35)-(35,40)
(35,43)-(35,44)
(35,49)-(35,76)
(35,50)-(35,55)
(35,56)-(35,75)
(35,57)-(35,61)
(35,63)-(35,74)
(35,64)-(35,69)
(35,72)-(35,73)
(37,8)-(39,40)
(37,8)-(37,19)
(38,10)-(39,40)
(38,11)-(38,38)
(38,12)-(38,17)
(38,18)-(38,37)
(38,19)-(38,23)
(38,25)-(38,36)
(38,26)-(38,31)
(38,34)-(38,35)
(38,40)-(38,67)
(38,41)-(38,46)
(38,47)-(38,66)
(38,48)-(38,52)
(38,54)-(38,65)
(38,55)-(38,60)
(38,63)-(38,64)
(39,12)-(39,39)
(39,13)-(39,18)
(39,19)-(39,38)
(39,20)-(39,24)
(39,26)-(39,37)
(39,27)-(39,32)
(39,35)-(39,36)
(40,7)-(40,65)
(40,14)-(40,25)
(40,14)-(40,18)
(40,19)-(40,25)
(40,20)-(40,21)
(40,23)-(40,24)
(40,38)-(40,47)
(40,38)-(40,44)
(40,45)-(40,47)
(40,55)-(40,64)
(40,55)-(40,61)
(40,62)-(40,64)
*)
