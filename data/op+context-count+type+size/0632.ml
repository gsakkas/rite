
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

let rec build (rand,depth) =
  if depth > 0
  then
    let depth = depth - 1 in
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, depth))
    | 1 -> buildCosine (build (rand, depth))
    | 2 -> buildAverage (build (rand, depth))
    | 3 -> buildTimes (build (rand, depth))
    | 4 -> buildThresh (build (rand, depth));;


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
(21,16)-(30,43)
(22,3)-(30,43)
(28,26)-(28,44)
(29,12)-(29,22)
(29,24)-(29,42)
(30,12)-(30,23)
(30,25)-(30,43)
(30,32)-(30,36)
(30,38)-(30,43)
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
(21,16)-(30,43)
(22,3)-(30,43)
(22,6)-(22,11)
(22,6)-(22,15)
(22,6)-(22,15)
(22,6)-(22,15)
(22,14)-(22,15)
(24,5)-(30,43)
(24,5)-(30,43)
(24,17)-(24,22)
(24,17)-(24,26)
(24,25)-(24,26)
(25,5)-(30,43)
(25,5)-(30,43)
(25,5)-(30,43)
(25,5)-(30,43)
(25,5)-(30,43)
(25,5)-(30,43)
(25,5)-(30,43)
(25,5)-(30,43)
(25,5)-(30,43)
(25,5)-(30,43)
(25,11)-(25,15)
(25,11)-(25,21)
(25,11)-(25,21)
(25,17)-(25,18)
(25,17)-(25,21)
(25,20)-(25,21)
(26,12)-(26,21)
(26,12)-(26,41)
(26,12)-(26,41)
(26,23)-(26,28)
(26,23)-(26,41)
(26,23)-(26,41)
(26,30)-(26,34)
(26,30)-(26,41)
(26,36)-(26,41)
(27,12)-(27,23)
(27,12)-(27,43)
(27,25)-(27,30)
(27,25)-(27,43)
(27,25)-(27,43)
(27,32)-(27,36)
(27,32)-(27,43)
(27,38)-(27,43)
(28,12)-(28,24)
(28,12)-(28,44)
(28,12)-(28,44)
(28,26)-(28,31)
(28,26)-(28,44)
(28,26)-(28,44)
(28,33)-(28,37)
(28,33)-(28,44)
(28,39)-(28,44)
(29,12)-(29,22)
(29,12)-(29,42)
(29,12)-(29,42)
(29,24)-(29,29)
(29,24)-(29,42)
(29,24)-(29,42)
(29,31)-(29,35)
(29,31)-(29,42)
(29,37)-(29,42)
(30,12)-(30,23)
(30,12)-(30,43)
(30,12)-(30,43)
(30,25)-(30,30)
(30,25)-(30,43)
(30,25)-(30,43)
(30,32)-(30,36)
(30,32)-(30,43)
(30,38)-(30,43)
*)
