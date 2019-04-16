
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | Oscillate of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCirc (c1,c2) = Circ (c1, c2);;

let buildCosine e = Cosine e;;

let buildOscillate n = Oscillate n;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    match rand (0, 2) with | 0 -> buildX () | 1 -> buildY () | _ -> buildX ()
  else
    (match rand (0, 25) with
     | 0 ->
         if depth < 5
         then buildX ()
         else
           buildCirc
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 1 ->
         if depth < 5
         then buildY ()
         else
           buildCirc
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 2|7|8 -> buildSine (build (rand, (depth - 1)))
     | 3|9|13 -> buildCosine (build (rand, (depth - 1)))
     | 4|10|14 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5|11|15 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6|12 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 17|18|19|23|25 -> buildCirc (build (rand, (depth - 1)))
     | 20|21|22|16 -> buildOscillate (build (rand, (depth - 1)))
     | _ -> buildX ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr
  | Oscillate of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCirc c1 = Circ c1;;

let buildCosine e = Cosine e;;

let buildOscillate n = Oscillate n;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    match rand (0, 2) with | 0 -> buildX () | 1 -> buildY () | _ -> buildX ()
  else
    (match rand (0, 25) with
     | 0 ->
         if depth < 5
         then buildX ()
         else buildCirc (build (rand, (depth - 1)))
     | 1 ->
         if depth < 5
         then buildY ()
         else buildCirc (build (rand, (depth - 1)))
     | 2|7|8 -> buildSine (build (rand, (depth - 1)))
     | 3|9|13 -> buildCosine (build (rand, (depth - 1)))
     | 4|10|14 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5|11|15 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6|12 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 17|18|19|23|25 -> buildCirc (build (rand, (depth - 1)))
     | 20|21|22|16 -> buildOscillate (build (rand, (depth - 1)))
     | _ -> buildX ());;

*)

(* changed spans
(15,16)-(15,38)
fun c1 -> Circ c1
LamG VarPatG (ConAppG (Just EmptyG))

(42,14)-(42,72)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(48,14)-(48,72)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(41,12)-(41,21)
(41,12)-(42,72)
(42,14)-(42,72)
(42,44)-(42,71)
(42,45)-(42,50)
(61,26)-(61,35)
(61,26)-(61,63)
(61,36)-(61,63)
(61,37)-(61,42)
*)
