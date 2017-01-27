
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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        (if depth = 0
         then buildX ()
         else
           ((build (rand, (depth - 1))),
             (if depth = 0 then buildY () else build (rand, (depth - 1)))))
  | 6 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
  | 7 ->
      buildThresh
        ((build (rand, depth)), (build (rand, depth)), (build (rand, depth)),
          (build (rand, depth)));;


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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
  | 7 ->
      buildThresh
        ((build (rand, depth)), (build (rand, depth)), (build (rand, depth)),
          (build (rand, depth)));;

*)

(* changed spans
(36,10)-(40,71)
(39,14)-(40,71)
(41,23)-(41,41)
(41,46)-(41,64)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(23,17)-(23,21)
(26,9)-(26,13)
(26,9)-(26,19)
(26,15)-(26,16)
(26,15)-(26,19)
(26,18)-(26,19)
(30,51)-(30,56)
(30,51)-(30,74)
(30,58)-(30,62)
(30,58)-(30,74)
(30,65)-(30,74)
(35,7)-(35,19)
(35,7)-(40,71)
(36,10)-(40,71)
(37,15)-(37,21)
(37,15)-(37,24)
(37,22)-(37,24)
(39,14)-(39,19)
(39,14)-(39,37)
(39,14)-(40,71)
(39,21)-(39,25)
(39,21)-(39,37)
(39,28)-(39,37)
(40,15)-(40,71)
(40,33)-(40,39)
(40,33)-(40,42)
(40,40)-(40,42)
*)
