
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
  then (if (rand (0, 2)) < 1 then buildX else buildY)
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
(27,35)-(27,41)
(27,47)-(27,53)
(29,6)-(50,73)
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
(41,12)-(50,73)
(41,15)-(41,16)
(41,15)-(41,20)
(41,19)-(41,20)
(46,14)-(50,73)
(46,17)-(46,18)
(46,17)-(46,22)
(46,21)-(46,22)
(50,50)-(50,73)
*)

(* type error slice
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(21,4)-(21,23)
(21,12)-(21,21)
(25,4)-(50,80)
(25,16)-(50,73)
(26,3)-(50,73)
(26,3)-(50,73)
(27,9)-(27,53)
(27,35)-(27,41)
(29,6)-(50,73)
(30,6)-(50,73)
(31,11)-(31,20)
(31,11)-(31,45)
(31,22)-(31,27)
(31,22)-(31,45)
(46,14)-(50,73)
(46,14)-(50,73)
(46,14)-(50,73)
(48,16)-(48,27)
(48,16)-(50,73)
*)
