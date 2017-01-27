
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
  let expChooser (r,d) =
    match r with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (d - 1)))
    | 3 -> buildCosine (build (rand, (d - 1)))
    | 4 -> buildAverage ((build (rand, (d - 1))), (build (rand, (d - 1))))
    | 5 -> buildTimes ((build (rand, (d - 1))), (build (rand, (d - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (d - 1))), (build (rand, (d - 1))),
            (build (rand, (d - 1))), (build (rand, (d - 1)))) in
  if depth < 1
  then ((expChooser (rand (0, 2))), depth)
  else ((expChooser (rand (2, 7))), depth);;


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
  let num = if depth < 1 then rand (0, 2) else rand (2, 7) in
  match num with
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
(26,19)-(37,58)
(27,5)-(37,58)
(27,11)-(27,12)
(30,37)-(30,38)
(31,39)-(31,40)
(32,41)-(32,42)
(32,66)-(32,67)
(33,39)-(33,40)
(33,64)-(33,65)
(36,27)-(36,28)
(36,52)-(36,53)
(37,28)-(37,29)
(37,53)-(37,54)
(37,57)-(37,58)
(38,3)-(40,42)
(38,6)-(38,15)
(39,10)-(39,20)
(39,10)-(39,32)
(39,10)-(39,42)
(39,22)-(39,26)
(39,22)-(39,32)
(39,28)-(39,29)
(39,28)-(39,32)
(39,31)-(39,32)
(39,37)-(39,42)
(40,10)-(40,42)
*)

(* type error slice
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(25,4)-(40,45)
(25,16)-(40,42)
(26,3)-(40,42)
(26,19)-(37,58)
(27,5)-(37,58)
(27,11)-(27,12)
(28,12)-(28,18)
(28,12)-(28,21)
(28,19)-(28,21)
(30,23)-(30,28)
(30,23)-(30,42)
(30,30)-(30,34)
(30,30)-(30,42)
(30,37)-(30,38)
(30,37)-(30,42)
(38,3)-(40,42)
(38,6)-(38,11)
(38,6)-(38,15)
(38,14)-(38,15)
(39,10)-(39,20)
(39,10)-(39,32)
(39,10)-(39,42)
(39,22)-(39,26)
(39,22)-(39,32)
(39,28)-(39,29)
(39,28)-(39,32)
(39,31)-(39,32)
(39,37)-(39,42)
*)
