
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
(42,25)-(42,30)
(42,25)-(42,39)
(43,25)-(43,30)
(43,25)-(43,39)
(44,25)-(44,30)
(44,25)-(44,39)
(45,25)-(45,30)
(45,25)-(45,39)
(46,25)-(46,30)
(46,25)-(46,39)
(66,45)-(66,51)
(66,52)-(66,54)
(66,58)-(66,64)
(66,65)-(66,67)
(68,14)-(68,18)
(68,14)-(68,24)
(68,20)-(68,21)
(68,20)-(68,24)
(68,23)-(68,24)
(68,29)-(68,75)
(68,35)-(68,36)
(68,49)-(68,55)
(68,49)-(68,58)
(68,56)-(68,58)
(68,66)-(68,72)
(68,66)-(68,75)
(68,73)-(68,75)
*)

(* type error slice
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(19,4)-(19,42)
(19,17)-(19,39)
(31,12)-(31,21)
(31,12)-(31,37)
(31,23)-(31,28)
(31,23)-(31,37)
(42,13)-(42,23)
(42,13)-(42,39)
(42,25)-(42,30)
(42,25)-(42,39)
(43,13)-(43,23)
(43,13)-(43,39)
(43,25)-(43,30)
(43,25)-(43,39)
(44,13)-(44,23)
(44,13)-(44,39)
(44,25)-(44,30)
(44,25)-(44,39)
(45,13)-(45,23)
(45,13)-(45,39)
(45,25)-(45,30)
(45,25)-(45,39)
(46,13)-(46,23)
(46,13)-(46,39)
(46,25)-(46,30)
(46,25)-(46,39)
*)
