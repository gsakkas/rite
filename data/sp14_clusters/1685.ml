
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
    | 2 -> buildAverage (build (rand, depth))
    | 3 -> buildTimes (build (rand, depth))
    | 4 -> buildThresh (build (rand, depth))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;


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
(32,24)-(32,45)
(build (rand , depth) , build (rand , depth))
TupleG [AppG [EmptyG],AppG [EmptyG]]

(33,11)-(33,21)
build
VarG

(33,11)-(33,21)
rand
VarG

(33,11)-(33,21)
depth
VarG

(33,11)-(33,21)
buildTimes (build (rand , depth) , build (rand , depth))
AppG [TupleG [EmptyG,EmptyG]]

(33,11)-(33,21)
(rand , depth)
TupleG [VarG,VarG]

(33,22)-(33,43)
(build (rand , depth) , build (rand , depth))
TupleG [AppG [EmptyG],AppG [EmptyG]]

(34,11)-(34,22)
build
VarG

(34,11)-(34,22)
rand
VarG

(34,11)-(34,22)
depth
VarG

(34,11)-(34,22)
buildThresh (build (rand , depth) , build (rand , depth) , build (rand , depth) , build (rand , depth))
AppG [TupleG [EmptyG,EmptyG,EmptyG,EmptyG]]

(34,11)-(34,22)
(rand , depth)
TupleG [VarG,VarG]

(34,23)-(34,44)
(build (rand , depth) , build (rand , depth) , build (rand , depth) , build (rand , depth))
TupleG [AppG [EmptyG],AppG [EmptyG],AppG [EmptyG],AppG [EmptyG]]

(35,7)-(35,65)
build
VarG

(35,7)-(35,65)
rand
VarG

(35,7)-(35,65)
depth
VarG

(35,7)-(35,65)
build
VarG

(35,7)-(35,65)
rand
VarG

(35,7)-(35,65)
depth
VarG

(35,7)-(35,65)
build
VarG

(35,7)-(35,65)
rand
VarG

(35,7)-(35,65)
depth
VarG

(35,7)-(35,65)
build (rand , depth)
AppG [TupleG [EmptyG,EmptyG]]

(35,7)-(35,65)
build (rand , depth)
AppG [TupleG [EmptyG,EmptyG]]

(35,7)-(35,65)
build (rand , depth)
AppG [TupleG [EmptyG,EmptyG]]

(35,7)-(35,65)
(rand , depth)
TupleG [VarG,VarG]

(35,7)-(35,65)
(rand , depth)
TupleG [VarG,VarG]

(35,7)-(35,65)
(rand , depth)
TupleG [VarG,VarG]

*)
