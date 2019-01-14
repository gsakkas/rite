
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Special1 of expr* expr* expr
  | Special2 of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildSpecial1 (e1,e2,e3) = Special1 (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth < 1
  then
    let base = rand (0, 2) in
    match base with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | _ -> (if base < 0 then buildX () else buildY ())
  else
    (let recurse = rand (0, 6) in
     match recurse with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildSpecial1
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ ->
         if recurse > 2
         then buildCosine (build (rand, (depth - 1)))
         else buildSine (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Special1 of expr* expr* expr
  | Special2 of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildSpecial1 (e1,e2,e3) = Special1 (e1, e2, e3);;

let buildSpecial2 (e1,e2) = Special2 (e1, e2);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth < 1
  then
    let base = rand (0, 2) in
    match base with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | _ -> (if base < 0 then buildX () else buildY ())
  else
    (let recurse = rand (0, 6) in
     match recurse with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildSpecial1
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | 6 ->
         buildSpecial2
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ ->
         if recurse > 2
         then buildCosine (build (rand, (depth - 1)))
         else buildSine (build (rand, (depth - 1))));;

*)

(* changed spans
(21,17)-(21,67)
e1
VarG

(21,17)-(21,67)
e2
VarG

(21,17)-(21,67)
fun (e1 , e2) ->
  Special2 (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(21,17)-(21,67)
Special2 (e1 , e2)
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(39,5)-(58,51)
match recurse with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildSpecial1 (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildSpecial2 (build (rand , depth - 1) , build (rand , depth - 1))
| _ -> if recurse > 2
       then buildCosine (build (rand , depth - 1))
       else buildSine (build (rand , depth - 1))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,IteG EmptyG EmptyG EmptyG)])

(54,11)-(54,69)
build
VarG

(54,11)-(54,69)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(54,11)-(54,69)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

(54,12)-(54,39)
rand
VarG

(54,12)-(54,39)
depth
VarG

(54,12)-(54,39)
depth - 1
BopG VarG LitG

(54,12)-(54,39)
1
LitG

(56,9)-(58,51)
buildSpecial2
VarG

(56,9)-(58,51)
build
VarG

(56,9)-(58,51)
rand
VarG

(56,9)-(58,51)
depth
VarG

(56,9)-(58,51)
build
VarG

(56,9)-(58,51)
rand
VarG

(56,9)-(58,51)
depth
VarG

(56,9)-(58,51)
buildSpecial2 (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(56,9)-(58,51)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(56,9)-(58,51)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(56,9)-(58,51)
depth - 1
BopG VarG LitG

(56,9)-(58,51)
depth - 1
BopG VarG LitG

(56,9)-(58,51)
1
LitG

(56,9)-(58,51)
1
LitG

(56,9)-(58,51)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

(56,9)-(58,51)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(56,9)-(58,51)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
