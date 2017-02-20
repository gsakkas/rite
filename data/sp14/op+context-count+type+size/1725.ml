
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
  then let result = rand 0 1 in (if result = 0 then buildX () else buildY ())
  else
    (let result = rand 0 6 in
     match result with
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
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ -> build ());;


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
  then
    let result = rand (0, 1) in (if result = 0 then buildX () else buildY ())
  else
    (let result = rand (0, 6) in
     match result with
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
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ -> buildX ());;

*)

(* changed spans
(27,7)-(27,77)
(27,20)-(27,24)
(27,20)-(27,28)
(27,25)-(27,26)
(29,4)-(45,21)
(29,18)-(29,22)
(29,18)-(29,26)
(29,23)-(29,24)
(45,12)-(45,17)
*)

(* type error slice
(33,22)-(33,49)
(33,23)-(33,28)
(33,29)-(33,48)
(45,12)-(45,17)
(45,12)-(45,20)
(45,18)-(45,20)
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
(25,15)-(45,21)
(26,2)-(45,21)
(26,5)-(26,14)
(26,5)-(26,10)
(26,13)-(26,14)
(27,7)-(27,77)
(27,20)-(27,28)
(27,20)-(27,24)
(27,25)-(27,26)
(27,27)-(27,28)
(27,32)-(27,77)
(27,36)-(27,46)
(27,36)-(27,42)
(27,45)-(27,46)
(27,52)-(27,61)
(27,52)-(27,58)
(27,59)-(27,61)
(27,67)-(27,76)
(27,67)-(27,73)
(27,74)-(27,76)
(29,4)-(45,21)
(29,18)-(29,26)
(29,18)-(29,22)
(29,23)-(29,24)
(29,25)-(29,26)
(30,5)-(45,20)
(30,11)-(30,17)
(31,12)-(31,21)
(31,12)-(31,18)
(31,19)-(31,21)
(32,12)-(32,21)
(32,12)-(32,18)
(32,19)-(32,21)
(33,12)-(33,49)
(33,12)-(33,21)
(33,22)-(33,49)
(33,23)-(33,28)
(33,29)-(33,48)
(33,30)-(33,34)
(33,36)-(33,47)
(33,37)-(33,42)
(33,45)-(33,46)
(34,12)-(34,51)
(34,12)-(34,23)
(34,24)-(34,51)
(34,25)-(34,30)
(34,31)-(34,50)
(34,32)-(34,36)
(34,38)-(34,49)
(34,39)-(34,44)
(34,47)-(34,48)
(36,9)-(37,69)
(36,9)-(36,21)
(37,11)-(37,69)
(37,12)-(37,39)
(37,13)-(37,18)
(37,19)-(37,38)
(37,20)-(37,24)
(37,26)-(37,37)
(37,27)-(37,32)
(37,35)-(37,36)
(37,41)-(37,68)
(37,42)-(37,47)
(37,48)-(37,67)
(37,49)-(37,53)
(37,55)-(37,66)
(37,56)-(37,61)
(37,64)-(37,65)
(39,9)-(40,69)
(39,9)-(39,19)
(40,11)-(40,69)
(40,12)-(40,39)
(40,13)-(40,18)
(40,19)-(40,38)
(40,20)-(40,24)
(40,26)-(40,37)
(40,27)-(40,32)
(40,35)-(40,36)
(40,41)-(40,68)
(40,42)-(40,47)
(40,48)-(40,67)
(40,49)-(40,53)
(40,55)-(40,66)
(40,56)-(40,61)
(40,64)-(40,65)
(42,9)-(44,70)
(42,9)-(42,20)
(43,11)-(44,70)
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
(44,13)-(44,40)
(44,14)-(44,19)
(44,20)-(44,39)
(44,21)-(44,25)
(44,27)-(44,38)
(44,28)-(44,33)
(44,36)-(44,37)
(44,42)-(44,69)
(44,43)-(44,48)
(44,49)-(44,68)
(44,50)-(44,54)
(44,56)-(44,67)
(44,57)-(44,62)
(44,65)-(44,66)
(45,12)-(45,20)
(45,12)-(45,17)
(45,18)-(45,20)
*)
