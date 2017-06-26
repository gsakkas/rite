
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
  | 0 ->
      (match rand (1, 2) with
       | 1 -> buildX
       | 2 -> buildY
       | _ ->
           let next = build (rand, (depth - 1)) in
           (match rand (1, 7) with
            | 1 -> buildSine next
            | 2 -> buildCosine next
            | 3 -> buildAverage (next, next)
            | 4 -> buildTimes (next, next)
            | 5 -> buildThresh (next, next, next, next)
            | 6 -> buildSqrt next
            | 7 -> buildGauss (next, next, next)));;


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
(33,2)-(47,50)
(35,6)-(47,50)
(36,14)-(36,20)
(37,14)-(37,20)
(39,11)-(47,49)
*)

(* type error slice
(20,3)-(20,26)
(20,14)-(20,24)
(20,18)-(20,24)
(20,23)-(20,24)
(28,3)-(28,22)
(28,11)-(28,20)
(32,3)-(47,52)
(32,15)-(47,50)
(33,2)-(47,50)
(35,6)-(47,50)
(36,14)-(36,20)
(39,11)-(47,49)
(39,22)-(39,27)
(39,22)-(39,47)
(40,11)-(47,49)
(41,19)-(41,28)
(41,19)-(41,33)
(41,29)-(41,33)
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
(32,15)-(47,50)
(33,2)-(47,50)
(33,8)-(33,13)
(35,6)-(47,50)
(35,13)-(35,24)
(35,13)-(35,17)
(35,18)-(35,24)
(35,19)-(35,20)
(35,22)-(35,23)
(36,14)-(36,20)
(37,14)-(37,20)
(39,11)-(47,49)
(39,22)-(39,47)
(39,22)-(39,27)
(39,28)-(39,47)
(39,29)-(39,33)
(39,35)-(39,46)
(39,36)-(39,41)
(39,44)-(39,45)
(40,11)-(47,49)
(40,18)-(40,29)
(40,18)-(40,22)
(40,23)-(40,29)
(40,24)-(40,25)
(40,27)-(40,28)
(41,19)-(41,33)
(41,19)-(41,28)
(41,29)-(41,33)
(42,19)-(42,35)
(42,19)-(42,30)
(42,31)-(42,35)
(43,19)-(43,44)
(43,19)-(43,31)
(43,32)-(43,44)
(43,33)-(43,37)
(43,39)-(43,43)
(44,19)-(44,42)
(44,19)-(44,29)
(44,30)-(44,42)
(44,31)-(44,35)
(44,37)-(44,41)
(45,19)-(45,55)
(45,19)-(45,30)
(45,31)-(45,55)
(45,32)-(45,36)
(45,38)-(45,42)
(45,44)-(45,48)
(45,50)-(45,54)
(46,19)-(46,33)
(46,19)-(46,28)
(46,29)-(46,33)
(47,19)-(47,48)
(47,19)-(47,29)
(47,30)-(47,48)
(47,31)-(47,35)
(47,37)-(47,41)
(47,43)-(47,47)
*)
