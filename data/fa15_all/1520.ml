
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

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (1, 7) with
    | 1 -> VarX
    | 2 -> VarY
    | 3 -> buildSine (build (rand, (depth - 1)))
    | 4 -> buildCosine (build (rand, (depth - 1)))
    | 5 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 7 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))));;


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
    match rand (1, 5) with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 4 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  else (match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ());;

*)

(* changed spans
(21,15)-(37,40)
fun () -> VarX
LamG (ConAppG Nothing Nothing)

(21,15)-(37,40)
fun () -> VarY
LamG (ConAppG Nothing Nothing)

(21,15)-(37,40)
VarX
ConAppG Nothing Nothing

(21,15)-(37,40)
VarY
ConAppG Nothing Nothing

(22,2)-(37,40)
build
VarG

(22,2)-(37,40)
rand
VarG

(22,2)-(37,40)
depth
VarG

(22,2)-(37,40)
rand
VarG

(22,2)-(37,40)
buildX
VarG

(22,2)-(37,40)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,2)-(37,40)
rand (1 , 2)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,2)-(37,40)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(22,2)-(37,40)
depth - 1
BopG VarG LitG

(22,2)-(37,40)
1
LitG

(22,2)-(37,40)
1
LitG

(22,2)-(37,40)
2
LitG

(22,2)-(37,40)
match rand (1 , 2) with
| 1 -> buildX ()
| 2 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(22,2)-(37,40)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(22,2)-(37,40)
(1 , 2)
TupleG (fromList [LitG])

(24,4)-(37,40)
match rand (1 , 5) with
| 1 -> buildSine (build (rand , depth - 1))
| 2 -> buildCosine (build (rand , depth - 1))
| 3 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(26,11)-(26,15)
5
LitG

(36,10)-(37,40)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

*)
