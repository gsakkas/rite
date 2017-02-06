
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
  then (if (rand mod 2) = 0 then buildX () else buildY ())
  else
    if (rand mod 5) = 0
    then buildSine (build (rand, (depth - 1)))
    else
      if (rand mod 5) = 1
      then buildCosine (build (rand, (depth - 1)))
      else
        if (rand mod 5) = 2
        then
          buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
        else
          if (rand mod 5) = 3
          then
            buildTimes
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
          else
            if (rand mod 5) = 4
            then
              buildThresh
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                  (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


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
  then buildX ()
  else
    (match rand (0, 4) with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 4))), (build (rand, (depth - 4))),
             (build (rand, (depth - 4))), (build (rand, (depth - 4))))
     | _ -> buildY ());;

*)

(* changed spans
(26,6)-(26,15)
(27,9)-(27,58)
(27,13)-(27,17)
(27,13)-(27,23)
(27,13)-(27,28)
(27,22)-(27,23)
(27,27)-(27,28)
(27,49)-(27,55)
(27,49)-(27,58)
(27,56)-(27,58)
(29,5)-(49,72)
(29,9)-(29,19)
(29,9)-(29,24)
(29,18)-(29,19)
(30,10)-(30,44)
(32,7)-(49,72)
(32,11)-(32,15)
(32,11)-(32,21)
(32,11)-(32,26)
(32,20)-(32,21)
(32,25)-(32,26)
(35,9)-(49,72)
(35,13)-(35,17)
(35,13)-(35,23)
(35,13)-(35,28)
(35,22)-(35,23)
(35,27)-(35,28)
(38,37)-(38,38)
(38,66)-(38,67)
(40,11)-(49,72)
(40,15)-(40,19)
(40,15)-(40,25)
(40,15)-(40,30)
(40,24)-(40,25)
(40,29)-(40,30)
(43,39)-(43,40)
(43,68)-(43,69)
(45,13)-(49,72)
(45,17)-(45,21)
(45,17)-(45,27)
(45,17)-(45,32)
(45,26)-(45,27)
(45,31)-(45,32)
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
(25,16)-(49,72)
(26,3)-(49,72)
(26,6)-(26,11)
(26,6)-(26,15)
(27,9)-(27,58)
(27,9)-(27,58)
(27,13)-(27,17)
(27,34)-(27,40)
(27,34)-(27,43)
(27,49)-(27,55)
(27,49)-(27,58)
(29,5)-(49,72)
(30,10)-(30,19)
(30,10)-(30,44)
(30,21)-(30,26)
(30,21)-(30,44)
(32,7)-(49,72)
(33,12)-(33,23)
(33,12)-(33,48)
(35,9)-(49,72)
(37,11)-(37,23)
(37,11)-(38,67)
(40,11)-(49,72)
(42,13)-(42,23)
(42,13)-(43,69)
(45,13)-(49,72)
(47,15)-(47,26)
(47,15)-(49,72)
*)
