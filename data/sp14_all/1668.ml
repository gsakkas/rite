
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Magic of expr
  | Weird of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildMagic e1 = Magic e1;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildWeird (e1,e2,e3,e4) = Weird (e1, e2, e3);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then buildX ()
  else
    (match rand (1, 10) with
     | 1 -> buildSine (build (rand, (depth - 1)))
     | 2 -> buildCosine (build (rand, (depth - 1)))
     | 3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 -> buildX ()
     | 7 -> buildY ()
     | 8 -> buildMagic (build (rand, (depth - 1)))
     | 9 ->
         buildWeird
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
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
  | Magic of expr
  | Weird of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildMagic e1 = Magic e1;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildWeird (e1,e2,e3) = Weird (e1, e2, e3);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then buildX ()
  else
    (match rand (1, 10) with
     | 1 -> buildSine (build (rand, (depth - 1)))
     | 2 -> buildCosine (build (rand, (depth - 1)))
     | 3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 -> buildX ()
     | 7 -> buildY ()
     | 8 -> buildMagic (build (rand, (depth - 1)))
     | 9 ->
         buildWeird
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | _ -> buildX ());;

*)

(* changed spans
(25,17)-(25,50)
fun (e1 , e2 , e3) ->
  Weird (e1 , e2 , e3)
LamG (TuplePatG (fromList [VarPatG])) (ConAppG (Just EmptyG))

*)

(* type error slice
(25,4)-(25,52)
(25,17)-(25,50)
(52,10)-(52,20)
(52,10)-(54,42)
(53,12)-(54,42)
*)
