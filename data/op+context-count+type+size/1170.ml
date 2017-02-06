
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let e = build (rand, (depth - 1)) in
  if depth > 0
  then
    match rand 0 4 with
    | 0 -> buildSine e
    | 1 -> buildCosine e
    | 2 -> buildAverage (e, e)
    | 3 -> buildTimes (e, e)
    | 4 -> buildTimes (e, e, e, e)
  else (match rand 0 1 with | 0 -> buildX () | 1 -> buildY ());;


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
  let e = build (rand, (depth - 1)) in
  if depth > 1
  then
    match rand (0, 4) with
    | 0 -> buildSine e
    | 1 -> buildCosine e
    | 2 -> buildAverage (e, e)
    | 3 -> buildTimes (e, e)
    | 4 -> buildThresh (e, e, e, e)
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(17,17)-(17,39)
(25,14)-(25,15)
(27,11)-(27,19)
(27,16)-(27,17)
(30,26)-(30,27)
(30,29)-(30,30)
(31,24)-(31,25)
(31,27)-(31,28)
(32,12)-(32,22)
(33,15)-(33,23)
(33,20)-(33,21)
(33,36)-(33,42)
(33,43)-(33,45)
(33,53)-(33,59)
(33,60)-(33,62)
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
(17,4)-(17,42)
(17,17)-(17,39)
(17,26)-(17,39)
(17,33)-(17,35)
(17,37)-(17,39)
(19,4)-(19,23)
(19,12)-(19,21)
(19,12)-(19,21)
(19,17)-(19,21)
(21,4)-(21,23)
(21,12)-(21,21)
(21,12)-(21,21)
(21,17)-(21,21)
(23,16)-(33,62)
(24,3)-(33,62)
(24,3)-(33,62)
(24,11)-(24,16)
(24,11)-(24,34)
(24,11)-(24,34)
(24,18)-(24,22)
(24,18)-(24,34)
(24,25)-(24,30)
(24,25)-(24,34)
(24,25)-(24,34)
(24,33)-(24,34)
(25,3)-(33,62)
(25,3)-(33,62)
(25,6)-(25,11)
(25,6)-(25,15)
(25,6)-(25,15)
(25,14)-(25,15)
(27,5)-(32,34)
(27,5)-(32,34)
(27,5)-(32,34)
(27,5)-(32,34)
(27,5)-(32,34)
(27,5)-(32,34)
(27,5)-(32,34)
(27,5)-(32,34)
(27,5)-(32,34)
(27,5)-(32,34)
(27,5)-(32,34)
(27,11)-(27,15)
(27,11)-(27,19)
(27,11)-(27,19)
(27,11)-(27,19)
(27,16)-(27,17)
(27,18)-(27,19)
(28,12)-(28,21)
(28,12)-(28,23)
(28,12)-(28,23)
(28,22)-(28,23)
(29,12)-(29,23)
(29,12)-(29,25)
(29,24)-(29,25)
(30,12)-(30,24)
(30,12)-(30,30)
(30,26)-(30,27)
(30,26)-(30,30)
(30,29)-(30,30)
(31,12)-(31,22)
(31,12)-(31,28)
(31,24)-(31,25)
(31,24)-(31,28)
(31,27)-(31,28)
(32,12)-(32,22)
(32,12)-(32,34)
(32,12)-(32,34)
(32,24)-(32,25)
(32,24)-(32,34)
(32,27)-(32,28)
(32,30)-(32,31)
(32,33)-(32,34)
(33,9)-(33,62)
(33,9)-(33,62)
(33,36)-(33,42)
(33,36)-(33,45)
(33,53)-(33,59)
(33,53)-(33,62)
*)
