
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
     then buildSine buildX
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
(27,34)-(27,40)
(27,46)-(27,52)
(29,4)-(50,77)
(30,5)-(50,76)
(30,8)-(30,13)
(30,12)-(30,13)
(31,20)-(31,26)
(33,7)-(50,76)
(33,10)-(33,11)
(33,10)-(33,15)
(33,14)-(33,15)
(36,9)-(50,76)
(36,12)-(36,13)
(36,12)-(36,17)
(36,16)-(36,17)
(41,11)-(50,76)
(41,14)-(41,15)
(41,14)-(41,19)
(41,18)-(41,19)
(46,13)-(50,76)
(46,16)-(46,17)
(46,16)-(46,21)
(46,20)-(46,21)
(50,55)-(50,74)
*)

(* type error slice
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(21,3)-(21,22)
(21,11)-(21,20)
(25,3)-(50,79)
(25,15)-(50,77)
(26,2)-(50,77)
(26,2)-(50,77)
(27,7)-(27,53)
(27,34)-(27,40)
(29,4)-(50,77)
(30,5)-(50,76)
(31,10)-(31,19)
(31,10)-(31,26)
(31,20)-(31,26)
(34,12)-(34,23)
(34,12)-(34,51)
(34,24)-(34,51)
(34,25)-(34,30)
(46,13)-(50,76)
(46,13)-(50,76)
(46,13)-(50,76)
(48,15)-(48,26)
(48,15)-(50,76)
*)
