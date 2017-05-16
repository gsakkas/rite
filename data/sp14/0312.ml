
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
(17,16)-(17,39)
(25,13)-(25,14)
(27,10)-(27,18)
(27,15)-(27,16)
(32,11)-(32,21)
(33,14)-(33,22)
(33,19)-(33,20)
*)

(* type error slice
(17,3)-(17,41)
(17,16)-(17,39)
(32,11)-(32,21)
(32,11)-(32,34)
(32,22)-(32,34)
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
(17,16)-(17,39)
(17,25)-(17,39)
(17,32)-(17,34)
(17,36)-(17,38)
(19,11)-(19,20)
(19,16)-(19,20)
(21,11)-(21,20)
(21,16)-(21,20)
(23,15)-(33,62)
(24,2)-(33,62)
(24,10)-(24,35)
(24,10)-(24,15)
(24,16)-(24,35)
(24,17)-(24,21)
(24,23)-(24,34)
(24,24)-(24,29)
(24,32)-(24,33)
(25,2)-(33,62)
(25,5)-(25,14)
(25,5)-(25,10)
(25,13)-(25,14)
(27,4)-(32,34)
(27,10)-(27,18)
(27,10)-(27,14)
(27,15)-(27,16)
(27,17)-(27,18)
(28,11)-(28,22)
(28,11)-(28,20)
(28,21)-(28,22)
(29,11)-(29,24)
(29,11)-(29,22)
(29,23)-(29,24)
(30,11)-(30,30)
(30,11)-(30,23)
(30,24)-(30,30)
(30,25)-(30,26)
(30,28)-(30,29)
(31,11)-(31,28)
(31,11)-(31,21)
(31,22)-(31,28)
(31,23)-(31,24)
(31,26)-(31,27)
(32,11)-(32,34)
(32,11)-(32,21)
(32,22)-(32,34)
(32,23)-(32,24)
(32,26)-(32,27)
(32,29)-(32,30)
(32,32)-(32,33)
(33,7)-(33,62)
(33,14)-(33,22)
(33,14)-(33,18)
(33,19)-(33,20)
(33,21)-(33,22)
(33,35)-(33,44)
(33,35)-(33,41)
(33,42)-(33,44)
(33,52)-(33,61)
(33,52)-(33,58)
(33,59)-(33,61)
*)
