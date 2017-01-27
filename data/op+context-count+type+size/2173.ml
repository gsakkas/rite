
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

let rec build (rand,depth) =
  if depth <= 0
  then buildX ()
  else
    (match rand with
     | 0 -> buildSine (build ((rand (0, 5)), (depth - 1)))
     | 1 -> buildCosine (build ((rand (0, 5)), (depth - 1)))
     | 2 ->
         buildAverage
           ((build ((rand (0, 5)), (depth - 2))),
             (build ((rand (0, 5)), (depth - 2))))
     | 3 ->
         buildTimes
           ((build ((rand (0, 5)), (depth - 2))),
             (build ((rand (0, 5)), (depth - 2))))
     | 4 ->
         buildThresh
           ((build ((rand (0, 5)), (depth - 4))),
             (build ((rand (0, 5)), (depth - 4))),
             (build ((rand (0, 5)), (depth - 4))),
             (build ((rand (0, 5)), (depth - 4)))));;


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
  if depth <= 0
  then buildX ()
  else
    (match rand (0, 4) with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 4))), (build (rand, (depth - 4))),
             (build (rand, (depth - 4))), (build (rand, (depth - 4))))
     | _ -> buildY ());;

*)

(* changed spans
(23,16)-(43,47)
(27,6)-(43,47)
(27,12)-(27,16)
(28,13)-(28,56)
(28,32)-(28,42)
(28,38)-(28,39)
(28,38)-(28,42)
(28,41)-(28,42)
(29,34)-(29,44)
(29,40)-(29,41)
(29,40)-(29,44)
(29,43)-(29,44)
(32,22)-(32,32)
(32,28)-(32,29)
(32,28)-(32,32)
(32,31)-(32,32)
(33,23)-(33,33)
(33,29)-(33,30)
(33,29)-(33,33)
(33,32)-(33,33)
(36,22)-(36,32)
(36,28)-(36,29)
(36,28)-(36,32)
(36,31)-(36,32)
(37,23)-(37,33)
(37,29)-(37,30)
(37,29)-(37,33)
(37,32)-(37,33)
(40,22)-(40,32)
(40,28)-(40,29)
(40,28)-(40,32)
(40,31)-(40,32)
(42,15)-(42,47)
(43,15)-(43,47)
*)

(* type error slice
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(23,4)-(43,54)
(23,16)-(43,47)
(24,3)-(43,47)
(24,6)-(24,11)
(24,6)-(24,16)
(24,15)-(24,16)
(25,8)-(25,14)
(25,8)-(25,17)
(25,15)-(25,17)
(27,6)-(43,47)
(27,12)-(27,16)
(28,24)-(28,29)
(28,24)-(28,56)
(28,32)-(28,36)
(28,32)-(28,42)
(28,32)-(28,56)
(28,38)-(28,39)
(28,38)-(28,42)
(28,41)-(28,42)
(28,47)-(28,56)
*)
