
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
    match rand (1, 7) with
    | 1 -> buildX ()
    | 2 -> buildY ()
    | 3 -> buildSine (build (rand, (depth - 1)))
    | 4 -> buildCosine (build (rand, (depth - 1)))
    | 5 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 7 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))));;


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
    match rand (1, 5) with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 4 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  else (match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ());;

*)

(* changed spans
(28,5)-(41,41)
match rand (1 , 5) with
| 1 -> buildSine (build (rand , depth - 1))
| 2 -> buildCosine (build (rand , depth - 1))
| 3 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])

(41,41)-(41,41)
match rand (1 , 2) with
| 1 -> buildX ()
| 2 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(17,4)-(17,70)
(17,18)-(17,68)
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(26,3)-(41,41)
(28,5)-(41,41)
(29,12)-(29,18)
(29,12)-(29,21)
(39,9)-(39,20)
(39,9)-(41,41)
(40,11)-(41,41)
(41,41)-(41,41)
*)
