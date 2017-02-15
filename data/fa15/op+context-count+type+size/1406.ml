
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
    let r = rand (0, 26) in
    let d = depth - 1 in
    match r with
    | 0 -> buildSine (build (rand, d))
    | 1 -> buildSine (build (rand, d))
    | 2 -> buildSine (build (rand, d))
    | 3 -> buildSine (build (rand, d))
    | 4 -> buildSine (build (rand, d))
    | 5 -> buildSine (build (rand, d))
    | 6 -> buildCosine (build (rand, d))
    | 7 -> buildCosine (build (rand, d))
    | 8 -> buildCosine (build (rand, d))
    | 9 -> buildCosine (build (rand, d))
    | 10 -> buildCosine (build (rand, d))
    | 11 -> buildTimes (build (rand, d))
    | 12 -> buildTimes (build (rand, d))
    | 13 -> buildTimes (build (rand, d))
    | 14 -> buildTimes (build (rand, d))
    | 15 -> buildTimes (build (rand, d))
    | 16 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 17 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 18 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 19 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 20 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 21 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 22 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 23 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 24 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 25 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
  else
    (let r = rand (0, 1) in match r with | 0 -> buildX () | _ -> buildY ());;


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
    let r = rand (0, 26) in
    let d = depth - 1 in
    match r with
    | 0 -> buildSine (build (rand, d))
    | 1 -> buildSine (build (rand, d))
    | 2 -> buildSine (build (rand, d))
    | 3 -> buildSine (build (rand, d))
    | 4 -> buildSine (build (rand, d))
    | 5 -> buildSine (build (rand, d))
    | 6 -> buildCosine (build (rand, d))
    | 7 -> buildCosine (build (rand, d))
    | 8 -> buildCosine (build (rand, d))
    | 9 -> buildCosine (build (rand, d))
    | 10 -> buildCosine (build (rand, d))
    | 11 -> buildTimes ((buildX ()), (build (rand, d)))
    | 12 -> buildTimes ((buildX ()), (build (rand, d)))
    | 13 -> buildTimes ((buildX ()), (build (rand, d)))
    | 14 -> buildTimes ((buildX ()), (build (rand, d)))
    | 15 -> buildTimes ((buildX ()), (build (rand, d)))
    | 16 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 17 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 18 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 19 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 20 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 21 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 22 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 23 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 24 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
    | 25 ->
        buildThresh
          ((build (rand, d)), (buildX ()), (buildY ()), (buildX ()))
  else
    (let r = rand (0, 1) in match r with | 0 -> buildX () | _ -> buildY ());;

*)

(* changed spans
(42,23)-(42,40)
(42,24)-(42,29)
(43,23)-(43,40)
(43,24)-(43,29)
(44,23)-(44,40)
(44,24)-(44,29)
(45,23)-(45,40)
(45,24)-(45,29)
(46,23)-(46,40)
(46,24)-(46,29)
(66,44)-(66,50)
(66,51)-(66,53)
(66,57)-(66,63)
(66,64)-(66,66)
(68,13)-(68,17)
(68,13)-(68,24)
(68,18)-(68,24)
(68,19)-(68,20)
(68,22)-(68,23)
(68,28)-(68,74)
(68,34)-(68,35)
(68,48)-(68,54)
(68,48)-(68,57)
(68,55)-(68,57)
(68,65)-(68,71)
(68,65)-(68,74)
(68,72)-(68,74)
*)

(* type error slice
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(19,3)-(19,41)
(19,16)-(19,39)
(31,11)-(31,20)
(31,11)-(31,38)
(31,21)-(31,38)
(31,22)-(31,27)
(42,12)-(42,22)
(42,12)-(42,40)
(42,23)-(42,40)
(42,24)-(42,29)
(43,12)-(43,22)
(43,12)-(43,40)
(43,23)-(43,40)
(43,24)-(43,29)
(44,12)-(44,22)
(44,12)-(44,40)
(44,23)-(44,40)
(44,24)-(44,29)
(45,12)-(45,22)
(45,12)-(45,40)
(45,23)-(45,40)
(45,24)-(45,29)
(46,12)-(46,22)
(46,12)-(46,40)
(46,23)-(46,40)
(46,24)-(46,29)
*)
