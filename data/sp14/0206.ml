
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
(40,11)-(41,41)
*)

(* type error slice
(17,3)-(17,69)
(17,17)-(17,67)
(39,9)-(39,20)
(39,9)-(41,41)
(40,11)-(41,41)
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
(25,15)-(41,42)
(26,2)-(41,42)
(26,5)-(26,15)
(26,5)-(26,10)
(26,14)-(26,15)
(28,4)-(29,51)
(28,19)-(28,30)
(28,19)-(28,23)
(28,24)-(28,30)
(28,25)-(28,26)
(28,28)-(28,29)
(29,4)-(29,51)
(29,8)-(29,20)
(29,8)-(29,16)
(29,19)-(29,20)
(29,26)-(29,35)
(29,26)-(29,32)
(29,33)-(29,35)
(29,41)-(29,50)
(29,41)-(29,47)
(29,48)-(29,50)
(31,4)-(41,42)
(31,20)-(31,31)
(31,20)-(31,24)
(31,25)-(31,31)
(31,26)-(31,27)
(31,29)-(31,30)
(32,5)-(41,41)
(32,24)-(32,49)
(32,24)-(32,29)
(32,30)-(32,49)
(32,31)-(32,35)
(32,37)-(32,48)
(32,38)-(32,43)
(32,46)-(32,47)
(33,5)-(41,41)
(33,11)-(33,19)
(34,12)-(34,34)
(34,12)-(34,21)
(34,22)-(34,34)
(35,12)-(35,36)
(35,12)-(35,23)
(35,24)-(35,36)
(36,12)-(36,68)
(36,12)-(36,24)
(36,25)-(36,68)
(36,26)-(36,38)
(36,40)-(36,67)
(36,41)-(36,46)
(36,47)-(36,66)
(36,48)-(36,52)
(36,54)-(36,65)
(36,55)-(36,60)
(36,63)-(36,64)
(37,12)-(37,66)
(37,12)-(37,22)
(37,23)-(37,66)
(37,24)-(37,36)
(37,38)-(37,65)
(37,39)-(37,44)
(37,45)-(37,64)
(37,46)-(37,50)
(37,52)-(37,63)
(37,53)-(37,58)
(37,61)-(37,62)
(39,9)-(41,41)
(39,9)-(39,20)
(40,11)-(41,41)
(40,12)-(40,24)
(40,26)-(40,53)
(40,27)-(40,32)
(40,33)-(40,52)
(40,34)-(40,38)
(40,40)-(40,51)
(40,41)-(40,46)
(40,49)-(40,50)
(41,13)-(41,40)
(41,14)-(41,19)
(41,20)-(41,39)
(41,21)-(41,25)
(41,27)-(41,38)
(41,28)-(41,33)
(41,36)-(41,37)
*)
