
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
(26,5)-(26,14)
(27,7)-(27,58)
(27,11)-(27,23)
(27,11)-(27,27)
(27,12)-(27,16)
(27,21)-(27,22)
(27,26)-(27,27)
(27,48)-(27,54)
(27,48)-(27,57)
(27,55)-(27,57)
(29,4)-(49,75)
(29,7)-(29,19)
(29,7)-(29,23)
(29,17)-(29,18)
(30,9)-(30,46)
(32,6)-(49,75)
(32,9)-(32,21)
(32,9)-(32,25)
(32,10)-(32,14)
(32,19)-(32,20)
(32,24)-(32,25)
(35,8)-(49,75)
(35,11)-(35,23)
(35,11)-(35,27)
(35,12)-(35,16)
(35,21)-(35,22)
(35,26)-(35,27)
(38,36)-(38,37)
(38,65)-(38,66)
(40,10)-(49,75)
(40,13)-(40,25)
(40,13)-(40,29)
(40,14)-(40,18)
(40,23)-(40,24)
(40,28)-(40,29)
(43,38)-(43,39)
(43,67)-(43,68)
(45,12)-(49,75)
(45,15)-(45,27)
(45,15)-(45,31)
(45,16)-(45,20)
(45,25)-(45,26)
(45,30)-(45,31)
*)

(* type error slice
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(45,12)-(49,75)
(45,12)-(49,75)
(45,12)-(49,75)
(47,14)-(47,25)
(47,14)-(49,75)
*)
