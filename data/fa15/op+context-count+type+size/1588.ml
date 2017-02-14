
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
    match rand (1, 7) with
    | 1 -> VarX
    | 2 -> VarY
    | 3 -> buildSine (build (rand, (depth - 1)))
    | 4 -> buildCosine (build (rand, (depth - 1)))
    | 5 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 7 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))));;


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
    match rand (1, 5) with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 4 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  else (match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ());;

*)

(* changed spans
(21,15)-(37,40)
(22,2)-(37,40)
(24,4)-(37,40)
(24,19)-(24,20)
(25,11)-(25,15)
(26,11)-(26,15)
(36,10)-(37,40)
*)

(* type error slice
(17,3)-(17,69)
(17,17)-(17,67)
(22,2)-(37,40)
(22,2)-(37,40)
(22,2)-(37,40)
(24,4)-(37,40)
(25,11)-(25,15)
(35,8)-(35,19)
(35,8)-(37,40)
(36,10)-(37,40)
*)
