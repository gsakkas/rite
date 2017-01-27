
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildECosSin (a,b) = ECosSin (a, b);;

let buildSinLog (a,b,c) = SinLog (a, b, c);;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (8, 10) else (1, 8)) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildECosSin ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildSinLog ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 8 -> VarX
  | 9 -> VarY;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildECosSin (a,b) = ECosSin (a, b);;

let buildSinLog (a,b,c) = SinLog (a, b, c);;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (8, 10) else (1, 8)) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildECosSin ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildSinLog
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))))
  | 8 -> VarX
  | 9 -> VarY;;

*)

(* changed spans
(33,22)-(33,45)
(33,51)-(33,74)
(35,20)-(35,43)
(35,49)-(35,72)
(41,22)-(41,45)
(41,51)-(41,74)
(43,21)-(43,73)
(44,10)-(44,14)
*)

(* type error slice
(19,4)-(19,45)
(19,18)-(19,42)
(19,27)-(19,42)
(19,35)-(19,36)
(19,38)-(19,39)
(19,41)-(19,42)
(28,11)-(28,15)
(28,11)-(28,53)
(28,17)-(28,53)
(28,36)-(28,37)
(28,36)-(28,41)
(28,39)-(28,41)
(30,21)-(30,26)
(30,21)-(30,44)
(30,28)-(30,32)
(30,28)-(30,44)
(30,35)-(30,44)
(43,7)-(43,18)
(43,7)-(43,73)
(43,21)-(43,26)
(43,21)-(43,44)
(43,21)-(43,73)
(43,28)-(43,32)
(43,28)-(43,44)
(43,35)-(43,44)
(43,50)-(43,55)
(43,50)-(43,73)
(43,57)-(43,61)
(43,57)-(43,73)
(43,64)-(43,73)
*)
