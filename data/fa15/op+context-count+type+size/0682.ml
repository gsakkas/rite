
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

let rec build (rand,depth) =
  let r = ((rand 1), 6) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


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
  match depth with
  | 0 -> buildX ()
  | 1 -> buildY ()
  | _ ->
      let r = rand (1, 6) in
      (match r with
       | 1 -> buildSine (build (rand, (depth - 1)))
       | 2 -> buildCosine (build (rand, (depth - 1)))
       | 3 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 4 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 5 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(21,15)-(33,67)
(22,2)-(33,67)
(22,10)-(22,23)
(22,11)-(22,19)
(22,12)-(22,16)
(22,17)-(22,18)
(33,18)-(33,22)
(33,24)-(33,35)
(33,25)-(33,30)
(33,33)-(33,34)
(33,40)-(33,45)
(33,46)-(33,65)
(33,47)-(33,51)
(33,53)-(33,64)
(33,54)-(33,59)
(33,62)-(33,63)
*)

(* type error slice
(22,2)-(33,67)
(22,10)-(22,23)
(23,2)-(33,67)
(23,2)-(33,67)
(23,2)-(33,67)
(23,2)-(33,67)
(23,2)-(33,67)
(23,2)-(33,67)
(23,2)-(33,67)
(23,2)-(33,67)
(23,2)-(33,67)
(23,2)-(33,67)
(23,8)-(23,9)
*)
