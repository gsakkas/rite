
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth <= 0
  then
    let bin_rand = rand (1, 2) in
    (if bin_rand = 1 then buildX () else buildY ())
  else
    (let exp_rand = rand (1, 5) in
     let first_forced = build (rand, (depth - 1)) in
     match exp_rand with
     | 1 -> buildSine first_forced
     | 2 -> buildCosine first_forced
     | 3 -> buildAverage (first_forced, (build (rand, (depth - 1))))
     | 4 -> buildTimes (first_forced, (build (rand, (depth - 1))))
     | 5 ->
         buildAverage
           (first_forced, (build (rand, (depth - 1))),
             (build (rand, (depth - 1)))));;


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
  then
    let bin_rand = rand (1, 2) in
    (if bin_rand = 1 then buildX () else buildY ())
  else
    (let exp_rand = rand (1, 5) in
     let first_forced = build (rand, (depth - 1)) in
     match exp_rand with
     | 1 -> buildSine first_forced
     | 2 -> buildCosine first_forced
     | 3 -> buildAverage (first_forced, (build (rand, (depth - 1))))
     | 4 -> buildTimes (first_forced, (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           (first_forced, (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(17,16)-(17,39)
(26,4)-(27,51)
(29,4)-(39,42)
(30,5)-(39,41)
(37,9)-(37,21)
(38,11)-(39,41)
(38,12)-(38,24)
(39,21)-(39,25)
(39,27)-(39,38)
(39,28)-(39,33)
(39,36)-(39,37)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(37,9)-(37,21)
(37,9)-(39,41)
(38,11)-(39,41)
*)
