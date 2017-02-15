
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
            (build (rand, depth)))
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
(36,10)-(37,34)
(38,7)-(38,65)
(38,55)-(38,61)
(38,62)-(38,64)
*)

(* type error slice
(17,3)-(17,69)
(17,17)-(17,67)
(35,8)-(35,19)
(35,8)-(37,34)
(36,10)-(37,34)
*)
