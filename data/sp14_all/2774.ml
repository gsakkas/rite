
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

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0
  then buildX ()
  else
    (match rand with
     | 0 -> buildSine (build ((rand (0, 6)), (depth - 1)))
     | 1 -> buildCosine (build ((rand (0, 6)), (depth - 1))));;


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
(18,6)-(18,15)
depth <= 0
BopG VarG LitG

(21,5)-(23,62)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 2) , build (rand , depth - 2))
| 3 -> buildTimes (build (rand , depth - 2) , build (rand , depth - 2))
| 4 -> buildThresh (build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4))
| _ -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(17,4)-(23,64)
(17,16)-(23,62)
(21,5)-(23,62)
(21,12)-(21,16)
(22,23)-(22,59)
(22,24)-(22,29)
(22,30)-(22,58)
(22,31)-(22,44)
(22,32)-(22,36)
(23,33)-(23,46)
(23,34)-(23,38)
*)
