
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
               ((build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


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
(17,17)-(17,39)
(28,6)-(42,70)
(28,9)-(28,14)
(28,13)-(28,14)
(31,8)-(42,70)
(31,11)-(31,12)
(31,11)-(31,16)
(31,15)-(31,16)
(34,10)-(42,70)
(34,13)-(34,14)
(34,13)-(34,18)
(34,17)-(34,18)
(37,16)-(37,39)
(37,45)-(37,68)
(39,12)-(42,70)
(39,15)-(39,16)
(39,15)-(39,20)
(39,19)-(39,20)
(41,14)-(41,24)
(41,14)-(42,70)
(42,18)-(42,41)
(42,47)-(42,52)
*)

(* type error slice
(17,4)-(17,42)
(17,17)-(17,39)
(17,26)-(17,39)
(17,33)-(17,35)
(17,37)-(17,39)
(25,13)-(25,17)
(25,13)-(25,23)
(25,19)-(25,20)
(25,19)-(25,23)
(25,22)-(25,23)
(29,22)-(29,27)
(29,22)-(29,45)
(29,29)-(29,33)
(29,29)-(29,45)
(29,36)-(29,45)
(39,12)-(42,70)
(41,14)-(41,24)
(41,14)-(42,70)
(42,18)-(42,23)
(42,18)-(42,41)
(42,18)-(42,70)
(42,25)-(42,29)
(42,25)-(42,41)
(42,32)-(42,41)
(42,47)-(42,52)
(42,47)-(42,70)
(42,54)-(42,58)
(42,54)-(42,70)
(42,61)-(42,70)
*)
