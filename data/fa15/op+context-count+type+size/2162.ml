
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
  let r = rand (0, 10) in
  let d = depth - 1 in
  if d > 0
  then
    match r with
    | 0 -> buildSine (build (rand, d))
    | 1 -> buildSine (build (rand, d))
    | 2 -> buildCosine (build (rand, d))
    | 3 -> buildCosine (build (rand, d))
    | 4 -> ((buildAverage build (rand, d)), (build (rand, d)))
    | 5 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 6 -> ((buildTimes build (rand, d)), (build (rand, d)))
    | 7 -> buildTimes ((build (rand, d)), (build (rand, d)))
    | 8 ->
        buildThresh
          ((build (rand, d)), (build (rand, d)), (build (rand, d)),
            (build (rand, d)))
    | 9 ->
        buildThresh
          ((build (rand, d)), (build (rand, d)), (build (rand, d)),
            (build (rand, d)))
    | 10 ->
        buildThresh
          ((build (rand, d)), (build (rand, d)), (build (rand, d)),
            (build (rand, d)))
  else
    (let rr = rand (1, 2) in match rr with | 1 -> buildX () | 2 -> buildY ());;


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
  let r = rand (0, 10) in
  let d = depth - 1 in
  if d > 0
  then
    match r with
    | 0 -> buildSine (build (rand, d))
    | 1 -> buildSine (build (rand, d))
    | 2 -> buildCosine (build (rand, d))
    | 3 -> buildCosine (build (rand, d))
    | 4 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 5 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 6 -> buildTimes ((build (rand, d)), (build (rand, d)))
    | 7 -> buildTimes ((build (rand, d)), (build (rand, d)))
    | 8 ->
        buildThresh
          ((build (rand, d)), (build (rand, d)), (build (rand, d)),
            (build (rand, d)))
    | 9 ->
        buildThresh
          ((build (rand, d)), (build (rand, d)), (build (rand, d)),
            (build (rand, d)))
    | 10 ->
        buildThresh
          ((build (rand, d)), (build (rand, d)), (build (rand, d)),
            (build (rand, d)))
  else
    (let rr = rand (1, 2) in match rr with | 1 -> buildX () | 2 -> buildY ());;

*)

(* changed spans
(35,14)-(35,41)
(35,14)-(35,60)
(35,27)-(35,32)
(37,14)-(37,39)
(37,14)-(37,58)
(37,25)-(37,30)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(19,4)-(19,42)
(19,17)-(19,39)
(19,26)-(19,39)
(31,23)-(31,28)
(31,23)-(31,37)
(35,14)-(35,26)
(35,14)-(35,41)
(35,27)-(35,32)
(37,14)-(37,24)
(37,14)-(37,39)
(37,25)-(37,30)
*)
