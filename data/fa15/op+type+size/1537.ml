
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
  let r = if depth > 0 then rand (2, 6) else rand (0, 1) in
  match r with
  | 0 -> buildX
  | 1 -> buildY
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
  let r = if depth > 0 then rand (2, 6) else rand (0, 1) in
  match r with
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
(28,9)-(28,15)
(29,9)-(29,15)
(30,9)-(30,46)
(39,54)-(39,59)
(39,62)-(39,63)
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
(25,3)-(39,69)
(25,15)-(39,67)
(26,2)-(39,67)
(27,2)-(39,67)
(27,2)-(39,67)
(27,2)-(39,67)
(27,2)-(39,67)
(27,2)-(39,67)
(27,2)-(39,67)
(28,9)-(28,15)
(30,9)-(30,18)
(30,9)-(30,46)
(30,19)-(30,46)
(30,20)-(30,25)
(31,9)-(31,20)
(31,9)-(31,48)
(33,6)-(33,18)
(33,6)-(33,77)
(35,6)-(35,16)
(35,6)-(35,75)
(37,6)-(37,17)
(37,6)-(39,67)
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
(25,15)-(39,67)
(26,2)-(39,67)
(26,10)-(26,56)
(26,13)-(26,22)
(26,13)-(26,18)
(26,21)-(26,22)
(26,28)-(26,39)
(26,28)-(26,32)
(26,33)-(26,39)
(26,34)-(26,35)
(26,37)-(26,38)
(26,45)-(26,56)
(26,45)-(26,49)
(26,50)-(26,56)
(26,51)-(26,52)
(26,54)-(26,55)
(27,2)-(39,67)
(27,8)-(27,9)
(28,9)-(28,15)
(29,9)-(29,15)
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
*)
