
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr* expr
  | Timmy2 of expr* expr;;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildTimmy1 (e1,e2) = Timmy1 (e1, e2);;

let buildTimmy2 (e1,e2) = Timmy2 (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    let rnd = rand (0, 6) in
    (if (rnd mod 7) = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if (rnd mod 7) = 1
       then buildCosine (build (rand, (depth - 1)))
       else
         if (rnd mod 7) = 2
         then
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
         else
           if (rnd mod 7) = 3
           then
             buildTimes
               ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
           else
             if (rnd mod 7) = 4
             then
               buildThresh
                 ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                   (build (rand, (depth - 1))), (build (rand, (depth - 1))))
             else
               if (rnd mod 7) = 5
               then
                 buildTimmy1
                   ((build (rand, (depth - depth))),
                     (build (rand, (depth - depth))))
               else
                 buildTimmy2
                   ((build (rand, (depth - 1))), (build (rand, (depth - 1)))))
  else
    (let rnd = rand (0, 2) in
     if (rnd mod 2) = 0 then buildX () else buildY ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildTimmy1 (e1,e2) = Timmy1 (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    let rnd = rand (0, 6) in
    (if (rnd mod 7) = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if (rnd mod 7) = 1
       then buildCosine (build (rand, (depth - 1)))
       else
         if (rnd mod 7) = 2
         then
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
         else
           if (rnd mod 7) = 3
           then
             buildTimes
               ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
           else
             if (rnd mod 7) = 4
             then
               buildThresh
                 ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                   (build (rand, (depth - 1))), (build (rand, (depth - 1))))
             else
               buildTimmy1
                 ((build (rand, (depth - depth))),
                   (build (rand, (depth - depth)))))
  else
    (let rnd = rand (0, 2) in
     if (rnd mod 2) = 0 then buildX () else buildY ());;

*)

(* changed spans
(35,18)-(35,41)
(35,27)-(35,41)
(35,35)-(35,37)
(35,39)-(35,41)
(54,16)-(54,39)
(54,45)-(54,68)
(59,18)-(59,41)
(59,47)-(59,70)
(67,16)-(74,74)
(67,20)-(67,23)
(67,20)-(67,29)
(67,20)-(67,34)
(67,28)-(67,29)
(67,33)-(67,34)
(70,22)-(70,49)
(70,36)-(70,41)
(70,44)-(70,49)
(71,23)-(71,50)
(71,37)-(71,42)
(71,45)-(71,50)
(73,18)-(73,29)
(73,18)-(74,74)
(74,22)-(74,27)
(74,22)-(74,45)
(74,29)-(74,33)
(74,29)-(74,45)
(74,36)-(74,41)
(74,36)-(74,45)
(74,44)-(74,45)
(74,51)-(74,74)
(76,6)-(77,54)
*)

(* type error slice
(23,4)-(23,46)
(23,19)-(23,43)
(23,37)-(23,39)
(23,41)-(23,43)
(25,4)-(25,31)
(25,17)-(25,29)
(25,28)-(25,29)
(27,4)-(27,27)
(27,15)-(27,25)
(27,24)-(27,25)
(29,4)-(29,70)
(29,18)-(29,67)
(29,47)-(29,48)
(29,50)-(29,51)
(29,53)-(29,59)
(29,61)-(29,67)
(31,4)-(31,42)
(31,17)-(31,39)
(31,33)-(31,35)
(31,37)-(31,39)
(33,4)-(33,44)
(33,18)-(33,41)
(33,35)-(33,37)
(33,39)-(33,41)
(35,4)-(35,44)
(35,18)-(35,41)
(35,35)-(35,37)
(35,39)-(35,41)
(37,4)-(37,23)
(37,12)-(37,21)
(39,4)-(39,23)
(39,12)-(39,21)
(41,16)-(77,54)
(42,3)-(77,54)
(42,3)-(77,54)
(42,6)-(42,11)
(42,6)-(42,15)
(44,5)-(74,74)
(44,5)-(74,74)
(44,15)-(44,19)
(44,15)-(44,25)
(45,6)-(74,74)
(45,6)-(74,74)
(45,10)-(45,13)
(46,11)-(46,20)
(46,11)-(46,45)
(46,22)-(46,27)
(46,22)-(46,45)
(48,8)-(74,74)
(48,8)-(74,74)
(49,13)-(49,24)
(49,13)-(49,49)
(51,10)-(74,74)
(51,10)-(74,74)
(53,12)-(53,24)
(53,12)-(54,68)
(56,12)-(74,74)
(56,12)-(74,74)
(58,14)-(58,24)
(58,14)-(59,70)
(61,14)-(74,74)
(61,14)-(74,74)
(63,16)-(63,27)
(63,16)-(65,73)
(67,16)-(74,74)
(67,16)-(74,74)
(69,18)-(69,29)
(69,18)-(71,50)
(73,18)-(73,29)
(73,18)-(74,74)
(76,6)-(77,54)
(77,6)-(77,54)
(77,6)-(77,54)
(77,30)-(77,36)
(77,30)-(77,39)
(77,45)-(77,51)
(77,45)-(77,54)
*)
