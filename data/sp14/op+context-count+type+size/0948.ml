
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
(26,2)-(40,42)
(26,18)-(37,61)
(27,4)-(37,61)
(27,10)-(27,11)
(30,36)-(30,37)
(31,38)-(31,39)
(32,40)-(32,41)
(32,65)-(32,66)
(33,38)-(33,39)
(33,63)-(33,64)
(36,26)-(36,27)
(36,51)-(36,52)
(37,27)-(37,28)
(37,52)-(37,53)
(37,56)-(37,57)
(38,2)-(40,42)
(38,5)-(38,14)
(39,7)-(39,42)
(39,8)-(39,34)
(39,9)-(39,19)
(39,20)-(39,33)
(39,21)-(39,25)
(39,26)-(39,32)
(39,27)-(39,28)
(39,30)-(39,31)
(39,36)-(39,41)
(40,7)-(40,42)
*)

(* type error slice
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(25,3)-(40,44)
(25,15)-(40,42)
(26,2)-(40,42)
(30,11)-(30,20)
(30,11)-(30,44)
(30,21)-(30,44)
(30,22)-(30,27)
(38,2)-(40,42)
(39,7)-(39,42)
*)
