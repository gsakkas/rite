
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
  | Timmy1 of expr* expr
  | Timmy2 of expr* expr* expr;;

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
                   ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                     (build (rand, (depth - 1)))))
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
  | Timmy1 of expr* expr
  | Timmy2 of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildTimmy1 (e1,e2) = Timmy1 (e1, e2);;

let buildTimmy2 (e1,e2,e3) = Timmy2 (e1, e2, e3);;

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
                   ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                     (build (rand, (depth - 1)))))
  else
    (let rnd = rand (0, 2) in
     if (rnd mod 2) = 0 then buildX () else buildY ());;

*)

(* changed spans
(36,18)-(36,41)
(36,27)-(36,41)
(36,35)-(36,37)
(38,12)-(38,21)
(55,16)-(55,39)
(55,45)-(55,68)
(60,18)-(60,41)
(60,47)-(60,70)
(71,22)-(71,49)
(71,36)-(71,41)
(71,44)-(71,49)
(72,23)-(72,50)
(72,37)-(72,42)
(72,45)-(72,50)
*)

(* type error slice
(36,4)-(36,44)
(36,18)-(36,41)
(36,27)-(36,41)
(36,35)-(36,37)
(36,39)-(36,41)
(45,15)-(45,19)
(45,15)-(45,25)
(45,21)-(45,22)
(45,21)-(45,25)
(45,24)-(45,25)
(47,22)-(47,27)
(47,22)-(47,45)
(47,29)-(47,33)
(47,29)-(47,45)
(47,36)-(47,45)
(74,18)-(74,29)
(74,18)-(76,46)
(75,22)-(75,27)
(75,22)-(75,45)
(75,22)-(76,46)
(75,29)-(75,33)
(75,29)-(75,45)
(75,36)-(75,45)
(75,51)-(75,56)
(75,51)-(75,74)
(75,58)-(75,62)
(75,58)-(75,74)
(75,65)-(75,74)
(76,23)-(76,28)
(76,23)-(76,46)
(76,30)-(76,34)
(76,30)-(76,46)
(76,37)-(76,46)
*)
