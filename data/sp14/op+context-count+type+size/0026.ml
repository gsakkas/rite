
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

let rec build (rand,depth) =
  if depth = 0
  then let num = rand (0, 2) in match num with | 0 -> VarX | _ -> VarY
  else
    (let num = rand (0, 5) in
     match num with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 ->
         buildAverage
           ((build (rand, (depth - 1))),
             (buildAverage (build (rand, (depth - 1)))))
     | 2 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ -> buildCosine (build (rand, (depth - 1))));;


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

let rec build (rand,depth) =
  if depth = 0
  then let num = rand (0, 2) in match num with | 0 -> VarX | _ -> VarY
  else
    (let num = rand (0, 5) in
     match num with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 2 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ -> buildCosine (build (rand, (depth - 1))));;

*)

(* changed spans
(29,14)-(29,26)
(29,27)-(29,54)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(25,12)-(25,21)
(25,12)-(25,49)
(25,22)-(25,49)
(25,23)-(25,28)
(29,13)-(29,55)
(29,14)-(29,26)
(29,27)-(29,54)
(29,28)-(29,33)
*)
