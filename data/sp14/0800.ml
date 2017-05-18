
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
(14,18)-(14,43)
(48,14)-(48,17)
*)

(* type error slice
(20,3)-(20,26)
(20,14)-(20,24)
(20,18)-(20,24)
(20,23)-(20,24)
(34,14)-(34,23)
(34,14)-(34,28)
(34,24)-(34,28)
(48,14)-(48,17)
(48,14)-(48,22)
(48,18)-(48,22)
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
(22,14)-(22,24)
(22,18)-(22,24)
(22,23)-(22,24)
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
(28,15)-(48,23)
(29,2)-(48,23)
(29,8)-(29,13)
(30,9)-(30,69)
(30,16)-(30,27)
(30,16)-(30,20)
(30,21)-(30,27)
(30,22)-(30,23)
(30,25)-(30,26)
(30,40)-(30,44)
(30,52)-(30,56)
(30,64)-(30,68)
(32,6)-(48,23)
(32,17)-(32,42)
(32,17)-(32,22)
(32,23)-(32,42)
(32,24)-(32,28)
(32,30)-(32,41)
(32,31)-(32,36)
(32,39)-(32,40)
(33,6)-(48,23)
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
(37,11)-(38,71)
(37,11)-(37,23)
(38,13)-(38,71)
(38,14)-(38,41)
(38,15)-(38,20)
(38,21)-(38,40)
(38,22)-(38,26)
(38,28)-(38,39)
(38,29)-(38,34)
(38,37)-(38,38)
(38,43)-(38,70)
(38,44)-(38,49)
(38,50)-(38,69)
(38,51)-(38,55)
(38,57)-(38,68)
(38,58)-(38,63)
(38,66)-(38,67)
(39,14)-(39,60)
(39,14)-(39,24)
(39,25)-(39,60)
(39,26)-(39,30)
(39,32)-(39,59)
(39,33)-(39,38)
(39,39)-(39,58)
(39,40)-(39,44)
(39,46)-(39,57)
(39,47)-(39,52)
(39,55)-(39,56)
(41,11)-(43,43)
(41,11)-(41,22)
(42,13)-(43,43)
(42,14)-(42,18)
(42,20)-(42,47)
(42,21)-(42,26)
(42,27)-(42,46)
(42,28)-(42,32)
(42,34)-(42,45)
(42,35)-(42,40)
(42,43)-(42,44)
(42,49)-(42,76)
(42,50)-(42,55)
(42,56)-(42,75)
(42,57)-(42,61)
(42,63)-(42,74)
(42,64)-(42,69)
(42,72)-(42,73)
(43,15)-(43,42)
(43,16)-(43,21)
(43,22)-(43,41)
(43,23)-(43,27)
(43,29)-(43,40)
(43,30)-(43,35)
(43,38)-(43,39)
(44,14)-(44,28)
(44,14)-(44,23)
(44,24)-(44,28)
(46,11)-(47,77)
(46,11)-(46,21)
(47,13)-(47,77)
(47,14)-(47,18)
(47,20)-(47,47)
(47,21)-(47,26)
(47,27)-(47,46)
(47,28)-(47,32)
(47,34)-(47,45)
(47,35)-(47,40)
(47,43)-(47,44)
(47,49)-(47,76)
(47,50)-(47,55)
(47,56)-(47,75)
(47,57)-(47,61)
(47,63)-(47,74)
(47,64)-(47,69)
(47,72)-(47,73)
(48,14)-(48,22)
(48,14)-(48,17)
(48,18)-(48,22)
*)
