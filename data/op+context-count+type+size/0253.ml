
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
         buildAverage
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
(17,17)-(17,39)
(37,10)-(37,22)
(38,13)-(38,25)
(38,13)-(39,38)
(39,22)-(39,26)
(39,29)-(39,34)
(39,29)-(39,38)
(39,37)-(39,38)
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
(17,4)-(17,42)
(17,17)-(17,39)
(17,26)-(17,39)
(17,33)-(17,35)
(17,37)-(17,39)
(19,4)-(19,23)
(19,12)-(19,21)
(19,12)-(19,21)
(19,17)-(19,21)
(21,4)-(21,23)
(21,12)-(21,21)
(21,12)-(21,21)
(21,17)-(21,21)
(23,16)-(39,38)
(24,3)-(39,38)
(24,3)-(39,38)
(24,6)-(24,11)
(24,6)-(24,16)
(24,6)-(24,16)
(24,6)-(24,16)
(24,15)-(24,16)
(26,5)-(27,51)
(26,5)-(27,51)
(26,20)-(26,24)
(26,20)-(26,30)
(26,20)-(26,30)
(26,26)-(26,27)
(26,26)-(26,30)
(26,29)-(26,30)
(27,6)-(27,51)
(27,6)-(27,51)
(27,9)-(27,17)
(27,9)-(27,21)
(27,9)-(27,21)
(27,9)-(27,21)
(27,20)-(27,21)
(27,27)-(27,33)
(27,27)-(27,36)
(27,34)-(27,36)
(27,42)-(27,48)
(27,42)-(27,51)
(27,49)-(27,51)
(29,6)-(39,38)
(29,6)-(39,38)
(29,21)-(29,25)
(29,21)-(29,31)
(29,27)-(29,28)
(29,27)-(29,31)
(29,30)-(29,31)
(30,6)-(39,38)
(30,6)-(39,38)
(30,25)-(30,30)
(30,25)-(30,48)
(30,25)-(30,48)
(30,32)-(30,36)
(30,32)-(30,48)
(30,39)-(30,44)
(30,39)-(30,48)
(30,47)-(30,48)
(31,6)-(39,38)
(31,6)-(39,38)
(31,6)-(39,38)
(31,6)-(39,38)
(31,6)-(39,38)
(31,6)-(39,38)
(31,6)-(39,38)
(31,6)-(39,38)
(31,6)-(39,38)
(31,6)-(39,38)
(31,12)-(31,20)
(32,13)-(32,22)
(32,13)-(32,35)
(32,13)-(32,35)
(32,23)-(32,35)
(33,13)-(33,24)
(33,13)-(33,37)
(33,25)-(33,37)
(34,13)-(34,25)
(34,13)-(34,65)
(34,27)-(34,39)
(34,27)-(34,65)
(34,42)-(34,47)
(34,42)-(34,65)
(34,49)-(34,53)
(34,49)-(34,65)
(34,56)-(34,61)
(34,56)-(34,65)
(34,64)-(34,65)
(35,13)-(35,23)
(35,13)-(35,63)
(35,25)-(35,37)
(35,25)-(35,63)
(35,40)-(35,45)
(35,40)-(35,63)
(35,47)-(35,51)
(35,47)-(35,63)
(35,54)-(35,59)
(35,54)-(35,63)
(35,62)-(35,63)
(37,10)-(37,22)
(37,10)-(39,38)
(37,10)-(39,38)
(38,13)-(38,25)
(38,13)-(39,38)
(38,28)-(38,33)
(38,28)-(38,51)
(38,35)-(38,39)
(38,35)-(38,51)
(38,42)-(38,47)
(38,42)-(38,51)
(38,50)-(38,51)
(39,15)-(39,20)
(39,15)-(39,38)
(39,22)-(39,26)
(39,22)-(39,38)
(39,29)-(39,34)
(39,29)-(39,38)
(39,37)-(39,38)
*)
