
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
(buildX () , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

(42,24)-(42,29)
buildX
VarG

(42,24)-(42,29)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(42,24)-(42,29)
()
ConAppG Nothing (Just (TApp "unit" []))

(43,23)-(43,40)
(buildX () , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

(43,24)-(43,29)
buildX
VarG

(43,24)-(43,29)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(43,24)-(43,29)
()
ConAppG Nothing (Just (TApp "unit" []))

(44,23)-(44,40)
(buildX () , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

(44,24)-(44,29)
buildX
VarG

(44,24)-(44,29)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(44,24)-(44,29)
()
ConAppG Nothing (Just (TApp "unit" []))

(45,23)-(45,40)
(buildX () , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

(45,24)-(45,29)
buildX
VarG

(45,24)-(45,29)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(45,24)-(45,29)
()
ConAppG Nothing (Just (TApp "unit" []))

(46,23)-(46,40)
(buildX () , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

(46,24)-(46,29)
buildX
VarG

(46,24)-(46,29)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(46,24)-(46,29)
()
ConAppG Nothing (Just (TApp "unit" []))

*)
