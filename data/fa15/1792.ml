
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let r = rand (0, 2) in match r with | 0 -> buildY () | _ -> buildX ()
  else
    (let r = rand (0, 6) in
     match r with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
     | 3 -> buildTimes ((build (rand, (depth - 1))), (buildX ()))
     | 4 ->
         ((buildThresh
             ((build (rand, (depth - 1))), (buildX ()), (buildY ()))),
           (buildX ())));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSinCos e = SinCos e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let r = rand (0, 2) in match r with | 0 -> buildY () | _ -> buildX ()
  else
    (let r = rand (0, 6) in
     match r with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
     | 3 -> buildTimes ((build (rand, (depth - 1))), (buildX ()))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (buildX ()), (buildY ()),
             (buildX ()))
     | 5 -> buildSinCos (build (rand, (depth - 1))));;

*)

(* changed spans
(16,18)-(16,24)
(31,5)-(39,23)
(37,9)-(39,23)
(38,13)-(38,68)
*)

(* type error slice
(16,3)-(16,26)
(16,14)-(16,24)
(16,18)-(16,24)
(18,3)-(18,69)
(18,17)-(18,67)
(31,5)-(39,23)
(32,12)-(32,21)
(32,12)-(32,49)
(37,9)-(39,23)
(37,10)-(38,69)
(37,11)-(37,22)
(38,13)-(38,68)
*)

(* all spans
(12,18)-(12,43)
(12,27)-(12,43)
(12,36)-(12,38)
(12,40)-(12,42)
(14,16)-(14,28)
(14,20)-(14,28)
(14,27)-(14,28)
(16,14)-(16,24)
(16,18)-(16,24)
(16,23)-(16,24)
(18,17)-(18,67)
(18,38)-(18,67)
(18,46)-(18,47)
(18,49)-(18,50)
(18,52)-(18,58)
(18,60)-(18,66)
(20,16)-(20,39)
(20,25)-(20,39)
(20,32)-(20,34)
(20,36)-(20,38)
(22,11)-(22,20)
(22,16)-(22,20)
(24,11)-(24,20)
(24,16)-(24,20)
(26,15)-(39,24)
(27,2)-(39,24)
(27,5)-(27,14)
(27,5)-(27,10)
(27,13)-(27,14)
(28,7)-(28,76)
(28,15)-(28,26)
(28,15)-(28,19)
(28,20)-(28,26)
(28,21)-(28,22)
(28,24)-(28,25)
(28,30)-(28,76)
(28,36)-(28,37)
(28,50)-(28,59)
(28,50)-(28,56)
(28,57)-(28,59)
(28,67)-(28,76)
(28,67)-(28,73)
(28,74)-(28,76)
(30,4)-(39,24)
(30,13)-(30,24)
(30,13)-(30,17)
(30,18)-(30,24)
(30,19)-(30,20)
(30,22)-(30,23)
(31,5)-(39,23)
(31,11)-(31,12)
(32,12)-(32,49)
(32,12)-(32,21)
(32,22)-(32,49)
(32,23)-(32,28)
(32,29)-(32,48)
(32,30)-(32,34)
(32,36)-(32,47)
(32,37)-(32,42)
(32,45)-(32,46)
(33,12)-(33,51)
(33,12)-(33,23)
(33,24)-(33,51)
(33,25)-(33,30)
(33,31)-(33,50)
(33,32)-(33,36)
(33,38)-(33,49)
(33,39)-(33,44)
(33,47)-(33,48)
(34,12)-(34,67)
(34,12)-(34,24)
(34,25)-(34,67)
(34,26)-(34,53)
(34,27)-(34,32)
(34,33)-(34,52)
(34,34)-(34,38)
(34,40)-(34,51)
(34,41)-(34,46)
(34,49)-(34,50)
(34,55)-(34,66)
(34,56)-(34,62)
(34,63)-(34,65)
(35,12)-(35,65)
(35,12)-(35,22)
(35,23)-(35,65)
(35,24)-(35,51)
(35,25)-(35,30)
(35,31)-(35,50)
(35,32)-(35,36)
(35,38)-(35,49)
(35,39)-(35,44)
(35,47)-(35,48)
(35,53)-(35,64)
(35,54)-(35,60)
(35,61)-(35,63)
(37,9)-(39,23)
(37,10)-(38,69)
(37,11)-(37,22)
(38,13)-(38,68)
(38,14)-(38,41)
(38,15)-(38,20)
(38,21)-(38,40)
(38,22)-(38,26)
(38,28)-(38,39)
(38,29)-(38,34)
(38,37)-(38,38)
(38,43)-(38,54)
(38,44)-(38,50)
(38,51)-(38,53)
(38,56)-(38,67)
(38,57)-(38,63)
(38,64)-(38,66)
(39,11)-(39,22)
(39,12)-(39,18)
(39,19)-(39,21)
*)
