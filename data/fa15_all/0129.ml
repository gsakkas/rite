
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

let rec build (rand,depth) =
  if depth > 0
  then
    match rand with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
    | 2 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | _ -> false;;


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
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
    | 2 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 3 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | _ ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  else (match rand (0, 1) with | 0 -> buildX () | _ -> buildY ());;

*)

(* changed spans
(20,5)-(26,17)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

(26,17)-(26,17)
match rand (0 , 1) with
| 0 -> buildX ()
| _ -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(26,19)
(17,16)-(26,17)
(18,3)-(26,17)
(20,5)-(26,17)
(21,12)-(21,21)
(21,12)-(21,49)
(21,22)-(21,49)
(21,23)-(21,28)
(26,12)-(26,17)
(26,17)-(26,17)
*)
