
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    match rand (0, 1) with | 0 -> buildX () | 1 -> buildY () | _ -> buildX ();;


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
  if depth = 0
  then
    match rand (0, 1) with | 0 -> buildX () | 1 -> buildY () | _ -> buildX ()
  else
    (match rand (0, 7) with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ -> buildX ());;

*)

(* changed spans
(18,78)-(18,78)
match rand (0 , 7) with
| 0 -> buildX ()
| 1 -> buildY ()
| 2 -> buildSine (build (rand , depth - 1))
| 3 -> buildCosine (build (rand , depth - 1))
| 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| _ -> buildX ()
CaseG (AppG [EmptyG]) [(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(WildPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG])]

*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(11,17)-(11,21)
(16,3)-(18,78)
(18,5)-(18,78)
(18,35)-(18,41)
(18,35)-(18,44)
(18,78)-(18,78)
*)
