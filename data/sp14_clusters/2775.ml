
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
(23,15)-(43,51)
fun () -> VarY
LamG (ConAppG Nothing Nothing)

(23,15)-(43,51)
VarY
ConAppG Nothing Nothing

(27,4)-(43,51)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 2) , build (rand , depth - 2))
| 3 -> buildTimes (build (rand , depth - 2) , build (rand , depth - 2))
| 4 -> buildThresh (build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4))
| _ -> buildY ()
CaseG (AppG [EmptyG]) [(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG])]

(27,11)-(27,15)
rand (0 , 4)
AppG [TupleG [EmptyG,EmptyG]]

(28,12)-(28,58)
0
LitG

(28,12)-(28,58)
4
LitG

(28,12)-(28,58)
(0 , 4)
TupleG [LitG,LitG]

*)
