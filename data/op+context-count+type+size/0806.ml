
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
(36,29)-(36,38)
(37,15)-(37,35)
(37,26)-(37,30)
(38,15)-(38,46)
(38,27)-(38,31)
(40,15)-(40,40)
(40,26)-(40,30)
*)

(* type error slice
(14,4)-(14,46)
(14,19)-(14,43)
(14,28)-(14,43)
(14,37)-(14,39)
(14,41)-(14,43)
(16,4)-(16,31)
(16,17)-(16,29)
(16,21)-(16,29)
(16,28)-(16,29)
(18,4)-(18,49)
(18,17)-(18,46)
(18,29)-(18,46)
(18,36)-(18,38)
(18,40)-(18,42)
(18,44)-(18,46)
(20,4)-(20,27)
(20,15)-(20,25)
(20,19)-(20,25)
(20,24)-(20,25)
(22,4)-(22,33)
(22,15)-(22,30)
(22,19)-(22,30)
(22,25)-(22,30)
(22,29)-(22,30)
(24,4)-(24,70)
(24,18)-(24,67)
(24,39)-(24,67)
(24,47)-(24,48)
(24,50)-(24,51)
(24,53)-(24,59)
(24,61)-(24,67)
(26,4)-(26,42)
(26,17)-(26,39)
(26,26)-(26,39)
(26,33)-(26,35)
(26,37)-(26,39)
(28,16)-(40,40)
(29,3)-(40,40)
(29,9)-(29,14)
(30,10)-(30,14)
(32,7)-(40,40)
(32,7)-(40,40)
(32,18)-(32,23)
(32,18)-(32,41)
(32,18)-(32,41)
(32,25)-(32,29)
(32,25)-(32,41)
(32,32)-(32,37)
(32,32)-(32,41)
(32,32)-(32,41)
(32,40)-(32,41)
(33,8)-(40,40)
(33,8)-(40,40)
(33,8)-(40,40)
(33,8)-(40,40)
(33,8)-(40,40)
(33,8)-(40,40)
(33,8)-(40,40)
(33,8)-(40,40)
(33,8)-(40,40)
(33,8)-(40,40)
(33,8)-(40,40)
(33,8)-(40,40)
(33,8)-(40,40)
(33,8)-(40,40)
(33,14)-(33,18)
(33,14)-(33,24)
(33,14)-(33,24)
(33,20)-(33,21)
(33,20)-(33,24)
(33,23)-(33,24)
(34,15)-(34,24)
(34,15)-(34,29)
(34,15)-(34,29)
(34,25)-(34,29)
(35,15)-(35,26)
(35,15)-(35,31)
(35,27)-(35,31)
(36,15)-(36,27)
(36,15)-(36,38)
(36,15)-(36,38)
(36,29)-(36,33)
(36,29)-(36,38)
(36,29)-(36,38)
(36,34)-(36,38)
(37,15)-(37,25)
(37,15)-(37,35)
(37,15)-(37,35)
(37,15)-(37,35)
(37,26)-(37,30)
(37,31)-(37,35)
(38,15)-(38,26)
(38,15)-(38,46)
(38,15)-(38,46)
(38,15)-(38,46)
(38,15)-(38,46)
(38,15)-(38,46)
(38,27)-(38,31)
(38,32)-(38,36)
(38,37)-(38,41)
(38,42)-(38,46)
(39,15)-(39,24)
(39,15)-(39,29)
(39,25)-(39,29)
(40,15)-(40,25)
(40,15)-(40,40)
(40,15)-(40,40)
(40,26)-(40,30)
(40,31)-(40,35)
(40,36)-(40,40)
*)
