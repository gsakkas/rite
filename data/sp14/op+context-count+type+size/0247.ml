
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
(40,11)-(41,41)
*)

(* type error slice
(17,3)-(17,69)
(17,17)-(17,67)
(39,9)-(39,20)
(39,9)-(41,41)
(40,11)-(41,41)
*)
