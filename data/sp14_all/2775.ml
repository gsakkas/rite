
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

let rec build (rand,depth) =
  if depth <= 0
  then buildX ()
  else
    (match rand with
     | 0 -> buildSine (build ((rand (0, 5)), (depth - 1)))
     | 1 -> buildCosine (build ((rand (0, 5)), (depth - 1)))
     | 2 ->
         buildAverage
           ((build ((rand (0, 5)), (depth - 2))),
             (build ((rand (0, 5)), (depth - 2))))
     | 3 ->
         buildTimes
           ((build ((rand (0, 5)), (depth - 2))),
             (build ((rand (0, 5)), (depth - 2))))
     | 4 ->
         buildThresh
           ((build ((rand (0, 5)), (depth - 4))),
             (build ((rand (0, 5)), (depth - 4))),
             (build ((rand (0, 5)), (depth - 4))),
             (build ((rand (0, 5)), (depth - 4)))));;


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
  if depth <= 0
  then buildX ()
  else
    (match rand (0, 4) with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 4))), (build (rand, (depth - 4))),
             (build (rand, (depth - 4))), (build (rand, (depth - 4))))
     | _ -> buildY ());;

*)

(* changed spans
(27,5)-(43,52)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 2) , build (rand , depth - 2))
| 3 -> buildTimes (build (rand , depth - 2) , build (rand , depth - 2))
| 4 -> buildThresh (build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4))
| _ -> buildY ()
CaseG (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

(27,12)-(27,16)
rand (0 , 4)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,31)-(28,44)
rand
VarG

(29,33)-(29,46)
rand
VarG

(32,21)-(32,34)
rand
VarG

(33,22)-(33,35)
rand
VarG

(36,21)-(36,34)
rand
VarG

(37,22)-(37,35)
rand
VarG

(40,21)-(40,34)
rand
VarG

(41,22)-(41,35)
rand
VarG

(42,22)-(42,35)
rand
VarG

(43,22)-(43,35)
rand
VarG

*)

(* type error slice
(23,4)-(43,54)
(23,16)-(43,52)
(27,5)-(43,52)
(27,12)-(27,16)
(28,23)-(28,59)
(28,24)-(28,29)
(28,30)-(28,58)
(28,31)-(28,44)
(28,32)-(28,36)
(43,22)-(43,35)
(43,23)-(43,27)
*)
