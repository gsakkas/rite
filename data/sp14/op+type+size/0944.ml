
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
  if depth = 0
  then
    let case = rand (0, 1) in
    match case with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
    | 4 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
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
(27,2)-(43,69)
(27,5)-(27,10)
(27,5)-(27,14)
(27,13)-(27,14)
(29,4)-(43,69)
(29,15)-(29,19)
(29,15)-(29,26)
(29,20)-(29,26)
(29,21)-(29,22)
(29,24)-(29,25)
(43,27)-(43,32)
(43,41)-(43,68)
*)

(* type error slice
(21,3)-(21,22)
(21,11)-(21,20)
(21,16)-(21,20)
(27,2)-(43,69)
(27,2)-(43,69)
(27,2)-(43,69)
(29,4)-(43,69)
(30,4)-(43,69)
(31,11)-(31,17)
(31,11)-(31,20)
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
(25,15)-(43,69)
(26,2)-(43,69)
(26,13)-(26,24)
(26,13)-(26,17)
(26,18)-(26,24)
(26,19)-(26,20)
(26,22)-(26,23)
(27,2)-(43,69)
(27,5)-(27,14)
(27,5)-(27,10)
(27,13)-(27,14)
(29,4)-(43,69)
(29,15)-(29,26)
(29,15)-(29,19)
(29,20)-(29,26)
(29,21)-(29,22)
(29,24)-(29,25)
(30,4)-(43,69)
(30,10)-(30,14)
(31,11)-(31,20)
(31,11)-(31,17)
(31,18)-(31,20)
(32,11)-(32,20)
(32,11)-(32,17)
(32,18)-(32,20)
(33,11)-(33,48)
(33,11)-(33,20)
(33,21)-(33,48)
(33,22)-(33,27)
(33,28)-(33,47)
(33,29)-(33,33)
(33,35)-(33,46)
(33,36)-(33,41)
(33,44)-(33,45)
(34,11)-(34,50)
(34,11)-(34,22)
(34,23)-(34,50)
(34,24)-(34,29)
(34,30)-(34,49)
(34,31)-(34,35)
(34,37)-(34,48)
(34,38)-(34,43)
(34,46)-(34,47)
(36,8)-(37,68)
(36,8)-(36,20)
(37,10)-(37,68)
(37,11)-(37,38)
(37,12)-(37,17)
(37,18)-(37,37)
(37,19)-(37,23)
(37,25)-(37,36)
(37,26)-(37,31)
(37,34)-(37,35)
(37,40)-(37,67)
(37,41)-(37,46)
(37,47)-(37,66)
(37,48)-(37,52)
(37,54)-(37,65)
(37,55)-(37,60)
(37,63)-(37,64)
(39,8)-(39,77)
(39,8)-(39,18)
(39,19)-(39,77)
(39,20)-(39,47)
(39,21)-(39,26)
(39,27)-(39,46)
(39,28)-(39,32)
(39,34)-(39,45)
(39,35)-(39,40)
(39,43)-(39,44)
(39,49)-(39,76)
(39,50)-(39,55)
(39,56)-(39,75)
(39,57)-(39,61)
(39,63)-(39,74)
(39,64)-(39,69)
(39,72)-(39,73)
(41,8)-(43,69)
(41,8)-(41,19)
(42,10)-(43,69)
(42,11)-(42,38)
(42,12)-(42,17)
(42,18)-(42,37)
(42,19)-(42,23)
(42,25)-(42,36)
(42,26)-(42,31)
(42,34)-(42,35)
(42,40)-(42,67)
(42,41)-(42,46)
(42,47)-(42,66)
(42,48)-(42,52)
(42,54)-(42,65)
(42,55)-(42,60)
(42,63)-(42,64)
(43,12)-(43,39)
(43,13)-(43,18)
(43,19)-(43,38)
(43,20)-(43,24)
(43,26)-(43,37)
(43,27)-(43,32)
(43,35)-(43,36)
(43,41)-(43,68)
(43,42)-(43,47)
(43,48)-(43,67)
(43,49)-(43,53)
(43,55)-(43,66)
(43,56)-(43,61)
(43,64)-(43,65)
(27,2)-(43,69)
*)
