
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
    | 2 -> buildAverage (build (rand, depth))
    | 3 -> buildTimes (build (rand, depth))
    | 4 -> buildThresh (build (rand, depth))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;


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
(32,25)-(32,46)
(build (rand , depth) , build (rand , depth))
TupleG (fromList [AppG (fromList [EmptyG])])

(33,23)-(33,44)
(build (rand , depth) , build (rand , depth))
TupleG (fromList [AppG (fromList [EmptyG])])

(34,24)-(34,45)
(build (rand , depth) , build (rand , depth) , build (rand , depth) , build (rand , depth))
TupleG (fromList [AppG (fromList [EmptyG])])

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
(30,12)-(30,21)
(30,12)-(30,43)
(30,22)-(30,43)
(30,23)-(30,28)
(32,12)-(32,24)
(32,12)-(32,46)
(32,25)-(32,46)
(32,26)-(32,31)
(33,12)-(33,22)
(33,12)-(33,44)
(33,23)-(33,44)
(33,24)-(33,29)
(34,12)-(34,23)
(34,12)-(34,45)
(34,24)-(34,45)
(34,25)-(34,30)
*)
