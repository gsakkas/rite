
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let pi = 4.0 *. (atan 1.0);;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (1, 3) with | 1 -> buildX () | _ -> buildY ())
  | _ ->
      (match rand (1, 10) with
       | 1 -> buildSine (pi *. (build (rand, (depth - 1))))
       | 2 -> buildCosine (pi *. (build (rand, (depth - 1))))
       | 3 -> buildSine (pi *. (build (rand, (depth - 1))))
       | 4 -> buildCosine (pi *. (build (rand, (depth - 1))))
       | 5 -> buildSine (pi *. (build (rand, (depth - 1))))
       | 6 -> buildCosine (pi *. (build (rand, (depth - 1))))
       | 7 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 8 -> buildX ()
       | 9 -> buildY ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (1, 3) with | 1 -> buildX () | _ -> buildY ())
  | _ ->
      (match rand (1, 13) with
       | 1 -> buildSine (build (rand, (depth - 1)))
       | 2 -> buildCosine (build (rand, (depth - 1)))
       | 3 -> buildSine (build (rand, (depth - 1)))
       | 4 -> buildCosine (build (rand, (depth - 1)))
       | 5 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 6 -> buildSine (build (rand, (depth - 1)))
       | 7 -> buildCosine (build (rand, (depth - 1)))
       | 8 -> buildSine (build (rand, (depth - 1)))
       | 9 -> buildCosine (build (rand, (depth - 1)))
       | 10 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 11 -> buildX ()
       | 12 -> buildY ());;

*)

(* changed spans
(27,6)-(39,24)
match rand (1 , 13) with
| 1 -> buildSine (build (rand , depth - 1))
| 2 -> buildCosine (build (rand , depth - 1))
| 3 -> buildSine (build (rand , depth - 1))
| 4 -> buildCosine (build (rand , depth - 1))
| 5 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildSine (build (rand , depth - 1))
| 7 -> buildCosine (build (rand , depth - 1))
| 8 -> buildSine (build (rand , depth - 1))
| 9 -> buildCosine (build (rand , depth - 1))
| 10 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| 11 -> buildX ()
| 12 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(27,22)-(27,24)
13
LitG

(32,14)-(32,23)
buildThresh
VarG

(32,14)-(32,23)
build
VarG

(32,14)-(32,23)
rand
VarG

(32,14)-(32,23)
depth
VarG

(32,14)-(32,23)
build
VarG

(32,14)-(32,23)
rand
VarG

(32,14)-(32,23)
depth
VarG

(32,14)-(32,23)
build
VarG

(32,14)-(32,23)
rand
VarG

(32,14)-(32,23)
depth
VarG

(32,14)-(32,23)
build
VarG

(32,14)-(32,23)
rand
VarG

(32,14)-(32,23)
depth
VarG

(32,14)-(32,23)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(32,14)-(32,23)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(32,14)-(32,23)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(32,14)-(32,23)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(32,14)-(32,23)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(32,14)-(32,23)
depth - 1
BopG VarG LitG

(32,14)-(32,23)
depth - 1
BopG VarG LitG

(32,14)-(32,23)
depth - 1
BopG VarG LitG

(32,14)-(32,23)
depth - 1
BopG VarG LitG

(32,14)-(32,23)
1
LitG

(32,14)-(32,23)
1
LitG

(32,14)-(32,23)
1
LitG

(32,14)-(32,23)
1
LitG

(32,14)-(32,23)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

(32,14)-(32,23)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(32,14)-(32,23)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(32,14)-(32,23)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(32,14)-(32,23)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(35,11)-(35,22)
buildSine
VarG

(35,11)-(35,22)
build
VarG

(35,11)-(35,22)
rand
VarG

(35,11)-(35,22)
depth
VarG

(35,11)-(35,22)
buildCosine
VarG

(35,11)-(35,22)
build
VarG

(35,11)-(35,22)
rand
VarG

(35,11)-(35,22)
depth
VarG

(35,11)-(35,22)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(35,11)-(35,22)
buildCosine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(35,11)-(35,22)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(35,11)-(35,22)
buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(35,11)-(35,22)
depth - 1
BopG VarG LitG

(35,11)-(35,22)
depth - 1
BopG VarG LitG

(35,11)-(35,22)
1
LitG

(35,11)-(35,22)
1
LitG

(35,11)-(35,22)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(35,11)-(35,22)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)
