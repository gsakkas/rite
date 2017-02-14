
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
(29,15)-(29,27)
(29,29)-(29,52)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(25,13)-(25,22)
(25,13)-(25,47)
(25,24)-(25,29)
(25,24)-(25,47)
(29,15)-(29,27)
(29,15)-(29,52)
(29,29)-(29,34)
(29,29)-(29,52)
*)
