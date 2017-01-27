
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

let buildTimmy1 (e1,e2,e3) = Timmy1 (e1, e2);;

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
(33,18)-(33,44)
(33,30)-(33,44)
(33,38)-(33,40)
(33,42)-(33,44)
(35,27)-(35,41)
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
(33,4)-(33,47)
(33,18)-(33,44)
(33,30)-(33,44)
(33,38)-(33,40)
(33,42)-(33,44)
(44,15)-(44,19)
(44,15)-(44,25)
(44,21)-(44,22)
(44,21)-(44,25)
(44,24)-(44,25)
(46,22)-(46,27)
(46,22)-(46,45)
(46,29)-(46,33)
(46,29)-(46,45)
(46,36)-(46,45)
(69,18)-(69,29)
(69,18)-(71,50)
(70,22)-(70,27)
(70,22)-(70,49)
(70,22)-(71,50)
(70,29)-(70,33)
(70,29)-(70,49)
(70,36)-(70,49)
(71,23)-(71,28)
(71,23)-(71,50)
(71,30)-(71,34)
(71,30)-(71,50)
(71,37)-(71,50)
*)
