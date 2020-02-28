
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
  if depth = 0
  then let r = rand (0, 2) in match r with | 0 -> buildX () | 1 -> buildY ()
  else
    (let r = rand (0, 11) in
     let d = depth - 1 in
     match r with
     | 0 -> buildAverage ((build (rand, d)), (build (rand, d)))
     | 1 -> buildCosine (build (rand, d))
     | 2 -> buildSine (build (rand, d))
     | 3 -> buildTimes ((build (rand, d)), (build (rand, d)))
     | 4 ->
         buildThresh
           ((build (rand, d)), (build (rand, d)), (build (rand, d)),
             (build (rand, d)))
     | 5 -> buildTimes ((build (rand, d)), (build (rand, d)))
     | 6 -> buildSine (build (rand, d))
     | 7 -> buildCosine (build (rand, d))
     | 8 -> buildX (build (rand, d))
     | 9 -> buildSine (build (rand, d))
     | 10 -> buildCosine (build (rand, d)));;


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
  if depth = 0
  then let r = rand (0, 2) in match r with | 0 -> buildX () | 1 -> buildY ()
  else
    (let r = rand (0, 11) in
     let d = depth - 1 in
     match r with
     | 0 -> buildAverage ((build (rand, d)), (build (rand, d)))
     | 1 -> buildCosine (build (rand, d))
     | 2 -> buildSine (build (rand, d))
     | 3 -> buildTimes ((build (rand, d)), (build (rand, d)))
     | 4 ->
         buildThresh
           ((build (rand, d)), (build (rand, d)), (build (rand, d)),
             (build (rand, d)))
     | 5 -> buildTimes ((build (rand, d)), (build (rand, d)))
     | 6 -> buildSine (build (rand, d))
     | 7 -> buildCosine (build (rand, d))
     | 8 -> buildX ()
     | 9 -> buildSine (build (rand, d))
     | 10 -> buildCosine (build (rand, d)));;

*)

(* changed spans
(43,20)-(43,37)
()
ConAppG Nothing

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(11,28)-(11,44)
(11,41)-(11,43)
(21,4)-(21,23)
(21,12)-(21,21)
(32,13)-(32,25)
(32,13)-(32,64)
(32,26)-(32,64)
(32,46)-(32,63)
(32,47)-(32,52)
(43,13)-(43,19)
(43,13)-(43,37)
(43,20)-(43,37)
(43,21)-(43,26)
*)
