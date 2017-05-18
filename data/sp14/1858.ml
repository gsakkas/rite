
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
(17,16)-(17,39)
(37,9)-(37,21)
(38,11)-(39,41)
(38,12)-(38,24)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(37,9)-(37,21)
(37,9)-(39,41)
(38,11)-(39,41)
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
(17,16)-(17,39)
(17,25)-(17,39)
(17,32)-(17,34)
(17,36)-(17,38)
(19,11)-(19,20)
(19,16)-(19,20)
(21,11)-(21,20)
(21,16)-(21,20)
(23,15)-(39,42)
(24,2)-(39,42)
(24,5)-(24,15)
(24,5)-(24,10)
(24,14)-(24,15)
(26,4)-(27,51)
(26,19)-(26,30)
(26,19)-(26,23)
(26,24)-(26,30)
(26,25)-(26,26)
(26,28)-(26,29)
(27,4)-(27,51)
(27,8)-(27,20)
(27,8)-(27,16)
(27,19)-(27,20)
(27,26)-(27,35)
(27,26)-(27,32)
(27,33)-(27,35)
(27,41)-(27,50)
(27,41)-(27,47)
(27,48)-(27,50)
(29,4)-(39,42)
(29,20)-(29,31)
(29,20)-(29,24)
(29,25)-(29,31)
(29,26)-(29,27)
(29,29)-(29,30)
(30,5)-(39,41)
(30,24)-(30,49)
(30,24)-(30,29)
(30,30)-(30,49)
(30,31)-(30,35)
(30,37)-(30,48)
(30,38)-(30,43)
(30,46)-(30,47)
(31,5)-(39,41)
(31,11)-(31,19)
(32,12)-(32,34)
(32,12)-(32,21)
(32,22)-(32,34)
(33,12)-(33,36)
(33,12)-(33,23)
(33,24)-(33,36)
(34,12)-(34,68)
(34,12)-(34,24)
(34,25)-(34,68)
(34,26)-(34,38)
(34,40)-(34,67)
(34,41)-(34,46)
(34,47)-(34,66)
(34,48)-(34,52)
(34,54)-(34,65)
(34,55)-(34,60)
(34,63)-(34,64)
(35,12)-(35,66)
(35,12)-(35,22)
(35,23)-(35,66)
(35,24)-(35,36)
(35,38)-(35,65)
(35,39)-(35,44)
(35,45)-(35,64)
(35,46)-(35,50)
(35,52)-(35,63)
(35,53)-(35,58)
(35,61)-(35,62)
(37,9)-(39,41)
(37,9)-(37,21)
(38,11)-(39,41)
(38,12)-(38,24)
(38,26)-(38,53)
(38,27)-(38,32)
(38,33)-(38,52)
(38,34)-(38,38)
(38,40)-(38,51)
(38,41)-(38,46)
(38,49)-(38,50)
(39,13)-(39,40)
(39,14)-(39,19)
(39,20)-(39,39)
(39,21)-(39,25)
(39,27)-(39,38)
(39,28)-(39,33)
(39,36)-(39,37)
*)
