
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
  match rand (1, 7) with
  | _ -> buildCosine (VarX, VarY)
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 ->
      buildTimes
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 7 ->
      buildThresh
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))),
          (if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))));;


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
  match rand (1, 7) with
  | _ -> buildCosine VarX
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 ->
      buildTimes
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 7 ->
      buildThresh
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))),
          (if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))));;

*)

(* changed spans
(27,22)-(27,34)
VarX
ConAppG Nothing

*)

(* type error slice
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(27,10)-(27,21)
(27,10)-(27,34)
(27,22)-(27,34)
*)
