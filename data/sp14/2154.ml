
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Special1 of expr* expr* expr
  | Special2 of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildSpecial1 (e1,e2,e3) = Special1 (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth < 1
  then
    let base = rand (0, 2) in
    match base with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | _ -> (if base < 0 then buildX () else buildY ())
  else
    (let recurse = rand (0, 6) in
     match recurse with
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
     | 5 ->
         buildSpecial1
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ ->
         if recurse > 2
         then buildCosine (build (rand, (depth - 1)))
         else buildSine (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Special1 of expr* expr* expr
  | Special2 of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildSpecial1 (e1,e2,e3) = Special1 (e1, e2, e3);;

let buildSpecial2 (e1,e2) = Special2 (e1, e2);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth < 1
  then
    let base = rand (0, 2) in
    match base with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | _ -> (if base < 0 then buildX () else buildY ())
  else
    (let recurse = rand (0, 6) in
     match recurse with
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
     | 5 ->
         buildSpecial1
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | 6 ->
         buildSpecial2
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ ->
         if recurse > 2
         then buildCosine (build (rand, (depth - 1)))
         else buildSine (build (rand, (depth - 1))));;

*)

(* changed spans
(21,17)-(21,67)
(39,5)-(58,51)
(54,11)-(54,69)
(54,12)-(54,39)
(56,9)-(58,51)
*)

(* type error slice
(19,3)-(19,54)
(19,19)-(19,52)
(53,9)-(53,22)
(53,9)-(54,69)
(54,11)-(54,69)
*)

(* all spans
(13,18)-(13,43)
(13,27)-(13,43)
(13,36)-(13,38)
(13,40)-(13,42)
(15,16)-(15,28)
(15,20)-(15,28)
(15,27)-(15,28)
(17,14)-(17,24)
(17,18)-(17,24)
(17,23)-(17,24)
(19,19)-(19,52)
(19,31)-(19,52)
(19,41)-(19,43)
(19,45)-(19,47)
(19,49)-(19,51)
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
(25,11)-(25,20)
(25,16)-(25,20)
(27,11)-(27,20)
(27,16)-(27,20)
(29,15)-(58,52)
(30,2)-(58,52)
(30,5)-(30,14)
(30,5)-(30,10)
(30,13)-(30,14)
(32,4)-(36,54)
(32,15)-(32,26)
(32,15)-(32,19)
(32,20)-(32,26)
(32,21)-(32,22)
(32,24)-(32,25)
(33,4)-(36,54)
(33,10)-(33,14)
(34,11)-(34,20)
(34,11)-(34,17)
(34,18)-(34,20)
(35,11)-(35,20)
(35,11)-(35,17)
(35,18)-(35,20)
(36,11)-(36,54)
(36,15)-(36,23)
(36,15)-(36,19)
(36,22)-(36,23)
(36,29)-(36,38)
(36,29)-(36,35)
(36,36)-(36,38)
(36,44)-(36,53)
(36,44)-(36,50)
(36,51)-(36,53)
(38,4)-(58,52)
(38,19)-(38,30)
(38,19)-(38,23)
(38,24)-(38,30)
(38,25)-(38,26)
(38,28)-(38,29)
(39,5)-(58,51)
(39,11)-(39,18)
(40,12)-(40,49)
(40,12)-(40,21)
(40,22)-(40,49)
(40,23)-(40,28)
(40,29)-(40,48)
(40,30)-(40,34)
(40,36)-(40,47)
(40,37)-(40,42)
(40,45)-(40,46)
(41,12)-(41,51)
(41,12)-(41,23)
(41,24)-(41,51)
(41,25)-(41,30)
(41,31)-(41,50)
(41,32)-(41,36)
(41,38)-(41,49)
(41,39)-(41,44)
(41,47)-(41,48)
(43,9)-(44,69)
(43,9)-(43,21)
(44,11)-(44,69)
(44,12)-(44,39)
(44,13)-(44,18)
(44,19)-(44,38)
(44,20)-(44,24)
(44,26)-(44,37)
(44,27)-(44,32)
(44,35)-(44,36)
(44,41)-(44,68)
(44,42)-(44,47)
(44,48)-(44,67)
(44,49)-(44,53)
(44,55)-(44,66)
(44,56)-(44,61)
(44,64)-(44,65)
(46,9)-(47,69)
(46,9)-(46,19)
(47,11)-(47,69)
(47,12)-(47,39)
(47,13)-(47,18)
(47,19)-(47,38)
(47,20)-(47,24)
(47,26)-(47,37)
(47,27)-(47,32)
(47,35)-(47,36)
(47,41)-(47,68)
(47,42)-(47,47)
(47,48)-(47,67)
(47,49)-(47,53)
(47,55)-(47,66)
(47,56)-(47,61)
(47,64)-(47,65)
(49,9)-(51,70)
(49,9)-(49,20)
(50,11)-(51,70)
(50,12)-(50,39)
(50,13)-(50,18)
(50,19)-(50,38)
(50,20)-(50,24)
(50,26)-(50,37)
(50,27)-(50,32)
(50,35)-(50,36)
(50,41)-(50,68)
(50,42)-(50,47)
(50,48)-(50,67)
(50,49)-(50,53)
(50,55)-(50,66)
(50,56)-(50,61)
(50,64)-(50,65)
(51,13)-(51,40)
(51,14)-(51,19)
(51,20)-(51,39)
(51,21)-(51,25)
(51,27)-(51,38)
(51,28)-(51,33)
(51,36)-(51,37)
(51,42)-(51,69)
(51,43)-(51,48)
(51,49)-(51,68)
(51,50)-(51,54)
(51,56)-(51,67)
(51,57)-(51,62)
(51,65)-(51,66)
(53,9)-(54,69)
(53,9)-(53,22)
(54,11)-(54,69)
(54,12)-(54,39)
(54,13)-(54,18)
(54,19)-(54,38)
(54,20)-(54,24)
(54,26)-(54,37)
(54,27)-(54,32)
(54,35)-(54,36)
(54,41)-(54,68)
(54,42)-(54,47)
(54,48)-(54,67)
(54,49)-(54,53)
(54,55)-(54,66)
(54,56)-(54,61)
(54,64)-(54,65)
(56,9)-(58,51)
(56,12)-(56,23)
(56,12)-(56,19)
(56,22)-(56,23)
(57,14)-(57,53)
(57,14)-(57,25)
(57,26)-(57,53)
(57,27)-(57,32)
(57,33)-(57,52)
(57,34)-(57,38)
(57,40)-(57,51)
(57,41)-(57,46)
(57,49)-(57,50)
(58,14)-(58,51)
(58,14)-(58,23)
(58,24)-(58,51)
(58,25)-(58,30)
(58,31)-(58,50)
(58,32)-(58,36)
(58,38)-(58,49)
(58,39)-(58,44)
(58,47)-(58,48)
*)
