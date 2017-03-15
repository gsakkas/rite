
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
  if depth > 0
  then
    let depth = depth - 1 in
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, depth))
    | 1 -> buildCosine (build (rand, depth))
    | 2 -> buildAverage ((build (rand, depth)), (build (rand, depth)))
    | 3 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
    | 4 ->
        buildThresh
          ((build (rand, depth)), (build (rand, depth)),
            (build (rand, depth)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;


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
  if depth > 0
  then
    let depth = depth - 1 in
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, depth))
    | 1 -> buildCosine (build (rand, depth))
    | 2 -> buildAverage ((build (rand, depth)), (build (rand, depth)))
    | 3 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
    | 4 ->
        buildThresh
          ((build (rand, depth)), (build (rand, depth)),
            (build (rand, depth)), (build (rand, depth)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(36,10)-(37,34)
(38,7)-(38,65)
*)

(* type error slice
(17,3)-(17,69)
(17,17)-(17,67)
(35,8)-(35,19)
(35,8)-(37,34)
(36,10)-(37,34)
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
(25,15)-(38,65)
(26,2)-(38,65)
(26,5)-(26,14)
(26,5)-(26,10)
(26,13)-(26,14)
(28,4)-(37,34)
(28,16)-(28,25)
(28,16)-(28,21)
(28,24)-(28,25)
(29,4)-(37,34)
(29,10)-(29,21)
(29,10)-(29,14)
(29,15)-(29,21)
(29,16)-(29,17)
(29,19)-(29,20)
(30,11)-(30,42)
(30,11)-(30,20)
(30,21)-(30,42)
(30,22)-(30,27)
(30,28)-(30,41)
(30,29)-(30,33)
(30,35)-(30,40)
(31,11)-(31,44)
(31,11)-(31,22)
(31,23)-(31,44)
(31,24)-(31,29)
(31,30)-(31,43)
(31,31)-(31,35)
(31,37)-(31,42)
(32,11)-(32,70)
(32,11)-(32,23)
(32,24)-(32,70)
(32,25)-(32,46)
(32,26)-(32,31)
(32,32)-(32,45)
(32,33)-(32,37)
(32,39)-(32,44)
(32,48)-(32,69)
(32,49)-(32,54)
(32,55)-(32,68)
(32,56)-(32,60)
(32,62)-(32,67)
(33,11)-(33,68)
(33,11)-(33,21)
(33,22)-(33,68)
(33,23)-(33,44)
(33,24)-(33,29)
(33,30)-(33,43)
(33,31)-(33,35)
(33,37)-(33,42)
(33,46)-(33,67)
(33,47)-(33,52)
(33,53)-(33,66)
(33,54)-(33,58)
(33,60)-(33,65)
(35,8)-(37,34)
(35,8)-(35,19)
(36,10)-(37,34)
(36,11)-(36,32)
(36,12)-(36,17)
(36,18)-(36,31)
(36,19)-(36,23)
(36,25)-(36,30)
(36,34)-(36,55)
(36,35)-(36,40)
(36,41)-(36,54)
(36,42)-(36,46)
(36,48)-(36,53)
(37,12)-(37,33)
(37,13)-(37,18)
(37,19)-(37,32)
(37,20)-(37,24)
(37,26)-(37,31)
(38,7)-(38,65)
(38,14)-(38,25)
(38,14)-(38,18)
(38,19)-(38,25)
(38,20)-(38,21)
(38,23)-(38,24)
(38,38)-(38,47)
(38,38)-(38,44)
(38,45)-(38,47)
(38,55)-(38,64)
(38,55)-(38,61)
(38,62)-(38,64)
*)
