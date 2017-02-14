
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
(21,15)-(30,44)
(22,2)-(30,44)
(24,4)-(30,44)
(26,35)-(26,36)
(28,24)-(28,45)
(29,11)-(29,21)
(29,22)-(29,43)
(30,11)-(30,22)
(30,23)-(30,44)
(30,31)-(30,35)
(30,37)-(30,42)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,3)-(17,69)
(17,17)-(17,67)
(19,3)-(19,41)
(19,16)-(19,39)
(22,2)-(30,44)
(22,2)-(30,44)
(22,2)-(30,44)
(24,4)-(30,44)
(25,4)-(30,44)
(26,11)-(26,20)
(26,11)-(26,38)
(26,21)-(26,38)
(26,22)-(26,27)
(28,11)-(28,23)
(28,11)-(28,45)
(28,24)-(28,45)
(28,25)-(28,30)
(29,11)-(29,21)
(29,11)-(29,43)
(29,22)-(29,43)
(29,23)-(29,28)
(30,11)-(30,22)
(30,11)-(30,44)
(30,23)-(30,44)
(30,24)-(30,29)
*)
