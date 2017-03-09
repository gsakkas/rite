
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
    | 2 -> buildAverage (build (rand, depth))
    | 3 -> buildTimes (build (rand, depth))
    | 4 -> buildThresh (build (rand, depth))
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
(32,24)-(32,45)
(33,11)-(33,21)
(33,22)-(33,43)
(34,11)-(34,22)
(34,23)-(34,44)
(35,7)-(35,65)
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
(19,3)-(19,41)
(19,16)-(19,39)
(30,11)-(30,20)
(30,11)-(30,42)
(30,21)-(30,42)
(30,22)-(30,27)
(32,11)-(32,23)
(32,11)-(32,45)
(32,24)-(32,45)
(32,25)-(32,30)
(33,11)-(33,21)
(33,11)-(33,43)
(33,22)-(33,43)
(33,23)-(33,28)
(34,11)-(34,22)
(34,11)-(34,44)
(34,23)-(34,44)
(34,24)-(34,29)
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
(25,15)-(35,65)
(26,2)-(35,65)
(26,5)-(26,14)
(26,5)-(26,10)
(26,13)-(26,14)
(28,4)-(34,44)
(28,16)-(28,25)
(28,16)-(28,21)
(28,24)-(28,25)
(29,4)-(34,44)
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
(32,11)-(32,45)
(32,11)-(32,23)
(32,24)-(32,45)
(32,25)-(32,30)
(32,31)-(32,44)
(32,32)-(32,36)
(32,38)-(32,43)
(33,11)-(33,43)
(33,11)-(33,21)
(33,22)-(33,43)
(33,23)-(33,28)
(33,29)-(33,42)
(33,30)-(33,34)
(33,36)-(33,41)
(34,11)-(34,44)
(34,11)-(34,22)
(34,23)-(34,44)
(34,24)-(34,29)
(34,30)-(34,43)
(34,31)-(34,35)
(34,37)-(34,42)
(35,7)-(35,65)
(35,14)-(35,25)
(35,14)-(35,18)
(35,19)-(35,25)
(35,20)-(35,21)
(35,23)-(35,24)
(35,38)-(35,47)
(35,38)-(35,44)
(35,45)-(35,47)
(35,55)-(35,64)
(35,55)-(35,61)
(35,62)-(35,64)
*)
