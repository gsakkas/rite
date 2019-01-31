
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let r = rand (0, 2) in match r with | 0 -> buildY () | _ -> buildX ()
  else
    (let r = rand (0, 6) in
     match r with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
     | 3 -> buildTimes ((build (rand, (depth - 1))), (buildX ()))
     | 4 ->
         ((buildThresh
             ((build (rand, (depth - 1))), (buildX ()), (buildY ()))),
           (buildX ())));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSinCos e = SinCos e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let r = rand (0, 2) in match r with | 0 -> buildY () | _ -> buildX ()
  else
    (let r = rand (0, 6) in
     match r with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
     | 3 -> buildTimes ((build (rand, (depth - 1))), (buildX ()))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (buildX ()), (buildY ()),
             (buildX ()))
     | 5 -> buildSinCos (build (rand, (depth - 1))));;

*)

(* changed spans
(16,18)-(16,24)
e
VarG

(16,18)-(16,24)
fun e -> Sine e
LamG (ConAppG (Just VarG) Nothing)

(16,18)-(16,24)
SinCos e
ConAppG (Just VarG) Nothing

(31,5)-(39,23)
match r with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , buildY ())
| 3 -> buildTimes (build (rand , depth - 1) , buildX ())
| 4 -> buildThresh (build (rand , depth - 1) , buildX () , buildY () , buildX ())
| 5 -> buildSinCos (build (rand , depth - 1))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(38,13)-(38,68)
(build (rand , depth - 1) , buildX () , buildY () , buildX ())
TupleG (fromList [AppG (fromList [EmptyG])])

*)
