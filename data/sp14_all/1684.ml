
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

let rec build (rand,depth) =
  if depth > 0
  then
    let d = depth - 1 in
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, d))
    | 1 -> buildCosine (build (rand, depth))
    | 2 -> buildAverage (build (rand, depth))
    | 3 -> buildTimes (build (rand, depth))
    | 4 -> buildThresh (build (rand, depth));;


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
    let depth = depth - 1 in
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, depth))
    | 1 -> buildCosine (build (rand, depth))
    | 2 -> buildAverage ((build (rand, depth)), (build (rand, depth)))
    | 3 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
    | 4 ->
        buildThresh
          ((build (rand, depth)), (build (rand, depth)),
            (build (rand, depth)), (build (rand, depth)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(24,5)-(30,45)
let depth = depth - 1 in
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth))
| 1 -> buildCosine (build (rand , depth))
| 2 -> buildAverage (build (rand , depth) , build (rand , depth))
| 3 -> buildTimes (build (rand , depth) , build (rand , depth))
| 4 -> buildThresh (build (rand , depth) , build (rand , depth) , build (rand , depth) , build (rand , depth))
LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (CaseG (fromList [(LitPatG,Nothing,EmptyG)]))

(30,45)-(30,45)
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
CaseG (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,68)
(19,4)-(19,42)
(19,17)-(19,40)
(21,4)-(30,47)
(21,16)-(30,45)
(22,3)-(30,45)
(24,5)-(30,45)
(25,5)-(30,45)
(26,12)-(26,21)
(26,12)-(26,39)
(26,22)-(26,39)
(26,23)-(26,28)
(28,12)-(28,24)
(28,12)-(28,46)
(28,25)-(28,46)
(28,26)-(28,31)
(29,12)-(29,22)
(29,12)-(29,44)
(29,23)-(29,44)
(29,24)-(29,29)
(30,12)-(30,23)
(30,12)-(30,45)
(30,24)-(30,45)
(30,25)-(30,30)
(30,45)-(30,45)
*)
