
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
  let r = if depth > 0 then rand (2, 6) else rand (0, 1) in
  match r with
  | 0 -> buildX
  | 1 -> buildY
  | 2 -> buildSine (build (rand, (depth - 1)))
  | 3 -> buildCosine (build (rand, (depth - 1)))
  | 4 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
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
  let r = if depth > 0 then rand (2, 6) else rand (0, 1) in
  match r with
  | 0 -> buildX ()
  | 1 -> buildY ()
  | 2 -> buildSine (build (rand, (depth - 1)))
  | 3 -> buildCosine (build (rand, (depth - 1)))
  | 4 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(28,10)-(28,16)
(29,10)-(29,16)
(30,10)-(30,44)
(39,55)-(39,60)
(39,63)-(39,64)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(19,26)-(19,39)
(21,4)-(21,23)
(21,12)-(21,21)
(25,4)-(39,70)
(25,16)-(39,64)
(26,3)-(39,64)
(27,3)-(39,64)
(27,3)-(39,64)
(27,3)-(39,64)
(27,3)-(39,64)
(27,3)-(39,64)
(27,3)-(39,64)
(28,10)-(28,16)
(30,10)-(30,19)
(30,10)-(30,44)
(30,21)-(30,26)
(30,21)-(30,44)
(31,10)-(31,21)
(31,10)-(31,46)
(33,7)-(33,19)
(33,7)-(33,74)
(35,7)-(35,17)
(35,7)-(35,72)
(37,7)-(37,18)
(37,7)-(39,64)
*)
