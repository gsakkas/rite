
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
  if depth <= 0
  then
    let bin_rand = rand (1, 2) in
    (if bin_rand = 1 then buildX () else buildY ())
  else
    (let exp_rand = rand (1, 5) in
     let first_forced = build (rand, (depth - 1)) in
     match exp_rand with
     | 1 -> buildSine first_forced
     | 2 -> buildCosine first_forced
     | 3 -> buildAverage (first_forced, (build (rand, (depth - 1))))
     | 4 -> buildTimes (first_forced, (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           (first_forced, (build (rand, (depth - 1))),
             (build (rand, (depth - 1)))));;


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
  if depth <= 0
  then
    let bin_rand = rand (1, 2) in
    (if bin_rand = 1 then buildX () else buildY ())
  else
    (let exp_rand = rand (1, 5) in
     let first_forced = build (rand, (depth - 1)) in
     match exp_rand with
     | 1 -> buildSine first_forced
     | 2 -> buildCosine first_forced
     | 3 -> buildAverage (first_forced, (build (rand, (depth - 1))))
     | 4 -> buildTimes (first_forced, (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           (first_forced, (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(40,13)-(41,38)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(17,47)-(17,48)
(17,50)-(17,51)
(17,53)-(17,59)
(17,61)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(19,26)-(19,39)
(19,33)-(19,35)
(19,37)-(19,39)
(21,4)-(21,23)
(21,12)-(21,21)
(21,12)-(21,21)
(21,17)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(23,12)-(23,21)
(23,17)-(23,21)
(25,16)-(41,38)
(26,3)-(41,38)
(26,3)-(41,38)
(26,6)-(26,11)
(26,6)-(26,16)
(26,6)-(26,16)
(26,6)-(26,16)
(26,15)-(26,16)
(28,5)-(29,51)
(28,5)-(29,51)
(28,20)-(28,24)
(28,20)-(28,30)
(28,20)-(28,30)
(28,26)-(28,27)
(28,26)-(28,30)
(28,29)-(28,30)
(29,6)-(29,51)
(29,6)-(29,51)
(29,9)-(29,17)
(29,9)-(29,21)
(29,9)-(29,21)
(29,9)-(29,21)
(29,20)-(29,21)
(29,27)-(29,33)
(29,27)-(29,36)
(29,34)-(29,36)
(29,42)-(29,48)
(29,42)-(29,51)
(29,49)-(29,51)
(31,6)-(41,38)
(31,6)-(41,38)
(31,21)-(31,25)
(31,21)-(31,31)
(31,27)-(31,28)
(31,27)-(31,31)
(31,30)-(31,31)
(32,6)-(41,38)
(32,6)-(41,38)
(32,25)-(32,30)
(32,25)-(32,48)
(32,25)-(32,48)
(32,32)-(32,36)
(32,32)-(32,48)
(32,39)-(32,44)
(32,39)-(32,48)
(32,47)-(32,48)
(33,6)-(41,38)
(33,6)-(41,38)
(33,6)-(41,38)
(33,6)-(41,38)
(33,6)-(41,38)
(33,6)-(41,38)
(33,6)-(41,38)
(33,6)-(41,38)
(33,6)-(41,38)
(33,6)-(41,38)
(33,12)-(33,20)
(34,13)-(34,22)
(34,13)-(34,35)
(34,13)-(34,35)
(34,23)-(34,35)
(35,13)-(35,24)
(35,13)-(35,37)
(35,25)-(35,37)
(36,13)-(36,25)
(36,13)-(36,65)
(36,27)-(36,39)
(36,27)-(36,65)
(36,42)-(36,47)
(36,42)-(36,65)
(36,49)-(36,53)
(36,49)-(36,65)
(36,56)-(36,61)
(36,56)-(36,65)
(36,64)-(36,65)
(37,13)-(37,23)
(37,13)-(37,63)
(37,25)-(37,37)
(37,25)-(37,63)
(37,40)-(37,45)
(37,40)-(37,63)
(37,47)-(37,51)
(37,47)-(37,63)
(37,54)-(37,59)
(37,54)-(37,63)
(37,62)-(37,63)
(39,10)-(39,21)
(39,10)-(41,38)
(39,10)-(41,38)
(40,13)-(40,25)
(40,13)-(41,38)
(40,28)-(40,33)
(40,28)-(40,51)
(40,35)-(40,39)
(40,35)-(40,51)
(40,42)-(40,47)
(40,42)-(40,51)
(40,50)-(40,51)
(41,15)-(41,20)
(41,15)-(41,38)
(41,22)-(41,26)
(41,22)-(41,38)
(41,29)-(41,34)
(41,29)-(41,38)
(41,37)-(41,38)
*)
