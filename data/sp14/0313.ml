
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
    match rand (0 4) with
    | 0 -> buildSine e
    | 1 -> buildCosine e
    | 2 -> buildAverage (e, e)
    | 3 -> buildTimes (e, e)
    | 4 -> buildThresh (e, e, e, e)
  else (match rand (0 1) with | 0 -> buildX () | 1 -> buildY ());;


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
(29,15)-(29,20)
(35,19)-(35,24)
*)

(* type error slice
(29,15)-(29,20)
(29,16)-(29,17)
(35,19)-(35,24)
(35,20)-(35,21)
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
(25,15)-(35,64)
(26,2)-(35,64)
(26,10)-(26,35)
(26,10)-(26,15)
(26,16)-(26,35)
(26,17)-(26,21)
(26,23)-(26,34)
(26,24)-(26,29)
(26,32)-(26,33)
(27,2)-(35,64)
(27,5)-(27,14)
(27,5)-(27,10)
(27,13)-(27,14)
(29,4)-(34,35)
(29,10)-(29,20)
(29,10)-(29,14)
(29,15)-(29,20)
(29,16)-(29,17)
(29,18)-(29,19)
(30,11)-(30,22)
(30,11)-(30,20)
(30,21)-(30,22)
(31,11)-(31,24)
(31,11)-(31,22)
(31,23)-(31,24)
(32,11)-(32,30)
(32,11)-(32,23)
(32,24)-(32,30)
(32,25)-(32,26)
(32,28)-(32,29)
(33,11)-(33,28)
(33,11)-(33,21)
(33,22)-(33,28)
(33,23)-(33,24)
(33,26)-(33,27)
(34,11)-(34,35)
(34,11)-(34,22)
(34,23)-(34,35)
(34,24)-(34,25)
(34,27)-(34,28)
(34,30)-(34,31)
(34,33)-(34,34)
(35,7)-(35,64)
(35,14)-(35,24)
(35,14)-(35,18)
(35,19)-(35,24)
(35,20)-(35,21)
(35,22)-(35,23)
(35,37)-(35,46)
(35,37)-(35,43)
(35,44)-(35,46)
(35,54)-(35,63)
(35,54)-(35,60)
(35,61)-(35,63)
*)
