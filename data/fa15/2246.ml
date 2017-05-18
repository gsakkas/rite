
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cotangent of expr
  | Volume of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildCotanget e = Cotangent e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildVolume (l,w,h) = Volume (l, w, h);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let random = rand (0, 1) in (if random = 0 then buildX () else buildY ())
  else
    (let random = rand (0, 6) in
     match random with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 -> buildCotanget (rand, (depth - 1))
     | 6 -> buildVolume (rand, (depth - 1)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cotangent of expr
  | Volume of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildCotangent e = Cotangent e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildVolume (l,w,h) = Volume (l, w, h);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let random = rand (0, 1) in (if random = 0 then buildX () else buildY ())
  else
    (let random = rand (0, 4) in
     match random with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 -> buildCotangent (build (rand, (depth - 1)))
     | 6 ->
         buildVolume
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1)))));;

*)

(* changed spans
(36,27)-(36,28)
(50,12)-(50,25)
(50,26)-(50,45)
(51,24)-(51,43)
*)

(* type error slice
(17,3)-(17,35)
(17,18)-(17,33)
(17,22)-(17,33)
(17,32)-(17,33)
(25,3)-(25,44)
(25,17)-(25,42)
(50,12)-(50,25)
(50,12)-(50,45)
(50,26)-(50,45)
(51,12)-(51,23)
(51,12)-(51,43)
(51,24)-(51,43)
*)

(* all spans
(13,18)-(13,43)
(13,27)-(13,43)
(13,36)-(13,38)
(13,40)-(13,42)
(15,16)-(15,28)
(15,20)-(15,28)
(15,27)-(15,28)
(17,18)-(17,33)
(17,22)-(17,33)
(17,32)-(17,33)
(19,14)-(19,24)
(19,18)-(19,24)
(19,23)-(19,24)
(21,17)-(21,67)
(21,38)-(21,67)
(21,46)-(21,47)
(21,49)-(21,50)
(21,52)-(21,58)
(21,60)-(21,66)
(23,16)-(23,39)
(23,25)-(23,39)
(23,32)-(23,34)
(23,36)-(23,38)
(25,17)-(25,42)
(25,26)-(25,42)
(25,34)-(25,35)
(25,37)-(25,38)
(25,40)-(25,41)
(27,11)-(27,20)
(27,16)-(27,20)
(29,11)-(29,20)
(29,16)-(29,20)
(31,15)-(51,44)
(32,2)-(51,44)
(32,5)-(32,14)
(32,5)-(32,10)
(32,13)-(32,14)
(34,4)-(34,77)
(34,17)-(34,28)
(34,17)-(34,21)
(34,22)-(34,28)
(34,23)-(34,24)
(34,26)-(34,27)
(34,32)-(34,77)
(34,36)-(34,46)
(34,36)-(34,42)
(34,45)-(34,46)
(34,52)-(34,61)
(34,52)-(34,58)
(34,59)-(34,61)
(34,67)-(34,76)
(34,67)-(34,73)
(34,74)-(34,76)
(36,4)-(51,44)
(36,18)-(36,29)
(36,18)-(36,22)
(36,23)-(36,29)
(36,24)-(36,25)
(36,27)-(36,28)
(37,5)-(51,43)
(37,11)-(37,17)
(38,12)-(38,49)
(38,12)-(38,21)
(38,22)-(38,49)
(38,23)-(38,28)
(38,29)-(38,48)
(38,30)-(38,34)
(38,36)-(38,47)
(38,37)-(38,42)
(38,45)-(38,46)
(39,12)-(39,51)
(39,12)-(39,23)
(39,24)-(39,51)
(39,25)-(39,30)
(39,31)-(39,50)
(39,32)-(39,36)
(39,38)-(39,49)
(39,39)-(39,44)
(39,47)-(39,48)
(41,9)-(42,69)
(41,9)-(41,21)
(42,11)-(42,69)
(42,12)-(42,39)
(42,13)-(42,18)
(42,19)-(42,38)
(42,20)-(42,24)
(42,26)-(42,37)
(42,27)-(42,32)
(42,35)-(42,36)
(42,41)-(42,68)
(42,42)-(42,47)
(42,48)-(42,67)
(42,49)-(42,53)
(42,55)-(42,66)
(42,56)-(42,61)
(42,64)-(42,65)
(44,9)-(45,69)
(44,9)-(44,19)
(45,11)-(45,69)
(45,12)-(45,39)
(45,13)-(45,18)
(45,19)-(45,38)
(45,20)-(45,24)
(45,26)-(45,37)
(45,27)-(45,32)
(45,35)-(45,36)
(45,41)-(45,68)
(45,42)-(45,47)
(45,48)-(45,67)
(45,49)-(45,53)
(45,55)-(45,66)
(45,56)-(45,61)
(45,64)-(45,65)
(47,9)-(49,70)
(47,9)-(47,20)
(48,11)-(49,70)
(48,12)-(48,39)
(48,13)-(48,18)
(48,19)-(48,38)
(48,20)-(48,24)
(48,26)-(48,37)
(48,27)-(48,32)
(48,35)-(48,36)
(48,41)-(48,68)
(48,42)-(48,47)
(48,48)-(48,67)
(48,49)-(48,53)
(48,55)-(48,66)
(48,56)-(48,61)
(48,64)-(48,65)
(49,13)-(49,40)
(49,14)-(49,19)
(49,20)-(49,39)
(49,21)-(49,25)
(49,27)-(49,38)
(49,28)-(49,33)
(49,36)-(49,37)
(49,42)-(49,69)
(49,43)-(49,48)
(49,49)-(49,68)
(49,50)-(49,54)
(49,56)-(49,67)
(49,57)-(49,62)
(49,65)-(49,66)
(50,12)-(50,45)
(50,12)-(50,25)
(50,26)-(50,45)
(50,27)-(50,31)
(50,33)-(50,44)
(50,34)-(50,39)
(50,42)-(50,43)
(51,12)-(51,43)
(51,12)-(51,23)
(51,24)-(51,43)
(51,25)-(51,29)
(51,31)-(51,42)
(51,32)-(51,37)
(51,40)-(51,41)
*)
