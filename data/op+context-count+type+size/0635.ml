
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
(32,26)-(32,44)
(33,12)-(33,22)
(33,24)-(33,42)
(34,12)-(34,23)
(34,25)-(34,43)
(35,9)-(35,65)
(35,15)-(35,19)
(35,21)-(35,22)
(35,21)-(35,25)
(35,24)-(35,25)
(35,39)-(35,45)
(35,46)-(35,48)
(35,56)-(35,62)
(35,63)-(35,65)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(17,47)-(17,48)
(17,50)-(17,51)
(17,53)-(17,59)
(17,61)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(19,26)-(19,39)
(19,33)-(19,35)
(19,37)-(19,39)
(21,4)-(21,23)
(21,12)-(21,21)
(21,12)-(21,21)
(21,17)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(23,12)-(23,21)
(23,17)-(23,21)
(25,16)-(35,65)
(26,3)-(35,65)
(26,3)-(35,65)
(26,6)-(26,11)
(26,6)-(26,15)
(26,6)-(26,15)
(26,6)-(26,15)
(26,14)-(26,15)
(28,5)-(34,43)
(28,5)-(34,43)
(28,17)-(28,22)
(28,17)-(28,26)
(28,25)-(28,26)
(29,5)-(34,43)
(29,5)-(34,43)
(29,5)-(34,43)
(29,5)-(34,43)
(29,5)-(34,43)
(29,5)-(34,43)
(29,5)-(34,43)
(29,5)-(34,43)
(29,5)-(34,43)
(29,5)-(34,43)
(29,11)-(29,15)
(29,11)-(29,21)
(29,11)-(29,21)
(29,17)-(29,18)
(29,17)-(29,21)
(29,20)-(29,21)
(30,12)-(30,21)
(30,12)-(30,41)
(30,12)-(30,41)
(30,23)-(30,28)
(30,23)-(30,41)
(30,23)-(30,41)
(30,30)-(30,34)
(30,30)-(30,41)
(30,36)-(30,41)
(31,12)-(31,23)
(31,12)-(31,43)
(31,25)-(31,30)
(31,25)-(31,43)
(31,25)-(31,43)
(31,32)-(31,36)
(31,32)-(31,43)
(31,38)-(31,43)
(32,12)-(32,24)
(32,12)-(32,44)
(32,12)-(32,44)
(32,26)-(32,31)
(32,26)-(32,44)
(32,26)-(32,44)
(32,33)-(32,37)
(32,33)-(32,44)
(32,39)-(32,44)
(33,12)-(33,22)
(33,12)-(33,42)
(33,12)-(33,42)
(33,24)-(33,29)
(33,24)-(33,42)
(33,24)-(33,42)
(33,31)-(33,35)
(33,31)-(33,42)
(33,37)-(33,42)
(34,12)-(34,23)
(34,12)-(34,43)
(34,12)-(34,43)
(34,25)-(34,30)
(34,25)-(34,43)
(34,25)-(34,43)
(34,32)-(34,36)
(34,32)-(34,43)
(34,38)-(34,43)
(35,9)-(35,65)
(35,9)-(35,65)
(35,39)-(35,45)
(35,39)-(35,48)
(35,56)-(35,62)
(35,56)-(35,65)
*)
