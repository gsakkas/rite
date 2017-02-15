
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
  match rand (1, 7) with
  | 1 -> buildX
  | 2 -> buildY
  | 3 -> buildSine (build (rand, (depth - 1)))
  | 4 -> buildCosine (build (rand, (depth - 1)))
  | 5 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 -> buildSine (build (rand, (depth - 1)))
  | 4 -> buildCosine (build (rand, (depth - 1)))
  | 5 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(27,9)-(27,15)
(28,9)-(28,15)
(29,9)-(29,46)
(38,54)-(38,59)
(38,62)-(38,63)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(19,3)-(19,41)
(19,16)-(19,39)
(19,25)-(19,39)
(21,3)-(21,22)
(21,11)-(21,20)
(25,3)-(38,69)
(25,15)-(38,67)
(26,2)-(38,67)
(26,2)-(38,67)
(26,2)-(38,67)
(26,2)-(38,67)
(26,2)-(38,67)
(26,2)-(38,67)
(27,9)-(27,15)
(29,9)-(29,18)
(29,9)-(29,46)
(29,19)-(29,46)
(29,20)-(29,25)
(30,9)-(30,20)
(30,9)-(30,48)
(32,6)-(32,18)
(32,6)-(32,77)
(34,6)-(34,16)
(34,6)-(34,75)
(36,6)-(36,17)
(36,6)-(38,67)
*)
