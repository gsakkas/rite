
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Magic of expr
  | Weird of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildMagic e1 = Magic e1;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildWeird (e1,e2,e3,e4) = Weird (e1, e2, e3);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then buildX ()
  else
    (match rand (1, 10) with
     | 1 -> buildSine (build (rand, (depth - 1)))
     | 2 -> buildCosine (build (rand, (depth - 1)))
     | 3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 -> buildX ()
     | 7 -> buildY ()
     | 8 -> buildMagic (build (rand, (depth - 1)))
     | 9 ->
         buildWeird
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | _ -> buildX ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Magic of expr
  | Weird of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildMagic e1 = Magic e1;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildWeird (e1,e2,e3) = Weird (e1, e2, e3);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then buildX ()
  else
    (match rand (1, 10) with
     | 1 -> buildSine (build (rand, (depth - 1)))
     | 2 -> buildCosine (build (rand, (depth - 1)))
     | 3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 -> buildX ()
     | 7 -> buildY ()
     | 8 -> buildMagic (build (rand, (depth - 1)))
     | 9 ->
         buildWeird
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | _ -> buildX ());;

*)

(* changed spans
(25,17)-(25,49)
(40,14)-(40,37)
(40,43)-(40,66)
(43,14)-(43,37)
(43,43)-(43,66)
*)

(* type error slice
(25,4)-(25,52)
(25,17)-(25,49)
(25,32)-(25,49)
(25,39)-(25,41)
(25,43)-(25,45)
(25,47)-(25,49)
(35,12)-(35,16)
(35,12)-(35,23)
(35,18)-(35,19)
(35,18)-(35,23)
(35,21)-(35,23)
(36,24)-(36,29)
(36,24)-(36,47)
(36,31)-(36,35)
(36,31)-(36,47)
(36,38)-(36,47)
(52,10)-(52,20)
(52,10)-(54,38)
(53,14)-(53,19)
(53,14)-(53,37)
(53,14)-(54,38)
(53,21)-(53,25)
(53,21)-(53,37)
(53,28)-(53,37)
(53,43)-(53,48)
(53,43)-(53,66)
(53,50)-(53,54)
(53,50)-(53,66)
(53,57)-(53,66)
(54,15)-(54,20)
(54,15)-(54,38)
(54,22)-(54,26)
(54,22)-(54,38)
(54,29)-(54,38)
*)
