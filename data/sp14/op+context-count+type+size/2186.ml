
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
(19,12)-(19,21)
(24,6)-(24,15)
(25,9)-(25,58)
(25,13)-(25,17)
(25,13)-(25,23)
(25,13)-(25,28)
(25,22)-(25,23)
(25,27)-(25,28)
(25,49)-(25,55)
(25,49)-(25,58)
(25,56)-(25,58)
(27,5)-(41,74)
(27,9)-(27,19)
(27,9)-(27,24)
(27,18)-(27,19)
(28,10)-(28,44)
(30,7)-(41,74)
(30,11)-(30,15)
(30,11)-(30,21)
(30,11)-(30,26)
(30,20)-(30,21)
(30,25)-(30,26)
(33,9)-(41,74)
(33,13)-(33,17)
(33,13)-(33,23)
(33,13)-(33,28)
(33,22)-(33,23)
(33,27)-(33,28)
(36,37)-(36,38)
(36,66)-(36,67)
(38,11)-(41,74)
(38,15)-(38,19)
(38,15)-(38,25)
(38,15)-(38,30)
(38,24)-(38,25)
(38,29)-(38,30)
(39,16)-(39,28)
(39,16)-(39,53)
(39,30)-(39,35)
(39,30)-(39,53)
(39,52)-(39,53)
(41,13)-(41,74)
(41,17)-(41,21)
(41,17)-(41,27)
(41,17)-(41,32)
(41,26)-(41,27)
(41,31)-(41,32)
(41,38)-(41,49)
(41,51)-(41,74)
(41,73)-(41,74)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(28,10)-(28,19)
(28,10)-(28,44)
(28,21)-(28,26)
(28,21)-(28,44)
(39,16)-(39,28)
(39,16)-(39,53)
(39,30)-(39,35)
(39,30)-(39,53)
(41,13)-(41,74)
(41,13)-(41,74)
(41,13)-(41,74)
(41,38)-(41,49)
(41,38)-(41,74)
(41,51)-(41,56)
(41,51)-(41,74)
*)
