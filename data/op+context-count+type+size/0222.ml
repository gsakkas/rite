
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
  then (if (rand (0, 2)) < 1 then buildX () else buildY ())
  else
    (let x = rand (0, 5) in
     if x = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if x = 1
       then buildCosine (build (rand, (depth - 1)))
       else
         if x = 2
         then
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
         else
           if x = 3
           then
             buildTimes
               ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
           else
             if x = 4
             then
               buildThresh
                 ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                   (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


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
  then (if (rand (0, 2)) < 1 then buildX () else buildY ())
  else
    (let x = rand (0, 5) in
     match x with
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
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(30,6)-(50,73)
(30,9)-(30,14)
(30,13)-(30,14)
(33,8)-(50,73)
(33,11)-(33,12)
(33,11)-(33,16)
(33,15)-(33,16)
(36,10)-(50,73)
(36,13)-(36,14)
(36,13)-(36,18)
(36,17)-(36,18)
(39,16)-(39,39)
(39,45)-(39,68)
(41,12)-(50,73)
(41,15)-(41,16)
(41,15)-(41,20)
(41,19)-(41,20)
(44,18)-(44,41)
(44,47)-(44,70)
(46,14)-(50,73)
(46,17)-(46,18)
(46,17)-(46,22)
(46,21)-(46,22)
(50,21)-(50,44)
(50,50)-(50,73)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,28)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,47)-(17,48)
(17,50)-(17,51)
(17,53)-(17,59)
(17,61)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(19,33)-(19,35)
(19,37)-(19,39)
(21,4)-(21,23)
(21,12)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(25,16)-(50,73)
(26,3)-(50,73)
(26,6)-(26,11)
(26,6)-(26,15)
(27,9)-(27,59)
(27,9)-(27,59)
(27,13)-(27,17)
(27,13)-(27,23)
(27,13)-(27,29)
(27,35)-(27,41)
(27,35)-(27,44)
(27,50)-(27,56)
(27,50)-(27,59)
(30,6)-(50,73)
(31,11)-(31,20)
(31,11)-(31,45)
(31,22)-(31,27)
(31,22)-(31,45)
(33,8)-(50,73)
(34,13)-(34,24)
(34,13)-(34,49)
(36,10)-(50,73)
(38,12)-(38,24)
(38,12)-(39,68)
(41,12)-(50,73)
(43,14)-(43,24)
(43,14)-(44,70)
(46,14)-(50,73)
(48,16)-(48,27)
(48,16)-(50,73)
*)
