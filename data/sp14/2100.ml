
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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        (if depth = 0
         then buildX ()
         else
           ((build (rand, (depth - 1))),
             (if depth = 0 then buildY () else build (rand, (depth - 1)))))
  | 6 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
  | 7 ->
      buildThresh
        ((build (rand, depth)), (build (rand, depth)), (build (rand, depth)),
          (build (rand, depth)));;


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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
  | 7 ->
      buildThresh
        ((build (rand, depth)), (build (rand, depth)), (build (rand, depth)),
          (build (rand, depth)));;

*)

(* changed spans
(36,8)-(40,75)
(39,11)-(40,74)
*)

(* type error slice
(30,16)-(30,76)
(30,35)-(30,41)
(30,35)-(30,44)
(30,50)-(30,55)
(30,50)-(30,75)
(36,8)-(40,75)
(37,14)-(37,20)
(37,14)-(37,23)
(39,11)-(40,74)
(40,13)-(40,73)
(40,47)-(40,52)
(40,47)-(40,72)
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
(25,15)-(45,32)
(26,2)-(45,32)
(26,8)-(26,19)
(26,8)-(26,12)
(26,13)-(26,19)
(26,14)-(26,15)
(26,17)-(26,18)
(27,9)-(27,18)
(27,9)-(27,15)
(27,16)-(27,18)
(28,9)-(28,18)
(28,9)-(28,15)
(28,16)-(28,18)
(30,6)-(30,76)
(30,6)-(30,15)
(30,16)-(30,76)
(30,20)-(30,29)
(30,20)-(30,25)
(30,28)-(30,29)
(30,35)-(30,44)
(30,35)-(30,41)
(30,42)-(30,44)
(30,50)-(30,75)
(30,50)-(30,55)
(30,56)-(30,75)
(30,57)-(30,61)
(30,63)-(30,74)
(30,64)-(30,69)
(30,72)-(30,73)
(32,6)-(33,68)
(32,6)-(32,17)
(33,8)-(33,68)
(33,12)-(33,21)
(33,12)-(33,17)
(33,20)-(33,21)
(33,27)-(33,36)
(33,27)-(33,33)
(33,34)-(33,36)
(33,42)-(33,67)
(33,42)-(33,47)
(33,48)-(33,67)
(33,49)-(33,53)
(33,55)-(33,66)
(33,56)-(33,61)
(33,64)-(33,65)
(35,6)-(40,75)
(35,6)-(35,18)
(36,8)-(40,75)
(36,12)-(36,21)
(36,12)-(36,17)
(36,20)-(36,21)
(37,14)-(37,23)
(37,14)-(37,20)
(37,21)-(37,23)
(39,11)-(40,74)
(39,12)-(39,39)
(39,13)-(39,18)
(39,19)-(39,38)
(39,20)-(39,24)
(39,26)-(39,37)
(39,27)-(39,32)
(39,35)-(39,36)
(40,13)-(40,73)
(40,17)-(40,26)
(40,17)-(40,22)
(40,25)-(40,26)
(40,32)-(40,41)
(40,32)-(40,38)
(40,39)-(40,41)
(40,47)-(40,72)
(40,47)-(40,52)
(40,53)-(40,72)
(40,54)-(40,58)
(40,60)-(40,71)
(40,61)-(40,66)
(40,69)-(40,70)
(41,9)-(41,66)
(41,9)-(41,19)
(41,20)-(41,66)
(41,21)-(41,42)
(41,22)-(41,27)
(41,28)-(41,41)
(41,29)-(41,33)
(41,35)-(41,40)
(41,44)-(41,65)
(41,45)-(41,50)
(41,51)-(41,64)
(41,52)-(41,56)
(41,58)-(41,63)
(43,6)-(45,32)
(43,6)-(43,17)
(44,8)-(45,32)
(44,9)-(44,30)
(44,10)-(44,15)
(44,16)-(44,29)
(44,17)-(44,21)
(44,23)-(44,28)
(44,32)-(44,53)
(44,33)-(44,38)
(44,39)-(44,52)
(44,40)-(44,44)
(44,46)-(44,51)
(44,55)-(44,76)
(44,56)-(44,61)
(44,62)-(44,75)
(44,63)-(44,67)
(44,69)-(44,74)
(45,10)-(45,31)
(45,11)-(45,16)
(45,17)-(45,30)
(45,18)-(45,22)
(45,24)-(45,29)
*)
