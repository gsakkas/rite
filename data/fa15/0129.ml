
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

let rec build (rand,depth) =
  if depth > 0
  then
    match rand with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
    | 2 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | _ -> false;;


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
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
    | 2 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 3 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | _ ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  else (match rand (0, 1) with | 0 -> buildX () | _ -> buildY ());;

*)

(* changed spans
(17,15)-(26,16)
(18,2)-(26,16)
(20,4)-(26,16)
(20,10)-(20,14)
(21,11)-(21,48)
(26,11)-(26,16)
*)

(* type error slice
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,3)-(26,18)
(17,15)-(26,16)
(18,2)-(26,16)
(20,4)-(26,16)
(21,11)-(21,20)
(21,11)-(21,48)
(21,21)-(21,48)
(21,22)-(21,27)
(26,11)-(26,16)
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
(17,15)-(26,16)
(18,2)-(26,16)
(18,5)-(18,14)
(18,5)-(18,10)
(18,13)-(18,14)
(20,4)-(26,16)
(20,10)-(20,14)
(21,11)-(21,48)
(21,11)-(21,20)
(21,21)-(21,48)
(21,22)-(21,27)
(21,28)-(21,47)
(21,29)-(21,33)
(21,35)-(21,46)
(21,36)-(21,41)
(21,44)-(21,45)
(22,11)-(22,50)
(22,11)-(22,22)
(22,23)-(22,50)
(22,24)-(22,29)
(22,30)-(22,49)
(22,31)-(22,35)
(22,37)-(22,48)
(22,38)-(22,43)
(22,46)-(22,47)
(24,8)-(25,68)
(24,8)-(24,20)
(25,10)-(25,68)
(25,11)-(25,38)
(25,12)-(25,17)
(25,18)-(25,37)
(25,19)-(25,23)
(25,25)-(25,36)
(25,26)-(25,31)
(25,34)-(25,35)
(25,40)-(25,67)
(25,41)-(25,46)
(25,47)-(25,66)
(25,48)-(25,52)
(25,54)-(25,65)
(25,55)-(25,60)
(25,63)-(25,64)
(26,11)-(26,16)
*)
