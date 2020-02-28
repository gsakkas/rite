
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildECosSin (a,b) = ECosSin (a, b);;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (7, 9) else (1, 7)) in
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
  | 6 -> buildECosSin (build (rand, (depth - 1))) (build (rand, (depth - 1)))
  | 7 -> VarX
  | 8 -> VarY;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildECosSin (a,b) = ECosSin (a, b);;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (7, 9) else (1, 7)) in
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
  | 7 -> VarX
  | 8 -> VarY;;

*)

(* changed spans
(37,10)-(37,78)
buildECosSin (build (rand , depth - 1) , build (rand , depth - 1))
AppG [TupleG [EmptyG,EmptyG]]

*)

(* type error slice
(16,4)-(16,42)
(16,19)-(16,40)
(18,4)-(18,27)
(18,15)-(18,25)
(18,19)-(18,25)
(18,24)-(18,25)
(27,10)-(27,19)
(27,10)-(27,47)
(27,20)-(27,47)
(27,21)-(27,26)
(37,10)-(37,22)
(37,10)-(37,78)
(37,23)-(37,50)
(37,24)-(37,29)
*)
