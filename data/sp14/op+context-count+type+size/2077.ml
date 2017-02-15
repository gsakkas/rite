
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Special1 of expr* expr* expr
  | Special2 of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildSpecial1 (e1,e2,e3) = Special1 (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth < 1
  then
    let base = rand (0, 2) in
    match base with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | _ -> (if base < 0 then buildX () else buildY ())
  else
    (let recurse = rand (0, 6) in
     match recurse with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildSpecial1
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ ->
         if recurse > 2
         then buildCosine (build (rand, (depth - 1)))
         else buildSine (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Special1 of expr* expr* expr
  | Special2 of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildSpecial1 (e1,e2,e3) = Special1 (e1, e2, e3);;

let buildSpecial2 (e1,e2) = Special2 (e1, e2);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth < 1
  then
    let base = rand (0, 2) in
    match base with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | _ -> (if base < 0 then buildX () else buildY ())
  else
    (let recurse = rand (0, 6) in
     match recurse with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildSpecial1
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | 6 ->
         buildSpecial2
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ ->
         if recurse > 2
         then buildCosine (build (rand, (depth - 1)))
         else buildSine (build (rand, (depth - 1))));;

*)

(* changed spans
(21,17)-(21,67)
(32,4)-(36,54)
(38,4)-(58,52)
(39,5)-(58,51)
(54,11)-(54,69)
(56,9)-(58,51)
(56,12)-(56,19)
(56,12)-(56,23)
(56,22)-(56,23)
(57,14)-(57,25)
(57,26)-(57,53)
(58,14)-(58,23)
(58,24)-(58,51)
*)

(* type error slice
(19,3)-(19,54)
(19,19)-(19,52)
(53,9)-(53,22)
(53,9)-(54,69)
(54,11)-(54,69)
*)
