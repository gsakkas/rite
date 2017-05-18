
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
