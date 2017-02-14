
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr
  | TheThing of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildFiboPlus (e1,e2) = FiboPlus (e1, e2);;

let buildSine e = Sine e;;

let buildTheThing (e1,e2,e3) = TheThing (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 8) with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
    | 4 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 7 ->
        buildFiboPlus
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
    | 8 ->
        buildTheThing
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr
  | TheThing of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildFiboPlus (e1,e2) = FiboPlus (e1, e2);;

let buildSine e = Sine e;;

let buildTheThing (e1,e2,e3) = TheThing (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 8) with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
    | 4 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 7 ->
        buildFiboPlus
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 8 ->
        buildTheThing
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(50,13)-(50,18)
(50,13)-(50,36)
(50,13)-(52,37)
(50,20)-(50,24)
(50,27)-(50,32)
(50,27)-(50,36)
(50,35)-(50,36)
(51,43)-(51,48)
(54,9)-(54,22)
(55,13)-(55,36)
(55,13)-(56,37)
(55,42)-(55,47)
(55,42)-(55,65)
(55,49)-(55,65)
(55,56)-(55,61)
(55,56)-(55,65)
(55,64)-(55,65)
(57,9)-(57,65)
*)

(* type error slice
(17,4)-(17,48)
(17,20)-(17,45)
(49,9)-(49,22)
(49,9)-(52,37)
(50,13)-(52,37)
*)
