
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
          then buildAverage (build (rand, (depth - 1)))
          else
            if (rand mod 5) = 4 then buildThresh (build (rand, (depth - 1)));;


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
(19,11)-(19,20)
(24,5)-(24,14)
(25,7)-(25,58)
(25,11)-(25,23)
(25,11)-(25,27)
(25,12)-(25,16)
(25,21)-(25,22)
(25,26)-(25,27)
(25,48)-(25,54)
(25,48)-(25,57)
(25,55)-(25,57)
(27,4)-(41,76)
(27,7)-(27,19)
(27,7)-(27,23)
(27,17)-(27,18)
(28,9)-(28,46)
(30,6)-(41,76)
(30,9)-(30,21)
(30,9)-(30,25)
(30,10)-(30,14)
(30,19)-(30,20)
(30,24)-(30,25)
(33,8)-(41,76)
(33,11)-(33,23)
(33,11)-(33,27)
(33,12)-(33,16)
(33,21)-(33,22)
(33,26)-(33,27)
(36,36)-(36,37)
(36,65)-(36,66)
(38,10)-(41,76)
(38,13)-(38,25)
(38,13)-(38,29)
(38,14)-(38,18)
(38,23)-(38,24)
(38,28)-(38,29)
(39,15)-(39,27)
(39,15)-(39,55)
(39,28)-(39,55)
(39,29)-(39,34)
(39,51)-(39,52)
(41,12)-(41,76)
(41,15)-(41,27)
(41,15)-(41,31)
(41,16)-(41,20)
(41,25)-(41,26)
(41,30)-(41,31)
(41,37)-(41,48)
(41,49)-(41,76)
(41,72)-(41,73)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(28,9)-(28,18)
(28,9)-(28,46)
(28,19)-(28,46)
(28,20)-(28,25)
(39,15)-(39,27)
(39,15)-(39,55)
(39,28)-(39,55)
(39,29)-(39,34)
(41,12)-(41,76)
(41,12)-(41,76)
(41,12)-(41,76)
(41,37)-(41,48)
(41,37)-(41,76)
(41,49)-(41,76)
(41,50)-(41,55)
*)
