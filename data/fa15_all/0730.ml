
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
    let rand' = rand (1, 5) in
    match rand' with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 -> buildTimes ((build (rand, (depth - 1))), buildY)
    | 4 -> buildAverage ((build (rand, (depth - 1))), buildY)
    | 5 ->
        buildThresh
          (buildX, buildY, (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else buildX;;


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
    let rand' = rand (1, 5) in
    match rand' with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 -> buildTimes ((build (rand, (depth - 1))), (buildY ()))
    | 4 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
    | 5 ->
        buildThresh
          ((buildX ()), (buildY ()), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else buildX ();;

*)

(* changed spans
(32,52)-(32,58)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(33,11)-(33,61)
()
ConAppG Nothing (Just (TApp "unit" []))

(33,54)-(33,60)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(35,8)-(37,40)
()
ConAppG Nothing (Just (TApp "unit" []))

(36,11)-(36,17)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(36,19)-(36,25)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(36,19)-(36,25)
()
ConAppG Nothing (Just (TApp "unit" []))

(36,27)-(36,54)
()
ConAppG Nothing (Just (TApp "unit" []))

(38,7)-(38,13)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

*)
