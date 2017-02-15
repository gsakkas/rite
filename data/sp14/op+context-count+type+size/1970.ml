
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
(23,15)-(43,51)
(27,4)-(43,51)
(27,11)-(27,15)
(28,12)-(28,58)
(28,30)-(28,43)
(28,36)-(28,42)
(28,37)-(28,38)
(28,40)-(28,41)
(29,32)-(29,45)
(29,38)-(29,44)
(29,39)-(29,40)
(29,42)-(29,43)
(32,20)-(32,33)
(32,26)-(32,32)
(32,27)-(32,28)
(32,30)-(32,31)
(33,21)-(33,34)
(33,27)-(33,33)
(33,28)-(33,29)
(33,31)-(33,32)
(36,20)-(36,33)
(36,26)-(36,32)
(36,27)-(36,28)
(36,30)-(36,31)
(37,21)-(37,34)
(37,27)-(37,33)
(37,28)-(37,29)
(37,31)-(37,32)
(40,20)-(40,33)
(40,26)-(40,32)
(40,27)-(40,28)
(40,30)-(40,31)
(41,21)-(41,34)
(41,22)-(41,26)
(41,27)-(41,33)
*)

(* type error slice
(23,3)-(43,53)
(23,15)-(43,51)
(27,4)-(43,51)
(27,4)-(43,51)
(27,4)-(43,51)
(27,4)-(43,51)
(27,4)-(43,51)
(27,4)-(43,51)
(27,4)-(43,51)
(27,4)-(43,51)
(27,4)-(43,51)
(27,4)-(43,51)
(27,11)-(27,15)
(28,22)-(28,58)
(28,23)-(28,28)
(28,29)-(28,57)
(28,30)-(28,43)
(28,31)-(28,35)
(43,21)-(43,34)
(43,22)-(43,26)
*)
