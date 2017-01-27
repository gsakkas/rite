
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
  match rand (1, 7) with
  | _ -> rand (1, 7)
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 ->
      buildTimes
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 7 ->
      buildThresh
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))),
          (if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))));;


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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 ->
      buildTimes
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 7 ->
      buildThresh
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))),
          (if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))));;

*)

(* changed spans
(26,3)-(48,68)
(26,9)-(26,13)
(26,9)-(26,19)
(26,15)-(26,16)
(26,15)-(26,19)
(26,18)-(26,19)
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
(21,17)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(23,17)-(23,21)
(25,4)-(48,74)
(25,16)-(48,68)
(26,3)-(48,68)
(26,9)-(26,13)
(26,9)-(26,19)
(26,15)-(26,16)
(26,15)-(26,19)
(26,18)-(26,19)
(27,10)-(27,14)
(27,10)-(27,20)
(27,16)-(27,17)
(27,16)-(27,20)
(27,19)-(27,20)
(28,10)-(28,16)
(28,10)-(28,19)
(28,17)-(28,19)
(29,10)-(29,16)
(29,10)-(29,19)
(29,17)-(29,19)
(31,7)-(31,16)
(31,7)-(31,74)
(31,18)-(31,74)
(31,21)-(31,26)
(31,21)-(31,30)
(31,29)-(31,30)
(31,36)-(31,42)
(31,36)-(31,45)
(31,43)-(31,45)
(31,51)-(31,56)
(31,51)-(31,74)
(31,58)-(31,62)
(31,58)-(31,74)
(31,65)-(31,74)
(33,7)-(33,18)
(33,7)-(34,66)
(34,10)-(34,66)
(34,28)-(34,34)
(34,28)-(34,37)
(34,35)-(34,37)
(36,7)-(36,19)
(36,7)-(38,68)
(37,11)-(37,67)
(37,11)-(38,68)
(37,29)-(37,35)
(37,29)-(37,38)
(37,36)-(37,38)
(38,12)-(38,68)
(38,30)-(38,36)
(38,30)-(38,39)
(38,37)-(38,39)
(40,7)-(40,17)
(40,7)-(42,68)
(41,11)-(41,67)
(41,11)-(42,68)
(41,29)-(41,35)
(41,29)-(41,38)
(41,36)-(41,38)
(42,12)-(42,68)
(42,30)-(42,36)
(42,30)-(42,39)
(42,37)-(42,39)
(44,7)-(44,18)
(44,7)-(48,68)
(45,11)-(45,67)
(45,11)-(48,68)
(45,29)-(45,35)
(45,29)-(45,38)
(45,36)-(45,38)
(46,12)-(46,68)
(46,30)-(46,36)
(46,30)-(46,39)
(46,37)-(46,39)
(47,12)-(47,68)
(47,30)-(47,36)
(47,30)-(47,39)
(47,37)-(47,39)
(48,12)-(48,68)
(48,30)-(48,36)
(48,30)-(48,39)
(48,37)-(48,39)
*)
