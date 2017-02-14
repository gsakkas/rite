
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
  let case = rand (0, 6) in
  if depth = 0
  then
    let case = rand (0, 1) in
    match case with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
    | 4 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


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
  let case = rand (0, 6) in
  match case with
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
(27,2)-(43,69)
(27,5)-(27,10)
(27,5)-(27,14)
(27,13)-(27,14)
(29,4)-(43,69)
(29,15)-(29,19)
(29,15)-(29,26)
(29,20)-(29,26)
(29,21)-(29,22)
(29,24)-(29,25)
(43,41)-(43,68)
*)

(* type error slice
(21,3)-(21,22)
(21,11)-(21,20)
(21,16)-(21,20)
(27,2)-(43,69)
(27,2)-(43,69)
(27,2)-(43,69)
(29,4)-(43,69)
(30,4)-(43,69)
(31,11)-(31,17)
(31,11)-(31,20)
*)
