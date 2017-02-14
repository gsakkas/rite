
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let r = rand (0, 2) in match r with | 0 -> buildY () | _ -> buildX ()
  else
    (let r = rand (0, 6) in
     match r with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
     | 3 -> buildTimes ((build (rand, (depth - 1))), (buildX ()))
     | 4 ->
         ((buildThresh
             ((build (rand, (depth - 1))), (buildX ()), (buildY ()))),
           (buildX ())));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSinCos e = SinCos e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let r = rand (0, 2) in match r with | 0 -> buildY () | _ -> buildX ()
  else
    (let r = rand (0, 6) in
     match r with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
     | 3 -> buildTimes ((build (rand, (depth - 1))), (buildX ()))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (buildX ()), (buildY ()),
             (buildX ()))
     | 5 -> buildSinCos (build (rand, (depth - 1))));;

*)

(* changed spans
(16,18)-(16,24)
(28,7)-(28,76)
(30,4)-(39,24)
(31,5)-(39,23)
(37,9)-(39,23)
(38,13)-(38,68)
*)

(* type error slice
(16,3)-(16,26)
(16,14)-(16,24)
(16,18)-(16,24)
(18,3)-(18,69)
(18,17)-(18,67)
(31,5)-(39,23)
(31,5)-(39,23)
(32,12)-(32,21)
(32,12)-(32,49)
(37,9)-(39,23)
(37,10)-(38,69)
(37,11)-(37,22)
(38,13)-(38,68)
*)
