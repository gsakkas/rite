
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tan of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesMod of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tan of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesModOne of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildTan e = Tan e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildTimesMod (e1,e2,e3) = TimesMod (e1, e2, e3);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 6) with
    | 0 ->
        buildTimesMod
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
    | 1 -> buildTan (build (rand, (depth - 1)))
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
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | _ -> buildY ()
  else
    (match rand (0, 1) with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | _ -> buildX ());;



type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | SineSq of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesModOne of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildSineSq e = SineSq e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 6) with
    | 1 -> buildSineSq (build (rand, (depth - 1)))
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
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | _ -> buildY ()
  else
    (match rand (0, 1) with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | _ -> buildX ());;


(* changed spans
(7,5)-(18,8)
(30,5)-(30,13)
(30,18)-(30,21)
(36,5)-(38,4)
(46,7)-(48,34)
(48,36)-(50,8)
(50,12)-(50,20)
*)

(* type error slice
*)
