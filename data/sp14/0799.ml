
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

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (1, 2) with | 1 -> buildX | 2 -> buildY)
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
  | 0 -> (match rand (1, 2) with | 1 -> VarX | 2 -> VarY)
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
(28,11)-(28,20)
(28,16)-(28,20)
(30,11)-(30,20)
(30,16)-(30,20)
(34,40)-(34,46)
(34,54)-(34,60)
(36,6)-(44,44)
*)

(* type error slice
(20,3)-(20,26)
(20,14)-(20,24)
(20,18)-(20,24)
(20,23)-(20,24)
(28,3)-(28,22)
(28,11)-(28,20)
(32,3)-(44,46)
(32,15)-(44,44)
(33,2)-(44,44)
(34,9)-(34,61)
(34,40)-(34,46)
(36,6)-(44,44)
(36,17)-(36,22)
(36,17)-(36,42)
(37,6)-(44,44)
(38,14)-(38,23)
(38,14)-(38,28)
(38,24)-(38,28)
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
(28,11)-(28,20)
(28,16)-(28,20)
(30,11)-(30,20)
(30,16)-(30,20)
(32,15)-(44,44)
(33,2)-(44,44)
(33,8)-(33,13)
(34,9)-(34,61)
(34,16)-(34,27)
(34,16)-(34,20)
(34,21)-(34,27)
(34,22)-(34,23)
(34,25)-(34,26)
(34,40)-(34,46)
(34,54)-(34,60)
(36,6)-(44,44)
(36,17)-(36,42)
(36,17)-(36,22)
(36,23)-(36,42)
(36,24)-(36,28)
(36,30)-(36,41)
(36,31)-(36,36)
(36,39)-(36,40)
(37,6)-(44,44)
(37,13)-(37,24)
(37,13)-(37,17)
(37,18)-(37,24)
(37,19)-(37,20)
(37,22)-(37,23)
(38,14)-(38,28)
(38,14)-(38,23)
(38,24)-(38,28)
(39,14)-(39,30)
(39,14)-(39,25)
(39,26)-(39,30)
(40,14)-(40,39)
(40,14)-(40,26)
(40,27)-(40,39)
(40,28)-(40,32)
(40,34)-(40,38)
(41,14)-(41,37)
(41,14)-(41,24)
(41,25)-(41,37)
(41,26)-(41,30)
(41,32)-(41,36)
(42,14)-(42,50)
(42,14)-(42,25)
(42,26)-(42,50)
(42,27)-(42,31)
(42,33)-(42,37)
(42,39)-(42,43)
(42,45)-(42,49)
(43,14)-(43,28)
(43,14)-(43,23)
(43,24)-(43,28)
(44,14)-(44,43)
(44,14)-(44,24)
(44,25)-(44,43)
(44,26)-(44,30)
(44,32)-(44,36)
(44,38)-(44,42)
*)
