
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
(28,12)-(28,21)
(28,17)-(28,21)
(30,12)-(30,21)
(30,17)-(30,21)
(33,3)-(47,48)
(35,8)-(47,48)
(36,15)-(36,21)
(37,15)-(37,21)
(39,12)-(47,48)
(43,34)-(43,38)
(43,40)-(43,44)
(44,32)-(44,36)
(44,38)-(44,42)
*)

(* type error slice
(14,4)-(14,46)
(14,19)-(14,43)
(14,37)-(14,39)
(14,41)-(14,43)
(16,4)-(16,31)
(16,17)-(16,29)
(16,28)-(16,29)
(18,4)-(18,49)
(18,17)-(18,46)
(18,36)-(18,38)
(18,40)-(18,42)
(18,44)-(18,46)
(20,4)-(20,27)
(20,15)-(20,25)
(20,24)-(20,25)
(22,4)-(22,33)
(22,15)-(22,30)
(22,29)-(22,30)
(24,4)-(24,70)
(24,18)-(24,67)
(24,47)-(24,48)
(24,50)-(24,51)
(24,53)-(24,59)
(24,61)-(24,67)
(26,4)-(26,42)
(26,17)-(26,39)
(26,33)-(26,35)
(26,37)-(26,39)
(28,4)-(28,23)
(28,12)-(28,21)
(30,4)-(30,23)
(30,12)-(30,21)
(32,16)-(47,48)
(33,3)-(47,48)
(33,9)-(33,14)
(35,8)-(47,48)
(35,8)-(47,48)
(35,8)-(47,48)
(35,14)-(35,18)
(35,14)-(35,24)
(36,15)-(36,21)
(37,15)-(37,21)
(39,12)-(47,48)
(39,12)-(47,48)
(39,23)-(39,28)
(39,23)-(39,46)
(39,23)-(39,46)
(39,30)-(39,34)
(39,30)-(39,46)
(39,37)-(39,42)
(40,13)-(47,48)
(40,13)-(47,48)
(40,13)-(47,48)
(40,13)-(47,48)
(40,13)-(47,48)
(40,13)-(47,48)
(40,13)-(47,48)
(40,19)-(40,23)
(40,19)-(40,29)
(41,20)-(41,29)
(41,20)-(41,34)
(41,30)-(41,34)
(42,20)-(42,31)
(42,20)-(42,36)
(43,20)-(43,32)
(43,20)-(43,44)
(44,20)-(44,30)
(44,20)-(44,42)
(45,20)-(45,31)
(45,20)-(45,55)
(46,20)-(46,29)
(46,20)-(46,34)
(47,20)-(47,30)
(47,20)-(47,48)
*)
