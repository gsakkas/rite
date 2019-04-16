
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

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (6, 7) else (1, 5)) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 -> buildAverage (build (rand, (depth - 1))) (build (rand, (depth - 1)))
  | 4 -> buildTimes (build (rand, (depth - 1))) (build (rand, (depth - 1)))
  | 5 ->
      buildThresh (build (rand, (depth - 1))) (build (rand, (depth - 1)))
        (build (rand, (depth - 1))) (build (rand, (depth - 1)))
  | 6 -> VarX
  | 7 -> VarY;;


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

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (6, 7) else (1, 5)) in
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
  | 6 -> VarX
  | 7 -> VarY;;

*)

(* changed spans
(26,10)-(26,78)
buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(27,10)-(27,76)
buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(29,7)-(30,64)
buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(19,4)-(19,42)
(19,17)-(19,40)
(19,26)-(19,40)
(24,10)-(24,19)
(24,10)-(24,47)
(24,20)-(24,47)
(24,21)-(24,26)
(26,10)-(26,22)
(26,10)-(26,78)
(26,23)-(26,50)
(26,24)-(26,29)
(27,10)-(27,20)
(27,10)-(27,76)
*)
