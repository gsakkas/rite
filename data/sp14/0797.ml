
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
(37,14)-(37,34)
(37,25)-(37,29)
(38,14)-(38,45)
(38,26)-(38,30)
(40,14)-(40,39)
(40,25)-(40,29)
*)

(* type error slice
(26,3)-(26,41)
(26,16)-(26,39)
(26,25)-(26,39)
(37,14)-(37,24)
(37,14)-(37,34)
*)

(* all spans
(14,18)-(14,43)
(14,27)-(14,43)
(14,36)-(14,38)
(14,40)-(14,42)
(16,16)-(16,28)
(16,20)-(16,28)
(16,27)-(16,28)
(18,16)-(18,46)
(18,28)-(18,46)
(18,35)-(18,37)
(18,39)-(18,41)
(18,43)-(18,45)
(20,14)-(20,24)
(20,18)-(20,24)
(20,23)-(20,24)
(22,14)-(22,30)
(22,18)-(22,30)
(22,23)-(22,30)
(22,28)-(22,29)
(24,17)-(24,67)
(24,38)-(24,67)
(24,46)-(24,47)
(24,49)-(24,50)
(24,52)-(24,58)
(24,60)-(24,66)
(26,16)-(26,39)
(26,25)-(26,39)
(26,32)-(26,34)
(26,36)-(26,38)
(28,15)-(40,40)
(29,2)-(40,40)
(29,8)-(29,13)
(30,9)-(30,13)
(32,6)-(40,40)
(32,17)-(32,42)
(32,17)-(32,22)
(32,23)-(32,42)
(32,24)-(32,28)
(32,30)-(32,41)
(32,31)-(32,36)
(32,39)-(32,40)
(33,6)-(40,40)
(33,13)-(33,24)
(33,13)-(33,17)
(33,18)-(33,24)
(33,19)-(33,20)
(33,22)-(33,23)
(34,14)-(34,28)
(34,14)-(34,23)
(34,24)-(34,28)
(35,14)-(35,30)
(35,14)-(35,25)
(35,26)-(35,30)
(36,14)-(36,39)
(36,14)-(36,26)
(36,27)-(36,39)
(36,28)-(36,32)
(36,34)-(36,38)
(37,14)-(37,34)
(37,14)-(37,24)
(37,25)-(37,29)
(37,30)-(37,34)
(38,14)-(38,45)
(38,14)-(38,25)
(38,26)-(38,30)
(38,31)-(38,35)
(38,36)-(38,40)
(38,41)-(38,45)
(39,14)-(39,28)
(39,14)-(39,23)
(39,24)-(39,28)
(40,14)-(40,39)
(40,14)-(40,24)
(40,25)-(40,29)
(40,30)-(40,34)
(40,35)-(40,39)
*)
