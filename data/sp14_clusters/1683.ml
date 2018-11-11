
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
    let depth = depth - 1 in
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, depth))
    | 1 -> buildCosine (build (rand, depth))
    | 2 -> buildAverage (build (rand, depth))
    | 3 -> buildTimes (build (rand, depth))
    | 4 -> buildThresh (build (rand, depth));;


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
    let depth = depth - 1 in
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, depth))
    | 1 -> buildCosine (build (rand, depth))
    | 2 -> buildAverage ((build (rand, depth)), (build (rand, depth)))
    | 3 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
    | 4 ->
        buildThresh
          ((build (rand, depth)), (build (rand, depth)),
            (build (rand, depth)), (build (rand, depth)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(21,15)-(30,44)
fun () -> VarX
LamG (ConAppG Nothing Nothing)

(21,15)-(30,44)
fun () -> VarY
LamG (ConAppG Nothing Nothing)

(21,15)-(30,44)
VarX
ConAppG Nothing Nothing

(21,15)-(30,44)
VarY
ConAppG Nothing Nothing

(22,2)-(30,44)
build
VarG

(22,2)-(30,44)
rand
VarG

(22,2)-(30,44)
depth
VarG

(22,2)-(30,44)
build
VarG

(22,2)-(30,44)
rand
VarG

(22,2)-(30,44)
depth
VarG

(22,2)-(30,44)
build
VarG

(22,2)-(30,44)
rand
VarG

(22,2)-(30,44)
depth
VarG

(22,2)-(30,44)
rand
VarG

(22,2)-(30,44)
buildX
VarG

(22,2)-(30,44)
build (rand , depth)
AppG [TupleG [EmptyG,EmptyG]]

(22,2)-(30,44)
build (rand , depth)
AppG [TupleG [EmptyG,EmptyG]]

(22,2)-(30,44)
build (rand , depth)
AppG [TupleG [EmptyG,EmptyG]]

(22,2)-(30,44)
rand (0 , 1)
AppG [TupleG [EmptyG,EmptyG]]

(22,2)-(30,44)
buildX ()
AppG [ConAppG Nothing (Just (TApp "unit" []))]

(22,2)-(30,44)
0
LitG

(22,2)-(30,44)
1
LitG

(22,2)-(30,44)
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
CaseG (AppG [EmptyG]) [(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG])]

(22,2)-(30,44)
(rand , depth)
TupleG [VarG,VarG]

(22,2)-(30,44)
(rand , depth)
TupleG [VarG,VarG]

(22,2)-(30,44)
(rand , depth)
TupleG [VarG,VarG]

(22,2)-(30,44)
(0 , 1)
TupleG [LitG,LitG]

(28,24)-(28,45)
(build (rand , depth) , build (rand , depth))
TupleG [AppG [EmptyG],AppG [EmptyG]]

(29,11)-(29,21)
build
VarG

(29,11)-(29,21)
rand
VarG

(29,11)-(29,21)
depth
VarG

(29,11)-(29,21)
buildTimes (build (rand , depth) , build (rand , depth))
AppG [TupleG [EmptyG,EmptyG]]

(29,11)-(29,21)
(rand , depth)
TupleG [VarG,VarG]

(29,22)-(29,43)
(build (rand , depth) , build (rand , depth))
TupleG [AppG [EmptyG],AppG [EmptyG]]

(30,11)-(30,22)
build
VarG

(30,11)-(30,22)
rand
VarG

(30,11)-(30,22)
depth
VarG

(30,11)-(30,22)
buildThresh (build (rand , depth) , build (rand , depth) , build (rand , depth) , build (rand , depth))
AppG [TupleG [EmptyG,EmptyG,EmptyG,EmptyG]]

(30,11)-(30,22)
(rand , depth)
TupleG [VarG,VarG]

(30,23)-(30,44)
(build (rand , depth) , build (rand , depth) , build (rand , depth) , build (rand , depth))
TupleG [AppG [EmptyG],AppG [EmptyG],AppG [EmptyG],AppG [EmptyG]]

*)
