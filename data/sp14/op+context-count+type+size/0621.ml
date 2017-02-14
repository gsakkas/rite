
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
    let d = depth - 1 in
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, d))
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
(24,5)-(30,43)
(26,36)-(26,37)
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
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(22,3)-(30,43)
(22,3)-(30,43)
(22,3)-(30,43)
(24,5)-(30,43)
(25,5)-(30,43)
(26,12)-(26,21)
(26,12)-(26,37)
(26,23)-(26,28)
(26,23)-(26,37)
(28,12)-(28,24)
(28,12)-(28,44)
(28,26)-(28,31)
(28,26)-(28,44)
(29,12)-(29,22)
(29,12)-(29,42)
(29,24)-(29,29)
(29,24)-(29,42)
(30,12)-(30,23)
(30,12)-(30,43)
(30,25)-(30,30)
(30,25)-(30,43)
*)
