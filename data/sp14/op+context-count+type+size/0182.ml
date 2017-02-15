
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
  if depth = 0
  then (if (rand (0, 2)) < 1 then buildX () else buildY ())
  else
    (let x = rand (0, 5) in
     if x = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if x = 1
       then buildCosine (build (rand, (depth - 1)))
       else
         if x = 2
         then
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
         else
           if x = 3
           then
             buildTimes
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

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 2)) < 1 then buildX () else buildY ())
  else
    (let x = rand (0, 5) in
     match x with
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
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(17,16)-(17,39)
(27,4)-(42,74)
(28,5)-(42,73)
(28,8)-(28,13)
(28,12)-(28,13)
(31,7)-(42,73)
(31,10)-(31,11)
(31,10)-(31,15)
(31,14)-(31,15)
(34,9)-(42,73)
(34,12)-(34,13)
(34,12)-(34,17)
(34,16)-(34,17)
(39,11)-(42,73)
(39,14)-(39,15)
(39,14)-(39,19)
(39,18)-(39,19)
*)

(* type error slice
(17,3)-(17,41)
(17,16)-(17,39)
(17,25)-(17,39)
(39,11)-(42,73)
(39,11)-(42,73)
(39,11)-(42,73)
(41,13)-(41,23)
(41,13)-(42,73)
*)
