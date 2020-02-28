
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

let buildSqrt e = Sqrt (Abs e);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  match depth with
  | 0 -> VarX
  | _ ->
      let next = build (rand, (depth - 1)) in
      (match rand (1, 7) with
       | 1 -> buildSine next
       | 2 -> buildCosine next
       | 3 -> buildAverage (next next)
       | 4 -> buildTimes next next
       | 5 -> buildThresh next next next next
       | 6 -> buildSqrt next
       | 7 -> buildGauss next next next);;


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

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildGauss (e1,e2,e3) = Gauss (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSqrt e = Sqrt (Abs e);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  match depth with
  | 0 -> VarX
  | _ ->
      let next = build (rand, (depth - 1)) in
      (match rand (1, 7) with
       | 1 -> buildSine next
       | 2 -> buildCosine next
       | 3 -> buildAverage (next, next)
       | 4 -> buildTimes (next, next)
       | 5 -> buildThresh (next, next, next, next)
       | 6 -> buildSqrt next
       | 7 -> buildGauss (next, next, next));;

*)

(* changed spans
(36,28)-(36,39)
(next , next)
TupleG [VarG,VarG]

(37,15)-(37,35)
buildTimes (next , next)
AppG [TupleG [EmptyG,EmptyG]]

(38,15)-(38,46)
buildThresh (next , next , next , next)
AppG [TupleG [EmptyG,EmptyG,EmptyG,EmptyG]]

(40,15)-(40,40)
buildGauss (next , next , next)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

*)

(* type error slice
(20,4)-(20,27)
(20,15)-(20,25)
(20,19)-(20,25)
(20,24)-(20,25)
(26,4)-(26,42)
(26,17)-(26,40)
(26,26)-(26,40)
(34,15)-(34,24)
(34,15)-(34,29)
(34,25)-(34,29)
(36,28)-(36,39)
(36,29)-(36,33)
(37,15)-(37,25)
(37,15)-(37,35)
*)
