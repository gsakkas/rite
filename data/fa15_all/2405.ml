
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
(27,10)-(27,16)
buildX ()
AppG (fromList [ConAppG Nothing])

(28,10)-(28,16)
buildY ()
AppG (fromList [ConAppG Nothing])

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(11,28)-(11,44)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,68)
(17,39)-(17,68)
(19,4)-(19,42)
(19,17)-(19,40)
(19,26)-(19,40)
(21,4)-(21,23)
(21,12)-(21,21)
(25,4)-(38,70)
(25,16)-(38,68)
(26,3)-(38,68)
(27,10)-(27,16)
(29,10)-(29,19)
(29,10)-(29,47)
(29,20)-(29,47)
(29,21)-(29,26)
(30,10)-(30,21)
(30,10)-(30,49)
(32,7)-(32,19)
(32,7)-(32,78)
(34,7)-(34,17)
(34,7)-(34,76)
(36,7)-(36,18)
(36,7)-(38,68)
*)
