
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
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | depth ->
      (match rand with
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
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | depth ->
      (match rand (0, 4) with
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
(29,13)-(29,17)
(30,14)-(30,51)
*)

(* type error slice
(27,12)-(27,25)
(27,13)-(27,17)
(29,6)-(41,73)
(29,13)-(29,17)
*)

(* all spans
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(11,40)-(11,42)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,17)-(17,67)
(17,38)-(17,67)
(17,46)-(17,47)
(17,49)-(17,50)
(17,52)-(17,58)
(17,60)-(17,66)
(19,16)-(19,39)
(19,25)-(19,39)
(19,32)-(19,34)
(19,36)-(19,38)
(21,11)-(21,20)
(21,16)-(21,20)
(23,11)-(23,20)
(23,16)-(23,20)
(25,15)-(41,73)
(26,2)-(41,73)
(26,8)-(26,13)
(27,9)-(27,59)
(27,12)-(27,29)
(27,12)-(27,25)
(27,13)-(27,17)
(27,18)-(27,24)
(27,19)-(27,20)
(27,22)-(27,23)
(27,28)-(27,29)
(27,35)-(27,44)
(27,35)-(27,41)
(27,42)-(27,44)
(27,50)-(27,59)
(27,50)-(27,56)
(27,57)-(27,59)
(29,6)-(41,73)
(29,13)-(29,17)
(30,14)-(30,51)
(30,14)-(30,23)
(30,24)-(30,51)
(30,25)-(30,30)
(30,31)-(30,50)
(30,32)-(30,36)
(30,38)-(30,49)
(30,39)-(30,44)
(30,47)-(30,48)
(31,14)-(31,53)
(31,14)-(31,25)
(31,26)-(31,53)
(31,27)-(31,32)
(31,33)-(31,52)
(31,34)-(31,38)
(31,40)-(31,51)
(31,41)-(31,46)
(31,49)-(31,50)
(33,11)-(34,71)
(33,11)-(33,23)
(34,13)-(34,71)
(34,14)-(34,41)
(34,15)-(34,20)
(34,21)-(34,40)
(34,22)-(34,26)
(34,28)-(34,39)
(34,29)-(34,34)
(34,37)-(34,38)
(34,43)-(34,70)
(34,44)-(34,49)
(34,50)-(34,69)
(34,51)-(34,55)
(34,57)-(34,68)
(34,58)-(34,63)
(34,66)-(34,67)
(36,11)-(37,71)
(36,11)-(36,21)
(37,13)-(37,71)
(37,14)-(37,41)
(37,15)-(37,20)
(37,21)-(37,40)
(37,22)-(37,26)
(37,28)-(37,39)
(37,29)-(37,34)
(37,37)-(37,38)
(37,43)-(37,70)
(37,44)-(37,49)
(37,50)-(37,69)
(37,51)-(37,55)
(37,57)-(37,68)
(37,58)-(37,63)
(37,66)-(37,67)
(39,11)-(41,72)
(39,11)-(39,22)
(40,13)-(41,72)
(40,14)-(40,41)
(40,15)-(40,20)
(40,21)-(40,40)
(40,22)-(40,26)
(40,28)-(40,39)
(40,29)-(40,34)
(40,37)-(40,38)
(40,43)-(40,70)
(40,44)-(40,49)
(40,50)-(40,69)
(40,51)-(40,55)
(40,57)-(40,68)
(40,58)-(40,63)
(40,66)-(40,67)
(41,15)-(41,42)
(41,16)-(41,21)
(41,22)-(41,41)
(41,23)-(41,27)
(41,29)-(41,40)
(41,30)-(41,35)
(41,38)-(41,39)
(41,44)-(41,71)
(41,45)-(41,50)
(41,51)-(41,70)
(41,52)-(41,56)
(41,58)-(41,69)
(41,59)-(41,64)
(41,67)-(41,68)
*)
