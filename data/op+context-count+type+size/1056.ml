
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
  let case = 0 in
  if depth = 0
  then case = (rand (0, 1))
  else
    (let case = rand (0, 6) in
     match case with
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
  let case = rand (0, 6) in
  match case with
  | 0 -> buildX ()
  | 1 -> buildY ()
  | 2 -> buildSine (build (rand, (depth - 1)))
  | 3 -> buildCosine (build (rand, (depth - 1)))
  | 4 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(26,14)-(26,15)
(27,3)-(45,67)
(27,6)-(27,11)
(27,6)-(27,15)
(27,14)-(27,15)
(28,8)-(28,12)
(28,8)-(28,26)
(28,25)-(28,26)
(30,6)-(45,67)
(30,17)-(30,21)
(30,17)-(30,27)
(30,23)-(30,24)
(30,23)-(30,27)
(38,14)-(38,37)
(38,43)-(38,66)
(41,14)-(41,37)
(41,43)-(41,66)
(45,44)-(45,67)
*)

(* type error slice
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(25,4)-(45,74)
(25,16)-(45,67)
(26,3)-(45,67)
(27,3)-(45,67)
(27,6)-(27,11)
(27,6)-(27,15)
(27,14)-(27,15)
(28,8)-(28,26)
(28,16)-(28,20)
(28,16)-(28,26)
(28,22)-(28,23)
(28,22)-(28,26)
(28,25)-(28,26)
(30,6)-(45,67)
(31,6)-(45,67)
(32,13)-(32,19)
(32,13)-(32,22)
(32,20)-(32,22)
(34,24)-(34,29)
(34,24)-(34,47)
(34,31)-(34,35)
(34,31)-(34,47)
(34,38)-(34,47)
*)
