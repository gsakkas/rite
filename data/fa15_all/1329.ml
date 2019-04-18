
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then match rand (0, 1) with | 0 -> buildX | 1 -> buildY
  else
    (match rand (2, 7) with
     | 2 -> buildSine build (rand, (depth - 1))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ()
  else
    (match rand (0, 7) with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(27,38)-(27,44)
buildX ()
AppG (fromList [ConAppG Nothing])

(27,52)-(27,58)
buildY ()
AppG (fromList [ConAppG Nothing])

(29,5)-(41,72)
match rand (0 , 7) with
| 0 -> buildX ()
| 1 -> buildY ()
| 2 -> buildSine (build (rand , depth - 1))
| 3 -> buildCosine (build (rand , depth - 1))
| 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])

(29,18)-(29,19)
0
LitG

(30,13)-(30,48)
buildX ()
AppG (fromList [ConAppG Nothing])

(31,13)-(31,52)
buildY ()
AppG (fromList [ConAppG Nothing])

(33,10)-(34,70)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(36,10)-(37,70)
buildCosine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(39,10)-(41,71)
buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(21,4)-(21,23)
(21,12)-(21,21)
(25,4)-(41,74)
(25,16)-(41,72)
(26,3)-(41,72)
(27,8)-(27,58)
(27,38)-(27,44)
(29,5)-(41,72)
(30,13)-(30,22)
(30,13)-(30,48)
(30,23)-(30,28)
(31,13)-(31,24)
(31,13)-(31,52)
(31,25)-(31,52)
(31,26)-(31,31)
(34,13)-(34,40)
(34,14)-(34,19)
(34,42)-(34,69)
(34,43)-(34,48)
(37,13)-(37,40)
(37,14)-(37,19)
(37,42)-(37,69)
(37,43)-(37,48)
(40,13)-(40,40)
(40,14)-(40,19)
(40,42)-(40,69)
(40,43)-(40,48)
(41,14)-(41,41)
(41,15)-(41,20)
(41,43)-(41,70)
(41,44)-(41,49)
*)
