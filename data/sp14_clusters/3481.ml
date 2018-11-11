
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
  match depth with
  | 0 -> (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ())
  | _ ->
      (match rand (0, 4) with
       | 0 -> buildSine (build (rand, (depth - 1)))
       | 1 -> buildCosine (build (rand, (depth - 1)))
       | 2 -> buildAverage (build (rand, (depth - 1)))
       | 3 -> buildTimes (build (rand, (depth - 1)))
       | 4 -> buildThresh (build (rand, (depth - 1))));;


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
  match depth with
  | 0 -> (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ())
  | _ ->
      (match rand (0, 4) with
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
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(32,27)-(32,54)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG [AppG [EmptyG],AppG [EmptyG]]

(33,14)-(33,24)
build
VarG

(33,14)-(33,24)
rand
VarG

(33,14)-(33,24)
depth
VarG

(33,14)-(33,24)
buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
AppG [TupleG [EmptyG,EmptyG]]

(33,14)-(33,24)
depth - 1
BopG VarG LitG

(33,14)-(33,24)
1
LitG

(33,14)-(33,24)
(rand , depth - 1)
TupleG [VarG,BopG EmptyG EmptyG]

(33,25)-(33,52)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG [AppG [EmptyG],AppG [EmptyG]]

(34,14)-(34,25)
build
VarG

(34,14)-(34,25)
rand
VarG

(34,14)-(34,25)
depth
VarG

(34,14)-(34,25)
buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
AppG [TupleG [EmptyG,EmptyG,EmptyG,EmptyG]]

(34,14)-(34,25)
depth - 1
BopG VarG LitG

(34,14)-(34,25)
1
LitG

(34,14)-(34,25)
(rand , depth - 1)
TupleG [VarG,BopG EmptyG EmptyG]

(34,26)-(34,53)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG [AppG [EmptyG],AppG [EmptyG],AppG [EmptyG],AppG [EmptyG]]

*)
