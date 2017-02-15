
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
    let rand' = rand (1, 5) in
    match rand' with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 -> buildTimes ((build (rand, (depth - 1))), buildY)
    | 4 -> buildAverage ((build (rand, (depth - 1))), buildY)
    | 5 ->
        buildThresh
          (buildX, buildY, (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else buildX;;


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
    let rand' = rand (1, 5) in
    match rand' with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 -> buildTimes ((build (rand, (depth - 1))), (buildY ()))
    | 4 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
    | 5 ->
        buildThresh
          ((buildX ()), (buildY ()), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else buildX ();;

*)

(* changed spans
(32,52)-(32,58)
(33,11)-(33,61)
(33,54)-(33,60)
(35,8)-(37,40)
(36,11)-(36,17)
(36,19)-(36,25)
(36,27)-(36,54)
(37,13)-(37,18)
(37,19)-(37,38)
(37,20)-(37,24)
(37,26)-(37,37)
(37,27)-(37,32)
(37,35)-(37,36)
(38,7)-(38,13)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(11,40)-(11,42)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(17,49)-(17,50)
(19,3)-(19,41)
(19,16)-(19,39)
(19,25)-(19,39)
(19,36)-(19,38)
(21,3)-(21,22)
(21,11)-(21,20)
(23,3)-(23,22)
(23,11)-(23,20)
(26,2)-(38,13)
(26,2)-(38,13)
(28,4)-(37,40)
(29,4)-(37,40)
(30,11)-(30,20)
(30,11)-(30,48)
(32,11)-(32,21)
(32,11)-(32,59)
(32,22)-(32,59)
(32,52)-(32,58)
(33,11)-(33,23)
(33,11)-(33,61)
(33,24)-(33,61)
(33,54)-(33,60)
(35,8)-(35,19)
(35,8)-(37,40)
(36,10)-(37,40)
(36,19)-(36,25)
(38,7)-(38,13)
*)
