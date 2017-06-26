
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
(11,16)-(11,28)
(15,11)-(15,20)
(17,15)-(23,61)
(18,5)-(18,14)
(21,4)-(23,61)
(21,11)-(21,15)
(22,12)-(22,58)
(22,30)-(22,43)
(22,36)-(22,42)
(22,37)-(22,38)
(22,40)-(22,41)
(23,32)-(23,45)
(23,33)-(23,37)
(23,38)-(23,44)
(23,39)-(23,40)
(23,42)-(23,43)
(23,56)-(23,57)
*)

(* type error slice
(17,3)-(23,63)
(17,15)-(23,61)
(21,4)-(23,61)
(21,11)-(21,15)
(22,22)-(22,58)
(22,23)-(22,28)
(22,29)-(22,57)
(22,30)-(22,43)
(22,31)-(22,35)
(23,32)-(23,45)
(23,33)-(23,37)
*)

(* all spans
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(23,61)
(18,2)-(23,61)
(18,5)-(18,14)
(18,5)-(18,10)
(18,13)-(18,14)
(19,7)-(19,16)
(19,7)-(19,13)
(19,14)-(19,16)
(21,4)-(23,61)
(21,11)-(21,15)
(22,12)-(22,58)
(22,12)-(22,21)
(22,22)-(22,58)
(22,23)-(22,28)
(22,29)-(22,57)
(22,30)-(22,43)
(22,31)-(22,35)
(22,36)-(22,42)
(22,37)-(22,38)
(22,40)-(22,41)
(22,45)-(22,56)
(22,46)-(22,51)
(22,54)-(22,55)
(23,12)-(23,60)
(23,12)-(23,23)
(23,24)-(23,60)
(23,25)-(23,30)
(23,31)-(23,59)
(23,32)-(23,45)
(23,33)-(23,37)
(23,38)-(23,44)
(23,39)-(23,40)
(23,42)-(23,43)
(23,47)-(23,58)
(23,48)-(23,53)
(23,56)-(23,57)
*)
