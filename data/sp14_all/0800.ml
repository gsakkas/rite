
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildGauss (e1,e2,e3) = Gauss (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSqrt e = Sqrt e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (0, 2) with | 0 -> VarX | 1 -> VarY | _ -> VarY)
  | _ ->
      let next = build (rand, (depth - 1)) in
      (match rand (1, 8) with
       | 1 -> buildSine next
       | 2 -> buildCosine next
       | 3 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 4 -> buildTimes (next, (build (rand, (depth - 1))))
       | 5 ->
           buildThresh
             (next, (build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))))
       | 6 -> buildSqrt next
       | 7 ->
           buildGauss
             (next, (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ -> abs next);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

let buildAbs e = Abs e;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildGauss (e1,e2,e3) = Gauss (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSqrt e = Sqrt e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (0, 2) with | 0 -> VarX | 1 -> VarY | _ -> VarY)
  | _ ->
      let next = build (rand, (depth - 1)) in
      (match rand (1, 8) with
       | 1 -> buildSine next
       | 2 -> buildCosine next
       | 3 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 4 -> buildTimes (next, (build (rand, (depth - 1))))
       | 5 ->
           buildThresh
             (next, (build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))))
       | 6 -> buildSqrt next
       | 7 ->
           buildGauss
             (next, (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ -> buildAbs next);;

*)

(* changed spans
(48,15)-(48,23)
buildAbs next
AppG (fromList [VarG])

*)

(* type error slice
(20,4)-(20,27)
(20,15)-(20,25)
(20,19)-(20,25)
(20,24)-(20,25)
(34,15)-(34,24)
(34,15)-(34,29)
(34,25)-(34,29)
(48,15)-(48,18)
(48,15)-(48,23)
(48,19)-(48,23)
*)
