
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
(35,12)-(35,42)
buildAverage (build (rand , d) , build (rand , d))
AppG (fromList [TupleG (fromList [EmptyG])])

(35,26)-(35,31)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(35,26)-(35,31)
(build (rand , d) , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

(37,12)-(37,40)
buildTimes (build (rand , d) , build (rand , d))
AppG (fromList [TupleG (fromList [EmptyG])])

(37,24)-(37,29)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(37,24)-(37,29)
(build (rand , d) , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

*)
