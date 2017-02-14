
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
        then buildAverage (build (rand, (depth - 1)))
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
(27,4)-(39,76)
(27,7)-(27,19)
(27,7)-(27,23)
(27,17)-(27,18)
(28,9)-(28,46)
(30,6)-(39,76)
(30,9)-(30,21)
(30,9)-(30,25)
(30,10)-(30,14)
(30,19)-(30,20)
(30,24)-(30,25)
(33,8)-(39,76)
(33,11)-(33,23)
(33,11)-(33,27)
(33,12)-(33,16)
(33,21)-(33,22)
(33,26)-(33,27)
(34,26)-(34,53)
(34,49)-(34,50)
(36,10)-(39,76)
(36,13)-(36,25)
(36,13)-(36,29)
(36,14)-(36,18)
(36,23)-(36,24)
(36,28)-(36,29)
(37,15)-(37,27)
(37,15)-(37,55)
(37,28)-(37,55)
(37,51)-(37,52)
(39,12)-(39,76)
(39,15)-(39,27)
(39,15)-(39,31)
(39,16)-(39,20)
(39,25)-(39,26)
(39,30)-(39,31)
(39,37)-(39,76)
(39,49)-(39,76)
(39,72)-(39,73)
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
(34,13)-(34,25)
(34,13)-(34,53)
(34,26)-(34,53)
(34,27)-(34,32)
(37,15)-(37,27)
(37,15)-(37,55)
(37,28)-(37,55)
(37,29)-(37,34)
(39,12)-(39,76)
(39,12)-(39,76)
(39,12)-(39,76)
(39,37)-(39,48)
(39,37)-(39,76)
(39,49)-(39,76)
(39,50)-(39,55)
*)
