
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0
  then buildX ()
  else
    (match rand with
     | 0 -> buildSine (build ((rand (0, 6)), (depth - 1)))
     | 1 -> buildCosine (build ((rand (0, 6)), (depth - 1))));;


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
(11,17)-(11,29)
(15,12)-(15,21)
(17,16)-(23,58)
(18,6)-(18,15)
(21,6)-(23,58)
(21,12)-(21,16)
(22,13)-(22,56)
(22,32)-(22,42)
(22,38)-(22,39)
(22,38)-(22,42)
(22,41)-(22,42)
(22,47)-(22,52)
(22,55)-(22,56)
(23,13)-(23,24)
(23,26)-(23,31)
(23,34)-(23,38)
(23,34)-(23,58)
(23,40)-(23,41)
(23,40)-(23,44)
(23,43)-(23,44)
(23,49)-(23,54)
(23,49)-(23,58)
(23,57)-(23,58)
*)

(* type error slice
(17,4)-(23,64)
(17,16)-(23,58)
(21,6)-(23,58)
(21,6)-(23,58)
(21,6)-(23,58)
(21,6)-(23,58)
(21,12)-(21,16)
(22,24)-(22,29)
(22,24)-(22,56)
(22,32)-(22,36)
(22,32)-(22,42)
(22,32)-(22,56)
(23,34)-(23,38)
(23,34)-(23,44)
*)
