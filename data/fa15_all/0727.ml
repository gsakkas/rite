
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
  if depth > 0
  then
    let rand' = rand (1, 5) in
    match rand' with
    | 1 -> buildSine build (rand', (depth - 1))
    | 2 -> buildCosine build (rand', (depth - 1))
    | 3 -> buildTimes ((build (rand', (depth - 1))), buildY)
    | 4 -> buildAverage ((build (rand', (depth - 1))), buildY)
    | 5 ->
        buildThresh
          (buildX, buildY, (build (rand', (depth - 1))),
            (build (rand', (depth - 1))))
  else buildX;;


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
  if depth > 0
  then
    let rand' = rand (1, 5) in
    match rand' with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 -> buildTimes ((build (rand, (depth - 1))), (buildY ()))
    | 4 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
    | 5 ->
        buildThresh
          ((buildX ()), (buildY ()), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else buildX ();;

*)

(* changed spans
(30,12)-(30,48)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(31,12)-(31,50)
buildCosine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(32,32)-(32,37)
rand
VarG

(32,54)-(32,60)
buildY ()
AppG (fromList [ConAppG Nothing])

(33,34)-(33,39)
rand
VarG

(33,56)-(33,62)
buildY ()
AppG (fromList [ConAppG Nothing])

(36,12)-(36,18)
buildX ()
AppG (fromList [ConAppG Nothing])

(36,20)-(36,26)
buildY ()
AppG (fromList [ConAppG Nothing])

(36,36)-(36,41)
rand
VarG

(37,21)-(37,26)
rand
VarG

(38,8)-(38,14)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(11,28)-(11,44)
(11,41)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,68)
(17,39)-(17,68)
(17,50)-(17,51)
(19,4)-(19,42)
(19,17)-(19,40)
(19,26)-(19,40)
(19,37)-(19,39)
(23,4)-(23,23)
(23,12)-(23,21)
(25,4)-(38,16)
(25,16)-(38,14)
(30,12)-(30,21)
(30,12)-(30,48)
(30,22)-(30,27)
(31,12)-(31,23)
(31,12)-(31,50)
(32,12)-(32,22)
(32,12)-(32,61)
(32,23)-(32,61)
(32,24)-(32,52)
(32,25)-(32,30)
(32,54)-(32,60)
(33,12)-(33,24)
(33,12)-(33,63)
(33,25)-(33,63)
(33,26)-(33,54)
(33,27)-(33,32)
(33,56)-(33,62)
(35,9)-(35,20)
(35,9)-(37,42)
(36,11)-(37,42)
(36,20)-(36,26)
(36,28)-(36,56)
(36,29)-(36,34)
(37,13)-(37,41)
(37,14)-(37,19)
*)
