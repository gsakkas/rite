
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
(26,9)-(26,77)
buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(26,22)-(26,49)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

(27,9)-(27,75)
buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(27,20)-(27,47)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

(29,6)-(30,63)
buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(29,18)-(29,45)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

*)
