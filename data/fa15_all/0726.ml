
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
    match rand with
    | 1 -> buildSine build (rand', (depth - 1))
    | 2 -> buildCosine build (rand', (depth - 1))
    | 3 -> buildTimes ((build (rand', (depth - 1))), buildY)
    | 4 -> buildAverage ((build (rand', (depth - 1))), buildY)
    | 5 ->
        buildThresh
          (buildX, buildY, (build (rand', (depth - 1))),
            (build (rand', (depth - 1))))
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
(30,11)-(30,20)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(30,11)-(30,47)
rand'
VarG

(30,21)-(30,26)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(30,28)-(30,33)
rand
VarG

(31,11)-(31,49)
buildCosine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(31,23)-(31,28)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(31,30)-(31,35)
rand
VarG

(32,31)-(32,36)
rand
VarG

(32,53)-(32,59)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(33,11)-(33,62)
()
ConAppG Nothing (Just (TApp "unit" []))

(33,33)-(33,38)
rand
VarG

(33,55)-(33,61)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(35,8)-(37,41)
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

(36,27)-(36,55)
()
ConAppG Nothing (Just (TApp "unit" []))

(36,35)-(36,40)
rand
VarG

(37,20)-(37,25)
rand
VarG

(38,7)-(38,13)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

*)
