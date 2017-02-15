
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
  match depth with
  | 0 -> let num = rand (1, 5) in if num > 3 then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then buildSine (build (rand, (depth - 1)))
      else buildCosine (build (rand, (depth - 1)))
  | 2 ->
      let num = rand (1, 3) in
      if (num mod 2) == 0
      then
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (build (rand, (depth - 1))))
      else
        buildTimes
          ((buildCosine (build (rand, (depth - 1)))),
            (build (rand, (depth - 1))))
  | 3 ->
      buildTimes
        (buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> let num = rand (1, 5) in if num > 3 then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then buildSine (build (rand, (depth - 1)))
      else buildCosine (build (rand, (depth - 1)))
  | 2 ->
      let num = rand (1, 3) in
      if (num mod 2) == 0
      then
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (build (rand, (depth - 1))))
      else
        buildTimes
          ((buildCosine (build (rand, (depth - 1)))),
            (build (rand, (depth - 1))))
  | 3 ->
      buildTimes
        ((buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
          (build (rand, (depth - 1))));;

*)

(* changed spans
(44,8)-(45,70)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(17,3)-(17,41)
(17,16)-(17,39)
(43,6)-(43,16)
(43,6)-(45,70)
(44,8)-(45,70)
(44,9)-(44,21)
*)
