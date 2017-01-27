
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
(32,27)-(32,45)
(32,50)-(32,68)
(33,25)-(33,43)
(33,48)-(33,66)
(36,13)-(37,32)
(38,9)-(38,65)
(38,56)-(38,62)
(38,63)-(38,65)
*)

(* type error slice
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(17,47)-(17,48)
(17,50)-(17,51)
(17,53)-(17,59)
(17,61)-(17,67)
(28,5)-(37,32)
(28,17)-(28,26)
(29,11)-(29,15)
(29,11)-(29,21)
(29,17)-(29,18)
(29,17)-(29,21)
(29,20)-(29,21)
(30,23)-(30,28)
(30,23)-(30,41)
(30,30)-(30,34)
(30,30)-(30,41)
(30,36)-(30,41)
(35,9)-(35,20)
(35,9)-(37,32)
(36,13)-(36,18)
(36,13)-(36,31)
(36,13)-(37,32)
(36,20)-(36,24)
(36,20)-(36,31)
(36,26)-(36,31)
(36,36)-(36,41)
(36,36)-(36,54)
(36,43)-(36,47)
(36,43)-(36,54)
(36,49)-(36,54)
(37,14)-(37,19)
(37,14)-(37,32)
(37,21)-(37,25)
(37,21)-(37,32)
(37,27)-(37,32)
*)
