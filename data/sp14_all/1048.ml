
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
  let expChooser (r,d) =
    match r with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (d - 1)))
    | 3 -> buildCosine (build (rand, (d - 1)))
    | 4 -> buildAverage ((build (rand, (d - 1))), (build (rand, (d - 1))))
    | 5 -> buildTimes ((build (rand, (d - 1))), (build (rand, (d - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (d - 1))), (build (rand, (d - 1))),
            (build (rand, (d - 1))), (build (rand, (d - 1)))) in
  if depth < 1
  then expChooser rand (0, 2) depth
  else expChooser rand (2, 7) depth;;


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
  let num = if depth < 1 then rand (0, 2) else rand (2, 7) in
  match num with
  | 0 -> buildX ()
  | 1 -> buildY ()
  | 2 -> buildSine (build (rand, (depth - 1)))
  | 3 -> buildCosine (build (rand, (depth - 1)))
  | 4 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(26,3)-(40,36)
let num =
  if depth < 1
  then rand (0 , 2)
  else rand (2 , 7) in
match num with
| 0 -> buildX ()
| 1 -> buildY ()
| 2 -> buildSine (build (rand , depth - 1))
| 3 -> buildCosine (build (rand , depth - 1))
| 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
LetG NonRec (fromList [(VarPatG,IteG EmptyG EmptyG EmptyG)]) (CaseG EmptyG (fromList [(LitPatG,Nothing,EmptyG)]))

*)

(* type error slice
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(26,3)-(40,36)
(26,19)-(37,62)
(27,5)-(37,62)
(28,12)-(28,18)
(28,12)-(28,21)
(39,8)-(39,18)
(39,8)-(39,36)
(40,8)-(40,18)
(40,8)-(40,36)
*)
